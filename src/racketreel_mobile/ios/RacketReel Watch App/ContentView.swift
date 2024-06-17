import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WatchViewModel

    var body: some View {
        VStack {
            Text(viewModel.receivedMessage)
                .padding()
            Button(action: {
                viewModel.sendMessageToiOS()
            }) {
                Text("Send Message to iOS")
            }
        }
    }
}
