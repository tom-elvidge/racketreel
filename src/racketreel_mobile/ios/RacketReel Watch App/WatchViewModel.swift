import Foundation
import WatchConnectivity
import HealthKit

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
    @Published var showHelp = false;
    @Published var showQuitConfirmation = false;
    @Published var isWaitingForState = false;
    @Published var isRecordingWorkout = false;
    
    
    var healthStore: HKHealthStore?
    var workoutSession: HKWorkoutSession?

    override init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Swift.Error?) {
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
                self.isWaitingForState = false;
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
                self.isWaitingForState = false;
            }
        }
    }
    
    func pointToTeamOne() {
        if WCSession.default.isReachable {
            let message = ["key": "pointToTeamOne"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
            self.isWaitingForState = true;
        }
    }
    
    func pointToTeamTwo() {
        if WCSession.default.isReachable {
            let message = ["key": "pointToTeamTwo"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
            self.isWaitingForState = true;
        }
    }
    
    func undoLastPoint() {
        if WCSession.default.isReachable {
            let message = ["key": "undo"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
            self.isWaitingForState = true;
        }
    }
    
    func toggleHighlight() {
        if WCSession.default.isReachable {
            let message = ["key": "toggleHighlight"]
            WCSession.default.sendMessage(message, replyHandler: nil) { (error) in
                print("Error sending message: \(error.localizedDescription)")
            }
            self.isWaitingForState = true;
        }
    }
    
    func toggleShowHelp() {
        showHelp = !showHelp
    }
    
    func toggleShowQuitConfirmation() {
        showQuitConfirmation = !showQuitConfirmation
    }
    
    func quit() {
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
        self.showQuitConfirmation = false;
        self.showHelp = false;
        
        endWorkout()
    }
    
    func stopWaitingForState() {
        isWaitingForState = false;
    }
    
    func startWorkout() {
        // Request access to write health data
        if (self.healthStore == nil && HKHealthStore.isHealthDataAvailable()) {
            self.healthStore = HKHealthStore()

            self.healthStore!.requestAuthorization(toShare: [HKQuantityType.workoutType()], read: nil) { (success, error) in
                guard success else {
                    return
                }
            }
        }
        
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .tennis
        configuration.locationType = .unknown
        
        do {
            self.workoutSession = try HKWorkoutSession(healthStore: self.healthStore!, configuration: configuration)
            let builder = self.workoutSession!.associatedWorkoutBuilder()
            builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore!, workoutConfiguration: configuration)
            
            self.workoutSession!.startActivity(with: Date())
            builder.beginCollection(withStart: Date()) { (success, error) in
                guard success else {
                    return
                }
            }
        } catch {
            print("Cannot start workout")
            return
        }
        
        isRecordingWorkout = true
    }
    
    func endWorkout() {
        if (workoutSession == nil) {
            isRecordingWorkout = false
            return;
        }
        
        self.workoutSession!.end()
        let builder = self.workoutSession!.associatedWorkoutBuilder()
        builder.endCollection(withEnd: Date()) { (success, error) in
            guard success else {
                return
            }
            
            builder.finishWorkout { (workout, error) in
                guard workout != nil else {
                    return
                }
            }
        }
        
        isRecordingWorkout = false
    }
}
