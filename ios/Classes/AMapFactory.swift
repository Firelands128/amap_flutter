import Flutter

class AMapFactory: NSObject, FlutterPlatformViewFactory {
  let registrar: FlutterPluginRegistrar

  init(registrar: FlutterPluginRegistrar) {
    self.registrar = registrar
  }

  func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments: Any?) -> FlutterPlatformView {
    AMapFlutter(frame: frame, viewId: viewId, registrar: registrar, args: arguments as? [String: Any?])
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }
}
