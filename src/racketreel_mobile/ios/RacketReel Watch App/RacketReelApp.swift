import SwiftUI
import WatchConnectivity

@main
struct RacketReel_Watch_AppApp: App {
    @StateObject private var viewModel = WatchViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
