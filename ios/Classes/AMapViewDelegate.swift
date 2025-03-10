//
//  AMapViewDelegate.swift
//  amap
//
//  Created by Wenqi Li on 2023/8/22.
//

import Foundation
import Flutter
import MAMapKit

class AMapViewDelegate: NSObject, MAMapViewDelegate {
  let registrar: FlutterPluginRegistrar
  let mapView: MAMapView
  let controller: AMapController

  init(_ registrar: FlutterPluginRegistrar, mapView: MAMapView, controller: AMapController) {
    self.registrar = registrar
    self.mapView = mapView
    self.controller = controller
  }

  func mapView(_ mapView: MAMapView!, viewFor _annotation: MAAnnotation!) -> MAAnnotationView! {
    if let annotation = _annotation as? Annotation {
      let annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: annotation.id)
      if let bitmap = annotation.bitmap {
        let image = bitmap.toUIImage(registrar: registrar)
        let targetSize = CGSize(width: bitmap.size.width, height: bitmap.size.height)
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let resizedImage = renderer.image { _ in
          image?.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        annotationView?.image = resizedImage
        annotationView?.centerOffset = CGPointMake(0, -bitmap.size.height / 2);
      }
      annotationView?.canShowCallout = true
      annotationView?.isDraggable = true
      annotationView?.animatesDrop = false
      return annotationView
    }
    return nil
  }

  /// 地图初始化完成（在此之后，可以进行坐标计算）
  func mapInitComplete(_ mapView: MAMapView!) {
    controller.onMapInitComplete()
  }

  /// 地图开始加载
  func mapViewWillStartLoadingMap(_ mapView: MAMapView!) {
    NSLog("mapViewWillStartLoadingMap")
  }

  /// 地图加载成功
  func mapViewDidFinishLoadingMap(_ mapView: MAMapView!) {
    controller.onMapCompleted()
  }

  /// 地图加载失败
  func mapViewDidFailLoadingMap(_ mapView: MAMapView!, withError error: Error!) {
    NSLog("mapViewDidFailLoadingMap")
  }

  /// 单击地图回调，返回经纬度
  func mapView(_ mapView: MAMapView!, didSingleTappedAt coordinate: CLLocationCoordinate2D) {
    controller.onMapPress(position: coordinate.position)
  }

  /// 长按地图，返回经纬度
  func mapView(_ mapView: MAMapView!, didLongPressedAt coordinate: CLLocationCoordinate2D) {
    controller.onMapLongPress(position: coordinate.position)
  }

  /// 地图区域改变过程中会调用此接口 since 4.6.0
  func mapViewRegionChanged(_ mapView: MAMapView!) {
    controller.onCameraChange(camera: mapView.cameraPosition)
  }

  /// 地图区域即将改变时会调用此接口，如实现此接口则不会触发回掉mapView:regionWillChangeAnimated:
  func mapView(_ mapView: MAMapView!, regionWillChangeAnimated animated: Bool, wasUserAction: Bool) {
    controller.onCameraChangeStart(camera: mapView.cameraPosition)
  }

  /// 地图区域改变完成后会调用此接口，如实现此接口则不会触发回掉mapView:regionDidChangeAnimated:
  func mapView(_ mapView: MAMapView!, regionDidChangeAnimated animated: Bool, wasUserAction: Bool) {
    controller.onCameraChangeFinish(camera: mapView.cameraPosition)
  }

  /// 地图将要发生移动时调用此接口
  func mapView(_ mapView: MAMapView!, mapWillMoveByUser wasUserAction: Bool) {
    controller.onMapMoveStart(position: mapView.position)
  }

  /// 地图移动结束后调用此接口
  func mapView(_ mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
    controller.onMapMoveEnd(position: mapView.position)
  }

  /// 地图将要发生缩放时调用此接口
  func mapView(_ mapView: MAMapView!, mapWillZoomByUser wasUserAction: Bool) {
    controller.onZoomChangeStart(zoom: mapView.zoomLevel)
  }

  /// 地图缩放结束后调用此接口
  func mapView(_ mapView: MAMapView!, mapDidZoomByUser wasUserAction: Bool) {
    controller.onZoomChangeEnd(zoom: mapView.zoomLevel)
  }

  /// 当touchPOIEnabled == YES时，单击地图使用该回调获取POI信息
  func mapView(_ mapView: MAMapView!, didTouchPois pois: [Any]!) {
    controller.onPoiClick(poi: (pois.first as! MATouchPoi).poi)
  }

  /// 当mapView新添加annotation views时，调用此接口
  func mapView(_ mapView: MAMapView!, didAddAnnotationViews views: [Any]!) {
    NSLog("didAddAnnotationViews")
  }

