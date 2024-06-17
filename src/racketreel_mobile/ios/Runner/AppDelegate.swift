import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  private var eventSink: FlutterEventSink?
    
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
