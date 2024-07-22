import UIKit
import Flutter
import WatchConnectivity

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {}
    
    func sessionDidBecomeInactive(_ session: WCSession) {}
    
    func sessionDidDeactivate(_ session: WCSession) {}
    
    private var eventSink: FlutterEventSink?
    
    override init() {
        super.init()
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
        // Try send the message over the event channel
        // Can do application level retries if needed here but should be stable
        self.eventSink?(userInfo)
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
            print("update...")
            
            if (call.method != "UPDATE_STATE") {
                let response = [ "Success": "false", "Error": "METHOD_NOT_IMPLEMENTED" ]
                result(response)
                return
            }
            
            let args = call.arguments as? [String: String]
            
            if (args == nil) {
                let response = [ "Success": "false", "Error": "ARGUMENT_ERROR" ]
                result(response)
                return;
            }
            
            // Message will be queued up for garuanteed delivery
            // Can use the returned transfer object to cancel if needed
            WCSession.default.transferUserInfo(args!)
            
            let response = [ "Success": "true" ]
            result(response)
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