  /// 当选中一个annotation view时，调用此接口. 注意如果已经是选中状态，再次点击不会触发此回调
  func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
    NSLog("didSelect")
  }

  /// 当取消选中一个annotation view时，调用此接口
  func mapView(_ mapView: MAMapView!, didDeselect view: MAAnnotationView!) {
    NSLog("didDeselect")
  }

  /// 拖动annotation view时view的状态变化
  func mapView(_ mapView: MAMapView!, annotationView view: MAAnnotationView!, didChange newState: MAAnnotationViewDragState, fromOldState oldState: MAAnnotationViewDragState) {
    let id = view.reuseIdentifier!
    let position = view.annotation.coordinate.position
    if(oldState == .none && newState == .starting) {
      controller.onMarkerDragStart(markerId: id, position: position)
    } else if(oldState == .dragging && newState == .dragging) {
      controller.onMarkerDrag(markerId: id, position: position)
    } else if(oldState == .dragging && (newState == .canceling || newState == .ending)) {
      controller.onMarkerDragEnd(markerId: id, position: position)
    }
  }

  /// 标注view被点击时，触发该回调。（since 5.7.0）
  func mapView(_ mapView: MAMapView!, didAnnotationViewTapped view: MAAnnotationView!) {
    controller.onMarkerClick(view.annotation.hash)
  }

  /// 标注view的calloutview整体点击时，触发该回调。只有使用默认calloutview时才生效。
  func mapView(_ mapView: MAMapView!, didAnnotationViewCalloutTapped view: MAAnnotationView!) {
    NSLog("didAnnotationViewCalloutTapped")
  }

  /// 标注view的accessory view(必须继承自UIControl)被点击时，触发该回调
  func mapView(_ mapView: MAMapView!, annotationView view: MAAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
    NSLog("calloutAccessoryControlTapped")
  }

  /// 当plist配置NSLocationAlwaysUsageDescription或者NSLocationAlwaysAndWhenInUseUsageDescription，并且[CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined，会调用代理的此方法。
  /// 此方法实现调用后台权限API即可（ 该回调必须实现 [locationManager requestAlwaysAuthorization] ）; since 6.8.0
  func mapViewRequireLocationAuth(_ locationManager: CLLocationManager!) {
    locationManager.requestWhenInUseAuthorization()
  }

  /// 位置或者设备方向更新后，会调用此函数
  func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
    controller.onUserLocationChange(location: userLocation.toLocation)
  }

  /// 在地图View将要启动定位时，会调用此函数
  func mapViewWillStartLocatingUser(_ mapView: MAMapView!) {
    NSLog("mapViewWillStartLocatingUser")
  }

  /// 在地图View停止定位后，会调用此函数
  func mapViewDidStopLocatingUser(_ mapView: MAMapView!) {
    NSLog("mapViewDidStopLocatingUser")
  }

  /// 定位失败后，会调用此函数
  func mapView(_ mapView: MAMapView!, didFailToLocateUserWithError error: Error!) {
    NSLog("didFailToLocateUserWithError")
  }

  /// 当userTrackingMode改变时，调用此接口
  func mapView(_ mapView: MAMapView!, didChange mode: MAUserTrackingMode, animated: Bool) {
    NSLog("didChange:MAUserTrackingMode")
  }

//  /// 根据overlay生成对应的Renderer
//  func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
//    <#code#>
//  }

  /// 当mapView新添加overlay renderers时，调用此接口
  func mapView(_ mapView: MAMapView!, didAddOverlayRenderers overlayRenderers: [Any]!) {
    NSLog("didAddOverlayRenderers")
  }

  /// 地形图加载失败
  func mapView(_ mapView: MAMapView!, didFailLoadTerrainWithError error: Error!) {
    NSLog("didFailLoadTerrainWithError")
  }

  /// 室内地图出现,返回室内地图信息
  func mapView(_ mapView: MAMapView!, didIndoorMapShowed indoorInfo: MAIndoorInfo!) {
    NSLog("didIndoorMapShowed")
  }

  /// 室内地图楼层发生变化,返回变化的楼层
  func mapView(_ mapView: MAMapView!, didIndoorMapFloorIndexChanged indoorInfo: MAIndoorInfo!) {
    NSLog("didIndoorMapFloorIndexChanged")
  }

  /// 室内地图消失后,返回室内地图信息
  func mapView(_ mapView: MAMapView!, didIndoorMapHidden indoorInfo: MAIndoorInfo!) {
    NSLog("didIndoorMapHidden")
  }

  /// 离线地图数据将要被加载, 调用reloadMap会触发该回调，离线数据生效前的回调.
  func offlineDataWillReload(_ mapView: MAMapView!) {
    NSLog("offlineDataWillReload")
  }

  /// 离线地图数据加载完成, 调用reloadMap会触发该回调，离线数据生效后的回调.
  func offlineDataDidReload(_ mapView: MAMapView!) {
    NSLog("offlineDataDidReload")
  }
}
