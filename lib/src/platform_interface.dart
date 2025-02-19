part of '../amap_flutter.dart';

abstract class AMapFlutterPlatformInterface extends PlatformInterface {
  /// Constructs a AMapFlutterPlatform.
  AMapFlutterPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static AMapFlutterPlatformInterface _instance = AMapFlutterMethodChannel();

  /// The default instance of [AMapFlutterPlatformInterface] to use.
  ///
  /// Defaults to [AMapFlutterMethodChannel].
  static AMapFlutterPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AMapFlutterPlatformInterface] when
  /// they register themselves.
  static set instance(AMapFlutterPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init(int mapId, AMapFlutter? aMapFlutter) {
    throw UnimplementedError('init() has not been implemented.');
  }

  // The controller we need to broadcast the different events coming from handleMethodCall.
  final StreamController<MapEvent<Object?>> mapEventStreamController =
      StreamController<MapEvent<Object?>>.broadcast();

  // Returns a filtered view of the events in the _controller, by mapId.
  Stream<MapEvent<Object?>> _events(int mapId) =>
      mapEventStreamController.stream
          .where((MapEvent<Object?> event) => event.mapId == mapId);

  Stream<MapInitCompleteEvent> onMapInitComplete({required int mapId}) {
    return _events(mapId).whereType<MapInitCompleteEvent>();
  }

  Stream<MapCompleteEvent> onMapCompleted({required int mapId}) {
    return _events(mapId).whereType<MapCompleteEvent>();
  }

  Stream<MapPressEvent> onMapPress({required int mapId}) {
    return _events(mapId).whereType<MapPressEvent>();
  }

  Stream<MapDoublePressEvent> onMapDoublePress({required int mapId}) {
    return _events(mapId).whereType<MapDoublePressEvent>();
  }

  Stream<MapRightPressEvent> onMapRightPress({required int mapId}) {
    return _events(mapId).whereType<MapRightPressEvent>();
  }

  Stream<MapLongPressEvent> onMapLongPress({required int mapId}) {
    return _events(mapId).whereType<MapLongPressEvent>();
  }

  Stream<CameraChangeEvent> onCameraChange({required int mapId}) {
    return _events(mapId).whereType<CameraChangeEvent>();
  }

  Stream<CameraChangeStartEvent> onCameraChangeStart({required int mapId}) {
    return _events(mapId).whereType<CameraChangeStartEvent>();
  }

  Stream<CameraChangeFinishEvent> onCameraChangeFinish({required int mapId}) {
    return _events(mapId).whereType<CameraChangeFinishEvent>();
  }

  Stream<MapMoveStartEvent> onMapMoveStart({required int mapId}) {
    return _events(mapId).whereType<MapMoveStartEvent>();
  }

  Stream<MapMoveEvent> onMapMove({required int mapId}) {
    return _events(mapId).whereType<MapMoveEvent>();
  }

  Stream<MapMoveEndEvent> onMapMoveEnd({required int mapId}) {
    return _events(mapId).whereType<MapMoveEndEvent>();
  }

  Stream<MapResizedEvent> onMapResized({required int mapId}) {
    return _events(mapId).whereType<MapResizedEvent>();
  }

  Stream<ZoomChangeEvent> onZoomChange({required int mapId}) {
    return _events(mapId).whereType<ZoomChangeEvent>();
  }

  Stream<ZoomChangeStartEvent> onZoomChangeStart({required int mapId}) {
    return _events(mapId).whereType<ZoomChangeStartEvent>();
  }

  Stream<ZoomChangeEndEvent> onZoomChangeEnd({required int mapId}) {
    return _events(mapId).whereType<ZoomChangeEndEvent>();
  }

  Stream<RotateChangeEvent> onRotateChange({required int mapId}) {
    return _events(mapId).whereType<RotateChangeEvent>();
  }

  Stream<RotateChangeStartEvent> onRotateChangeStart({required int mapId}) {
    return _events(mapId).whereType<RotateChangeStartEvent>();
  }

  Stream<RotateChangeEndEvent> onRotateChangeEnd({required int mapId}) {
    return _events(mapId).whereType<RotateChangeEndEvent>();
  }

  Stream<MouseMoveEvent> onMouseMove({required int mapId}) {
    return _events(mapId).whereType<MouseMoveEvent>();
  }

  Stream<MouseWheelEvent> onMouseWheel({required int mapId}) {
    return _events(mapId).whereType<MouseWheelEvent>();
  }

  Stream<MouseOverEvent> onMouseOver({required int mapId}) {
    return _events(mapId).whereType<MouseOverEvent>();
  }

  Stream<MouseOutEvent> onMouseOut({required int mapId}) {
    return _events(mapId).whereType<MouseOutEvent>();
  }

  Stream<MouseUpEvent> onMouseUp({required int mapId}) {
    return _events(mapId).whereType<MouseUpEvent>();
  }

  Stream<MouseDownEvent> onMouseDown({required int mapId}) {
    return _events(mapId).whereType<MouseDownEvent>();
  }

  Stream<DragStartEvent> onDragStart({required int mapId}) {
    return _events(mapId).whereType<DragStartEvent>();
  }

  Stream<DraggingEvent> onDragging({required int mapId}) {
    return _events(mapId).whereType<DraggingEvent>();
  }

  Stream<DragEndEvent> onDragEnd({required int mapId}) {
    return _events(mapId).whereType<DragEndEvent>();
  }

  Stream<TouchStartEvent> onTouchStart({required int mapId}) {
    return _events(mapId).whereType<TouchStartEvent>();
  }

  Stream<TouchingEvent> onTouching({required int mapId}) {
    return _events(mapId).whereType<TouchingEvent>();
  }

  Stream<TouchEndEvent> onTouchEnd({required int mapId}) {
    return _events(mapId).whereType<TouchEndEvent>();
  }

  Stream<PoiClickEvent> onPoiClick({required int mapId}) {
    return _events(mapId).whereType<PoiClickEvent>();
  }

  Stream<MarkerClickEvent> onMarkerClick({required int mapId}) {
    return _events(mapId).whereType<MarkerClickEvent>();
  }

  Stream<MarkerDragStartEvent> onMarkerDragStart({required int mapId}) {
    return _events(mapId).whereType<MarkerDragStartEvent>();
  }

  Stream<MarkerDragEvent> onMarkerDrag({required int mapId}) {
    return _events(mapId).whereType<MarkerDragEvent>();
  }

  Stream<MarkerDragEndEvent> onMarkerDragEnd({required int mapId}) {
    return _events(mapId).whereType<MarkerDragEndEvent>();
  }

  Stream<UserLocationChangeEvent> onUserLocationChange({required int mapId}) {
    return _events(mapId).whereType<UserLocationChangeEvent>();
  }

  /// 设置SDK Api key，显示地图前必须调用
  Future<void> setApiKey(ApiKey apiKey) {
    throw UnimplementedError('setApiKey() has not been implemented.');
  }

  /// 同意隐私协议，显示地图前必须调用
  Future<void> agreePrivacy(bool agree) {
    throw UnimplementedError('agreePrivacy() has not been implemented.');
  }

  /// 设置地图属性
  Future<void> updateMapConfig(MapUpdateConfig config, {required int mapId}) {
    throw UnimplementedError('updateMapConfig() has not been implemented.');
  }

  /// 移动地图视野
  Future<void> moveCamera(
    CameraPosition position,
    int duration, {
    required int mapId,
  }) {
    throw UnimplementedError('moveCamera() has not been implemented.');
  }

  /// 移动地图视野到某个地图区域
  Future<void> moveCameraToRegion(
    Region region,
    int duration, {
    required int mapId,
  }) {
    throw UnimplementedError('moveCamera() has not been implemented.');
  }

  /// 移动地图视野到包含一组坐标点的某个地图区域
  Future<void> moveCameraToFitPosition(
    List<LatLng>? positions,
    EdgePadding padding,
    int duration, {
    required int mapId,
  }) {
    throw UnimplementedError(
        'moveCameraToRegionWithPosition() has not been implemented.');
  }

  /// 限制地图显示区域
  Future<void> setRestrictRegion(Region region, {required int mapId}) {
    throw UnimplementedError('setRestrictRegion() has not been implemented.');
  }

  /// 取消地图显示区域限制
  Future<void> removeRestrictRegion({required int mapId}) {
    throw UnimplementedError(
      'removeRestrictRegion() has not been implemented.',
    );
  }

  /// 添加标记点
  Future<void> addMarker(Marker marker, {required int mapId}) {
    throw UnimplementedError('addMarker() has not been implemented.');
  }

  /// 移除标记点
  Future<void> removeMarker(String id, {required int mapId}) {
    throw UnimplementedError('removeMarker() has not been implemented.');
  }

  /// 更新标记点
  Future<void> updateMarker(
    String markerId,
    LatLng latLng, {
    required int mapId,
  }) {
    throw UnimplementedError(
      'updateMarker() has not been implemented.',
    );
  }

  /// 获取当前定位信息
  Future<Location> getUserLocation({required int mapId}) async {
    throw UnimplementedError('getUserLocation() has not been implemented.');
  }

  /// 开始
  Future<void> start({required int mapId}) {
    throw UnimplementedError('start() has not been implemented.');
  }

  /// 暂停
  Future<void> pause({required int mapId}) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  /// 恢复
  Future<void> resume({required int mapId}) {
    throw UnimplementedError('resume() has not been implemented.');
  }

  /// 销毁
  Future<void> destroy({required int mapId}) {
    throw UnimplementedError('destroy() has not been implemented.');
  }
}
