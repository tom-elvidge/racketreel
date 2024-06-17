import Foundation
import WatchConnectivity

class WatchViewModel: NSObject, ObservableObject, WCSessionDelegate {
    @Published var receivedMessage = "No message yet"

    override init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    // Handle session activation
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
            return
        }
        print("WCSession activated with state: \(activationState.rawValue)")
    }

    // Handle incoming messages
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            print("received a message")
            if let value = message["teamOnePoints"] as? String {
                self.receivedMessage = "Team one points: \(value)"
                print("Team one points: \(value)")
            }
        }
    }

    // Send a message to the iOS app
    func sendMessageToiOS() {
        if WCSession.default.isReachable {
            let message = ["key": "Hello from watchOS"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
}
