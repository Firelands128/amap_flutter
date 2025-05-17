part of '../amap_flutter.dart';

/// Controller for a single AMap instance running on the host platform,
/// which passed in [AMapFlutter.onMapCreated] callback.
class AMapController {
  AMapController(this._aMapFlutter, {required this.mapId}) {
    _connectStreams(mapId);
  }

  /// The mapId for this controller
  final int mapId;

  /// The map state for a single AMap instance
  AMapFlutter? _aMapFlutter;

  // 存储所有的 Stream 订阅
  final List<StreamSubscription> _subscriptions = [];

  void _connectStreams(int mapId) {
    if (_aMapFlutter?.onMapInitComplete != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapInitComplete(mapId: mapId)
            .listen(
              (MapInitCompleteEvent e) => _aMapFlutter?.onMapInitComplete!(),
            ),
      );
    }
    if (_aMapFlutter?.onMapCompleted != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapCompleted(mapId: mapId)
            .listen((MapCompleteEvent e) => _aMapFlutter?.onMapCompleted!()),
      );
    }
    if (_aMapFlutter?.onMapPress != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapPress(mapId: mapId)
            .listen((MapPressEvent e) => _aMapFlutter?.onMapPress!(e.position)),
      );
    }
    if (_aMapFlutter?.onMapDoublePress != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapDoublePress(mapId: mapId)
            .listen(
              (MapDoublePressEvent e) =>
                  _aMapFlutter?.onMapDoublePress!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMapRightPress != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapRightPress(mapId: mapId)
            .listen(
              (MapRightPressEvent e) =>
                  _aMapFlutter?.onMapRightPress!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMapLongPress != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapLongPress(mapId: mapId)
            .listen(
              (MapLongPressEvent e) =>
                  _aMapFlutter?.onMapLongPress!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onCameraChange != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onCameraChange(mapId: mapId)
            .listen(
              (CameraChangeEvent e) => _aMapFlutter?.onCameraChange!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onCameraChangeStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onCameraChangeStart(mapId: mapId)
            .listen(
              (CameraChangeStartEvent e) =>
                  _aMapFlutter?.onCameraChangeStart!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onCameraChangeFinish != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onCameraChangeFinish(mapId: mapId)
            .listen(
              (CameraChangeFinishEvent e) =>
                  _aMapFlutter?.onCameraChangeFinish!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onMapMoveStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapMoveStart(mapId: mapId)
            .listen(
              (MapMoveStartEvent e) =>
                  _aMapFlutter?.onMapMoveStart!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMapMove != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMapMove(mapId: mapId)
            .listen((MapMoveEvent e) => _aMapFlutter?.onMapMove!(e.position)),
      );
    }
    if (_aMapFlutter?.onMapMoveEnd != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMapMoveEnd(mapId: mapId).listen(
              (MapMoveEndEvent e) => _aMapFlutter?.onMapMoveEnd!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMapResized != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMapResized(mapId: mapId).listen(
              (MapResizedEvent event) =>
                  _aMapFlutter?.onMapResized!(event.value),
            ),
      );
    }
    if (_aMapFlutter?.onZoomChange != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onZoomChange(mapId: mapId).listen(
              (ZoomChangeEvent e) => _aMapFlutter?.onZoomChange!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onZoomChangeStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onZoomChangeStart(mapId: mapId)
            .listen(
              (ZoomChangeStartEvent e) =>
                  _aMapFlutter?.onZoomChangeStart!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onZoomChangeEnd != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onZoomChangeEnd(mapId: mapId)
            .listen(
              (ZoomChangeEndEvent e) => _aMapFlutter?.onZoomChangeEnd!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onRotateChange != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onRotateChange(mapId: mapId)
            .listen(
              (RotateChangeEvent e) => _aMapFlutter?.onRotateChange!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onRotateChangeStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onRotateChangeStart(mapId: mapId)
            .listen(
              (RotateChangeStartEvent e) =>
                  _aMapFlutter?.onRotateChangeStart!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onRotateChangeEnd != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onRotateChangeEnd(mapId: mapId)
            .listen(
              (RotateChangeEndEvent e) =>
                  _aMapFlutter?.onRotateChangeEnd!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onMouseMove != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMouseMove(mapId: mapId).listen(
              (MouseMoveEvent e) => _aMapFlutter?.onMouseMove!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMouseWheel != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMouseWheel(mapId: mapId).listen(
              (MouseWheelEvent e) => _aMapFlutter?.onMouseWheel!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onMouseOver != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMouseOver(mapId: mapId).listen(
              (MouseOverEvent e) => _aMapFlutter?.onMouseOver!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMouseOut != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMouseOut(mapId: mapId)
            .listen((MouseOutEvent e) => _aMapFlutter?.onMouseOut!(e.position)),
      );
    }
    if (_aMapFlutter?.onMouseUp != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMouseUp(mapId: mapId)
            .listen((MouseUpEvent e) => _aMapFlutter?.onMouseUp!(e.position)),
      );
    }
    if (_aMapFlutter?.onMouseDown != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMouseDown(mapId: mapId).listen(
              (MouseDownEvent e) => _aMapFlutter?.onMouseDown!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onDragStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onDragStart(mapId: mapId).listen(
              (DragStartEvent e) => _aMapFlutter?.onDragStart!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onDragging != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onDragging(mapId: mapId)
            .listen((DraggingEvent e) => _aMapFlutter?.onDragging!(e.position)),
      );
    }
    if (_aMapFlutter?.onDragEnd != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onDragEnd(mapId: mapId)
            .listen((DragEndEvent e) => _aMapFlutter?.onDragEnd!(e.position)),
      );
    }
    if (_aMapFlutter?.onTouchStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onTouchStart(mapId: mapId).listen(
              (TouchStartEvent e) => _aMapFlutter?.onTouchStart!(e.position),
            ),
      );
    }
    if (_aMapFlutter?.onTouching != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onTouching(mapId: mapId)
            .listen((TouchingEvent e) => _aMapFlutter?.onTouching!(e.position)),
      );
    }
    if (_aMapFlutter?.onTouchEnd != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onTouchEnd(mapId: mapId)
            .listen((TouchEndEvent e) => _aMapFlutter?.onTouchEnd!(e.position)),
      );
    }
    if (_aMapFlutter?.onPoiClick != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onPoiClick(mapId: mapId)
            .listen((PoiClickEvent e) => _aMapFlutter?.onPoiClick!(e.value)),
      );
    }
    if (_aMapFlutter?.onMarkerClick != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMarkerClick(mapId: mapId)
            .listen(
              (MarkerClickEvent e) => _aMapFlutter?.onMarkerClick!(e.value),
            ),
      );
    }
    if (_aMapFlutter?.onMarkerDragStart != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMarkerDragStart(mapId: mapId)
            .listen(
              (MarkerDragStartEvent e) =>
                  _aMapFlutter?.onMarkerDragStart!(e.value, e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMarkerDrag != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance.onMarkerDrag(mapId: mapId).listen(
              (MarkerDragEvent e) =>
                  _aMapFlutter?.onMarkerDrag!(e.value, e.position),
            ),
      );
    }
    if (_aMapFlutter?.onMarkerDragEnd != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onMarkerDragEnd(mapId: mapId)
            .listen(
              (MarkerDragEndEvent e) =>
                  _aMapFlutter?.onMarkerDragEnd!(e.value, e.position),
            ),
      );
    }
    if (_aMapFlutter?.onUserLocationChange != null) {
      _subscriptions.add(
        AMapFlutterPlatformInterface.instance
            .onUserLocationChange(mapId: mapId)
            .listen(
              (UserLocationChangeEvent e) =>
                  _aMapFlutter?.onUserLocationChange!(e.value),
            ),
      );
    }
  }

  /// 移动地图视野
  void moveCamera(CameraPosition position, [Duration? duration]) {
    AMapFlutterPlatformInterface.instance.moveCamera(
      position,
      duration?.inMilliseconds ?? 0,
      mapId: mapId,
    );
  }

  /// 移动地图视野到某个地图区域
  void moveCameraToRegion(Region region, [Duration? duration]) {
    AMapFlutterPlatformInterface.instance.moveCameraToRegion(
      region,
      duration?.inMilliseconds ?? 0,
      mapId: mapId,
    );
  }

  /// 移动地图视野到包含一组坐标点的某个地图区域
  void moveCameraToFitPosition(
    List<Position>? positions,
    EdgePadding padding, [
    Duration? duration,
  ]) {
    AMapFlutterPlatformInterface.instance.moveCameraToFitPosition(
      positions,
      padding,
      duration?.inMilliseconds ?? 0,
      mapId: mapId,
    );
  }

  /// 限制地图显示区域
  void setRestrictRegion(Region region) {
    AMapFlutterPlatformInterface.instance.setRestrictRegion(
      region,
      mapId: mapId,
    );
  }

  /// 取消地图显示区域限制
  void removeRestrictRegion() {
    AMapFlutterPlatformInterface.instance.removeRestrictRegion(mapId: mapId);
  }

  /// 添加标记
  void addMarker(Marker marker) {
    AMapFlutterPlatformInterface.instance.addMarker(marker, mapId: mapId);
  }

  /// 移除标记点
  void removeMarker(String markerId) {
    AMapFlutterPlatformInterface.instance.removeMarker(markerId, mapId: mapId);
  }

  /// 获取当前定位
  Future<Location> getUserLocation() {
    return AMapFlutterPlatformInterface.instance.getUserLocation(mapId: mapId);
  }

  /// 开始地图渲染
  Future<void> start() {
    return AMapFlutterPlatformInterface.instance.start(mapId: mapId);
  }

  /// 暂停地图渲染
  Future<void> pause() {
    return AMapFlutterPlatformInterface.instance.pause(mapId: mapId);
  }

  /// 恢复地图渲染
  Future<void> resume() {
    return AMapFlutterPlatformInterface.instance.resume(mapId: mapId);
  }

  /// 销毁地图
  Future<void> destroy() async {
    // 取消所有 Stream 订阅
    for (var subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
    _aMapFlutter = null;

    // 销毁地图
    return AMapFlutterPlatformInterface.instance.destroy(mapId: mapId);
  }
}
