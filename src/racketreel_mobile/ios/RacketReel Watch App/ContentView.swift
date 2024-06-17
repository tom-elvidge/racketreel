import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WatchViewModel

    var body: some View {
        if (viewModel.hasState) {
            ScrollView {
                Text("\(viewModel.teamOneName) \(viewModel.teamOneSets) \(viewModel.teamOneGames) \(viewModel.teamOnePoints)")
                    .padding()
                Text("\(viewModel.teamTwoName) \(viewModel.teamTwoSets) \(viewModel.teamTwoGames) \(viewModel.teamTwoPoints)")
                    .padding()
                Button(action: {
                    viewModel.pointToTeamOne()
                }) {
                    Text("Point to \(viewModel.teamOneName)")
                }
                Button(action: {
                    viewModel.pointToTeamTwo()
                }) {
                    Text("Point to \(viewModel.teamTwoName)")
                }
                Button(action: {
                    viewModel.undoLastPoint()
                }) {
                    Text("Undo")
                }
                Button(action: {
                    viewModel.toggleHighlight()
                }) {
                    Text(viewModel.lastStateHighlighted ? "Remove Highlight" : "Highlight")
                }
            }
        } else {
            VStack{
                Text("Start a match from your phone")
                    .padding()
            }
        }
    }
}
