import Flutter
import UIKit

public class AMapFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.register(AMapFactory(registrar: registrar), withId: "amap_flutter")
    _AMapSdkApi.setup(registrar: registrar)
  }
}
