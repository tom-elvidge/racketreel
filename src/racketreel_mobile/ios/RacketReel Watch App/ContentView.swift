import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WatchViewModel
    
    @State private var debounce_timer: Timer?
    @State private var cancel_wait_timer: Timer?
    
    let helpItems = [
        "Swipe up to score a point to team one",
        "Swipe down to score a point to team two",
        "Double tap to higlight the last point"
    ]
    
    var body: some View {
        if (viewModel.showQuitConfirmation) {
            VStack {
                Text("Stop scoring?")
                    .multilineTextAlignment(.center)
                    .padding()
                Button(action: { viewModel.quit()}) {
                    Text("Yes")
                }
                Button(action: { viewModel.toggleShowQuitConfirmation()}) {
                    Text("No")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if (viewModel.showHelp) {
            ScrollView{
                VStack(alignment: .leading) {
                    ForEach(helpItems, id: \.self) { item in
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .padding(.trailing, 4)
                            Text(item)
                        }
                        .padding(.bottom, 2)
                    }
                    Button(action: { viewModel.toggleShowHelp() }) {
                        Text("Done")
                    }
                    .padding(.top, 4)
                    Button(action: { viewModel.isRecordingWorkout
                        ? viewModel.endWorkout()
                        : viewModel.startWorkout() }) {
                        Text(viewModel.isRecordingWorkout ? "End workout" : "Start workout")
                    }
                }
            }
        }
        else if (viewModel.hasState) {
            VStack(alignment: .center) {
                if (viewModel.lastStateHighlighted) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 10))
                        Text("Point highlighted")
                            .font(.system(size: 12))
                    }
                }
                if (viewModel.isRecordingWorkout) {
                    HStack {
                        Image(systemName: "waveform.path.ecg")
                            .font(.system(size: 10))
                        Text("Recording workout")
                            .font(.system(size: 12))
                    }
                }
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(height: 60)
                    .padding()
                    .overlay(
                        HStack {
                            // Serving indicator
                            VStack {
                                Image(systemName: "tennisball.fill")
                                    .font(.system(size: 10))
                                    .opacity(viewModel.isTeamOneServing ? 1 : 0)
                                    .frame(height: 20)
                                Image(systemName: "tennisball.fill")
                                    .font(.system(size: 10))
                                    .opacity(viewModel.isTeamOneServing ? 0 : 1)
                                    .frame(height: 20)
                            }
                            // Names
                            VStack (alignment: .leading) {
                                Text(viewModel.teamOneName)
                                    .font(.system(size: 14))
                                    .frame(height: 20)
                                Text(viewModel.teamTwoName)
                                    .font(.system(size: 14))
                                    .frame(height: 20)
                            }
                            Spacer()
                            // Sets
                            VStack {
                                Text(viewModel.teamOneSets)
                                    .frame(width: 15, height: 20)
                                Text(viewModel.teamTwoSets)
                                    .frame(width: 15, height: 20)
                            }
                            // Games
                            VStack {
                                Text(viewModel.teamOneGames)
                                    .frame(width: 15, height: 20)
                                Text(viewModel.teamTwoGames)
                                    .frame(width: 15, height: 20)
                            }
                            // Points
                            VStack {
                                Text(viewModel.teamOnePoints)
                                    .frame(width: 25, height: 20)
                                Text(viewModel.teamTwoPoints)
                                    .frame(width: 25, height: 20)
                            }
                        }
                            .padding(14)
                    )
                Spacer()
                HStack {
                    Button(action: { viewModel.toggleShowQuitConfirmation() }) {
                        Image(systemName: "xmark")
                    }
                    Button(action: { viewModel.undoLastPoint() }) {
                        Image(systemName: "arrow.uturn.backward")
                    }
                    Button(action: { viewModel.toggleShowHelp() }) {
                        Image(systemName: "questionmark")
                    }
                }
                    .padding()
                    .padding(.horizontal)
            }
                .overlay(
                    Group {
                        if (viewModel.isWaitingForState) {
                            Color.black.opacity(0.4)
                                .edgesIgnoringSafeArea(.all)
                                .overlay(
                                    VStack {
                                        ProgressView()
                                            .padding()
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                    }
                                )
                                // only show the waiting indicator for max 10s
                                .onAppear{
                                    cancel_wait_timer?.invalidate()
                                    cancel_wait_timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
                                        viewModel.stopWaitingForState()
                                    }
                                }
                        }
                    }
                )
                .edgesIgnoringSafeArea(.bottom)
                .background(Color.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            debounce_timer?.invalidate()
                            debounce_timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                                if (value.translation.height > (WKInterfaceDevice.current().screenBounds.height / 4)) {
                                    WKInterfaceDevice.current().play(.click)
                                    viewModel.pointToTeamTwo()
                                }
                                
                                if (value.translation.height < -(WKInterfaceDevice.current().screenBounds.height / 4)) {
                                    WKInterfaceDevice.current().play(.click)
                                    viewModel.pointToTeamOne()
                                }
                            }
                        }
                )
                .onTapGesture(count: 2) {
                    WKInterfaceDevice.current().play(.click)
                    viewModel.toggleHighlight()
                }
        } else {
            VStack{
                Text("Create a match from your phone")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WatchViewModel()
        viewModel.hasState = true;
        viewModel.teamOneName = "Team A"
        viewModel.teamTwoName = "Team B"
        viewModel.teamOnePoints = "30"
        viewModel.teamTwoPoints = "15"
        viewModel.teamOneGames = "2"
        viewModel.teamTwoGames = "1"
        viewModel.teamOneSets = "1"
        viewModel.teamTwoSets = "0"
        viewModel.isTeamOneServing = true
        viewModel.lastStateHighlighted = true
        viewModel.hasState = true
        viewModel.isWaitingForState = false
        viewModel.showHelp = false
        viewModel.showQuitConfirmation = false
        viewModel.isRecordingWorkout = true
        
        return ContentView()
            .environmentObject(viewModel)
    }
}
