import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WatchViewModel

    var body: some View {
        if (viewModel.hasState) {
            VStack {
                HStack {
                    VStack {
                        HStack {
                            Text(viewModel.teamOneName)
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .opacity(viewModel.isTeamOneServing ? 1 : 0)
                        }
                        HStack {
                            Text(viewModel.teamTwoName)
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .opacity(viewModel.isTeamOneServing ? 0 : 1)
                        }
                    }
                    // Sets
                    VStack {
                        Text(viewModel.teamOneSets)
                        Text(viewModel.teamTwoSets)
                    }
                    // Games
                    VStack {
                        Text(viewModel.teamOneGames)
                        Text(viewModel.teamTwoGames)
                    }
                    // Points
                    VStack {
                        Text(viewModel.teamOnePoints)
                        Text(viewModel.teamTwoPoints)
                    }
                }
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
            .overlay(alignment: .topLeading) {
                Image(systemName: viewModel.lastStateHighlighted ? "heart.fill" : "heart")
            }
        } else {
            VStack{
                Text("Start a match from your phone")
                    .padding()
            }
        }
    }
}
