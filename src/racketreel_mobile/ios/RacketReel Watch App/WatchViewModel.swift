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
    @Published var isTransferring = false;
    
    
    var healthStore: HKHealthStore?
    var workoutSession: HKWorkoutSession?
    
    var updateTransfersTimer: Timer = Timer()
    var transfers: Array<WCSessionUserInfoTransfer> = Array()

    override init() {
        super.init()
        
        updateTransfersTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateTransfers), userInfo: nil, repeats: true)
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    @objc func updateTransfers() {
        // remove all the complete transfers
        transfers.removeAll(where: { !$0.isTransferring })
        
        isTransferring = transfers.count > 0
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Swift.Error?) {}
    
    public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
        // Transfer user info queues up messages and garuantees delivery
        // Note this does not work on a simulator so must be tested on device
        var message = userInfo as! [String: String]
        DispatchQueue.main.async {
            self.teamOneName = message["teamOneName"]!;
            self.teamTwoName = message["teamTwoName"]!;
            self.teamOnePoints = message["teamOnePoints"]!;
            self.teamTwoPoints = message["teamTwoPoints"]!;
            self.teamOneGames = message["teamOneGames"]!;
            self.teamTwoGames = message["teamTwoGames"]!;
            self.teamOneSets = message["teamOneSets"]!;
            self.teamTwoSets = message["teamTwoSets"]!;
            self.isTeamOneServing = message["serving"]! == "1";
            self.lastStateHighlighted = message["lastStateHighlighted"]! == "true";
            self.hasState = true;
            self.isWaitingForState = false;
        }
    }
    
    func pointToTeamOne() {
        let userInfo = [ "Method": "POINT_TO_TEAM_ONE" ]
        WCSession.default.transferUserInfo(userInfo)
        
        self.isWaitingForState = true
    }
    
    func pointToTeamTwo() {
        let userInfo = [ "Method": "POINT_TO_TEAM_TWO" ]
        let transfer = WCSession.default.transferUserInfo(userInfo)
        transfers.append(transfer)
        
        self.isWaitingForState = true
    }
    
    func undoLastPoint() {
        let userInfo = [ "Method": "UNDO" ]
        let transfer = WCSession.default.transferUserInfo(userInfo)
        transfers.append(transfer)
        
        self.isWaitingForState = true
    }
    
    func toggleHighlight() {
        let userInfo = [ "Method": "TOGGLE_HIGHLIGHT" ]
        let transfer = WCSession.default.transferUserInfo(userInfo)
        transfers.append(transfer)
        
        self.isWaitingForState = true
    }
    
    func refreshState() {
        let userInfo = [ "Method": "REFRESH_STATE" ]
        let transfer = WCSession.default.transferUserInfo(userInfo)
        transfers.append(transfer)
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
