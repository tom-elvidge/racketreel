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

    // Handle incoming messages
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let value = message["key"] as? String {
                print("Received message from watch: \(value)")
            }
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Session became inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Session deactivated")
    }
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    
    let eventChannel = FlutterEventChannel(name: "com.racketreel.app/scoring_ec", binaryMessenger: controller.binaryMessenger)
    eventChannel.setStreamHandler(self)
      
    // For demonstration, send a message to Flutter after a delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
        print("send hello from native")
        self.eventSink?("hello from native")
    }
      
    let methodChannel = FlutterMethodChannel(name: "com.racketreel.app/scoring_mc",
                                       binaryMessenger: controller.binaryMessenger)
    methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      guard call.method == "newState" else {
        result(FlutterMethodNotImplemented)
        return
      }
      if let args = call.arguments as? [String: Any] {
        print("Map from Flutter: \(args)")
          if (WCSession.default.isReachable) {
              WCSession.default.sendMessage(args, replyHandler: nil) { (error) in
                  print("Error sending message: \(error.localizedDescription)")
              }
          }
        result("ok")
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Map argument not found", details: nil))
      }
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
