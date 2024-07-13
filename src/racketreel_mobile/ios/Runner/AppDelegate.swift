import UIKit
import Flutter
import WatchConnectivity

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, WCSessionDelegate {
    private var eventSink: FlutterEventSink?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
            return
        }
        print("WCSession activated with state: \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            let value = message["key"] as? String;
            
            if (value == nil) {
                return;
            }
            
            if (value == "pointToTeamOne" ||
                value == "pointToTeamTwo" ||
                value == "undo" ||
                value == "toggleHighlight") {
                self.eventSink?(value)
                return;
            }
            
            print("unhandled message: \(value!)")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Session became inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Session deactivated")
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        
        // Event Channel for sending messages to Flutter
        
        let eventChannel = FlutterEventChannel(name: "com.racketreel.app/scoring_ec", binaryMessenger: controller.binaryMessenger)
        eventChannel.setStreamHandler(self)
        
        // Method Channel for receiving messages from Flutter
        
        let methodChannel = FlutterMethodChannel(name: "com.racketreel.app/scoring_mc", binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if (call.method != "newState") {
                result(FlutterMethodNotImplemented)
                return
            }
            
            let args = call.arguments as? [String: String]
            
            if (args == nil) {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Could not cast args", details: nil))
                return;
            }
            
            if (!WCSession.default.isReachable) {
                result("ok")
                return;
            }
            
            WCSession.default.sendMessage(args!, replyHandler: nil) { (error) in
                result(FlutterError(code: "WC_ERROR", message: "Could not forward message to watch", details: error))
                return;
            }
            
            result("ok")
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension AppDelegate: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }
}
