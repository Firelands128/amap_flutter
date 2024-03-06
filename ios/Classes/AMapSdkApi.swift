import Flutter
import MAMapKit

class _AMapSdkApi: NSObject {
  static func setup(registrar: FlutterPluginRegistrar) {
    let initializerChannel = FlutterMethodChannel(name: "plugins.flutter.dev/amap_initializer", binaryMessenger: registrar.messenger())
    initializerChannel.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if(call.method == "agreePrivacy") {
        let arguments = call.arguments as! Dictionary<String, AnyObject>
        let agree = arguments["agree"] as! Bool
        _AMapSdkApi.agreePrivacy(agreePrivacy: agree)
        result(nil)
      } else if(call.method == "setApiKey") {
        let arguments = call.arguments as! Dictionary<String, AnyObject>
        let apiKey = arguments["iosKey"] as! String
        _AMapSdkApi.setApiKey(apiKey: apiKey)
        result(nil)
      }
    })
  }

  static func agreePrivacy(agreePrivacy: Bool) {
    MAMapView.updatePrivacyShow(AMapPrivacyShowStatus.init(agreePrivacy), privacyInfo: AMapPrivacyInfoStatus.init(agreePrivacy))
    MAMapView.updatePrivacyAgree(AMapPrivacyAgreeStatus.init(agreePrivacy))
  }

  static func setApiKey(apiKey: String) {
    AMapServices.shared().apiKey = apiKey
  }
}

