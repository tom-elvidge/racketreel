import Foundation
import WatchConnectivity

class WatchViewModel: NSObject, ObservableObject, WCSessionDelegate {
    @Published var hasState = false;
    @Published var teamOneName = "";
    @Published var teamTwoName = "";
    @Published var teamOnePoints = "";
    @Published var teamTwoPoints = "";
    @Published var teamOneGames = "";
    @Published var teamTwoGames = "";
    @Published var teamOneSets = "";
    @Published var teamTwoSets = "";
    @Published var isTeamOneServing = false;
    @Published var lastStateHighlighted = false;

    override init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
            return
        }
        print("WCSession activated with state: \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            do {
                self.teamOneName = message["teamOneName"] as! String;
                self.teamTwoName = message["teamTwoName"] as! String;
                self.teamOnePoints = message["teamOnePoints"] as! String;
                self.teamTwoPoints = message["teamTwoPoints"] as! String;
                self.teamOneGames = message["teamOneGames"] as! String;
                self.teamTwoGames = message["teamTwoGames"] as! String;
                self.teamOneSets = message["teamOneSets"] as! String;
                self.teamTwoSets = message["teamTwoSets"] as! String;
                self.isTeamOneServing = message["serving"] as! String == "1";
                self.lastStateHighlighted = message["lastStateHighlighted"] as! String == "true";
                self.hasState = true;
            } catch {
                self.teamOneName = "";
                self.teamTwoName = "";
                self.teamOnePoints = "";
                self.teamTwoPoints = "";
                self.teamOneGames = "";
                self.teamTwoGames = "";
                self.teamOneSets = "";
                self.teamTwoSets = "";
                self.isTeamOneServing = false;
                self.lastStateHighlighted = false;
                self.hasState = false;
            }
        }
    }
    
    func pointToTeamOne() {
        if WCSession.default.isReachable {
            let message = ["key": "pointToTeamOne"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
    func pointToTeamTwo() {
        if WCSession.default.isReachable {
            let message = ["key": "pointToTeamTwo"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
    func undoLastPoint() {
        if WCSession.default.isReachable {
            let message = ["key": "undo"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
    func toggleHighlight() {
        if WCSession.default.isReachable {
            let message = ["key": "toggleHighlight"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
}
