import Flutter
import UIKit

public class SwiftFlutterQiniuPiliPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_qiniu_pili", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterQiniuPiliPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
