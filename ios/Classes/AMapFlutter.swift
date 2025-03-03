import Flutter
import MAMapKit

class AMapFlutter: NSObject, FlutterPlatformView {
  private let mapView: MAMapView
  private let mapViewDelegate: AMapViewDelegate

  init(frame: CGRect, viewId: Int64, registrar: FlutterPluginRegistrar, args: [String: Any?]?) {
    var mapInitConfig: MapInitConfig?
    if(args != nil) {
      if let options = args!["options"] as? [Any?] {
        mapInitConfig = MapInitConfig.fromList(options)
      }
    }
    mapView = MAMapView(frame: frame)
    let api = _AMapApi(registrar: registrar, mapView: mapView, mapInitConfig: mapInitConfig)
    let controller = AMapController(viewId: viewId, registrar: registrar, api: api)
    mapViewDelegate = AMapViewDelegate(registrar, mapView: mapView, controller: controller)
    super.init()
    mapView.delegate = mapViewDelegate
    mapView.showsUserLocation = false
  }

  func view() -> UIView {
    mapView
  }
}
