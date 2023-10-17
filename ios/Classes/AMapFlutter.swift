import Flutter
import MAMapKit

class AMapFlutter: NSObject, FlutterPlatformView {
  private let mapView: MAMapView
  private let mapViewDelegate: AMapViewDelegate

  init(frame: CGRect, viewId: Int64, registrar: FlutterPluginRegistrar, args: [String: Any?]?) {
    mapView = MAMapView(frame: frame)
    let api = _AMapApi(registrar: registrar, mapView: mapView)
    let controller = AMapController(viewId: viewId, registrar: registrar, api: api)
    mapViewDelegate = AMapViewDelegate(registrar, mapView: mapView, controller: controller)
    super.init()
    mapView.delegate = mapViewDelegate
    mapView.showsUserLocation = false

    if(args != nil) {
      if let options = args!["options"] as? [Any?] {
        let config = MapInitConfig.fromList(options)
        controller.initMap(config)
      }
    }
  }

  func view() -> UIView {
    mapView
  }
}
