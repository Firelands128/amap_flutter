part of '../amap_flutter.dart';

/// An implementation of [AMapFlutterPlatformInterface] that uses method channels.
class AMapFlutterMethodChannel extends AMapFlutterPlatformInterface {
  final MethodChannel _initializerChannel = const MethodChannel(
    "plugins.flutter.dev/amap_initializer",
  );

  final Map<int, MethodChannel> _channels = <int, MethodChannel>{};

  /// Accesses the MethodChannel associated to the passed mapId.
  MethodChannel _channel(int mapId) {
    final MethodChannel? channel = _channels[mapId];
    if (channel == null) {
      throw UnknownMapIDError(mapId);
    }
    return channel;
  }

  @override
  Future<void> init(int mapId, AMapFlutter? aMapFlutter) async {
    MethodChannel? channel = _channels[mapId];
    if (channel == null) {
      channel = MethodChannel(
        "plugins.flutter.dev/amap_$mapId",
        const StandardMethodCodec(AMapApiCodec()),
      );
      channel.setMethodCallHandler(
        (MethodCall call) => _handleMethodCall(call, mapId),
      );
      _channels[mapId] = channel;
    }
  }

  Future<dynamic> _handleMethodCall(MethodCall call, int mapId) async {
    switch (call.method) {
      case "onMapInitCompleted":
        mapEventStreamController.add(MapInitCompleteEvent(mapId));
        break;

      case "onMapCompleted":
        mapEventStreamController.add(MapCompleteEvent(mapId));
        break;

      case "onMapPress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapPressEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMapDoublePress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapDoublePressEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMapRightPress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapRightPressEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMapLongPress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapLongPressEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onCameraChange":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(CameraChangeEvent(
          mapId,
          arguments["camera"] as CameraPosition,
        ));
        break;

      case "onCameraChangeStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(CameraChangeStartEvent(
          mapId,
          arguments["camera"] as CameraPosition,
        ));
        break;

      case "onCameraChangeFinish":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(CameraChangeFinishEvent(
          mapId,
          arguments["camera"] as CameraPosition,
        ));
        break;

      case "onMapMoveStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapMoveStartEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMapMove":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapMoveEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMapMoveEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapMoveEndEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMapResized":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapResizedEvent(
          mapId,
          arguments["size"] as Size,
        ));
        break;

      case "onZoomChange":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(ZoomChangeEvent(
          mapId,
          arguments["zoom"] as double,
        ));
        break;

      case "onZoomChangeStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(ZoomChangeStartEvent(
          mapId,
          arguments["zoom"] as double,
        ));
        break;

      case "onZoomChangeEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(ZoomChangeEndEvent(
          mapId,
          arguments["zoom"] as double,
        ));
        break;

      case "onRotateChange":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(RotateChangeEvent(
          mapId,
          arguments["rotate"] as double,
        ));
        break;

      case "onRotateChangeStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(RotateChangeStartEvent(
          mapId,
          arguments["rotate"] as double,
        ));
        break;

      case "onRotateChangeEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(RotateChangeEndEvent(
          mapId,
          arguments["rotate"] as double,
        ));
        break;

      case "onMouseMove":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseMoveEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMouseWheel":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseWheelEvent(
          mapId,
          arguments["zoom"] as double,
        ));
        break;

      case "onMouseOver":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseOverEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMouseOut":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseOutEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMouseUp":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseUpEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onMouseDown":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseDownEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onDragStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(DragStartEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onDragging":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(DraggingEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onDragEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(DragEndEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onTouchStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(TouchStartEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onTouching":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(TouchingEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onTouchEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(TouchEndEvent(
          mapId,
          arguments["position"] as Position,
        ));
        break;

      case "onPoiClick":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(PoiClickEvent(
          mapId,
          arguments["poi"] as Poi,
        ));
        break;

      case "onMarkerClick":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MarkerClickEvent(
          mapId,
          arguments["markerId"] as String,
        ));
        break;
      case "onMarkerDragStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MarkerDragStartEvent(
          mapId,
          arguments["position"] as Position,
          arguments["markerId"] as String,
        ));
        break;
      case "onMarkerDrag":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MarkerDragEvent(
          mapId,
          arguments["position"] as Position,
          arguments["markerId"] as String,
        ));
        break;
      case "onMarkerDragEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MarkerDragEndEvent(
          mapId,
          arguments["position"] as Position,
          arguments["markerId"] as String,
        ));
        break;
      case "onUserLocationChange":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(UserLocationChangeEvent(
          mapId,
          arguments["location"] as Location,
        ));
        break;
      default:
        throw MissingPluginException();
    }
  }

  Map<String, Object?> _getArgumentDictionary(MethodCall call) {
    return (call.arguments as Map<Object?, Object?>).cast<String, Object?>();
  }

  /// 设置SDK Api key，显示地图前必须调用
  @override
  Future<void> setApiKey(ApiKey apiKey) {
    return _initializerChannel.invokeMethod(
      "setApiKey",
      <String, dynamic>{
        "iosKey": apiKey.iosKey,
        "androidKey": apiKey.androidKey,
      },
    );
  }

  /// 同意隐私协议，显示地图前必须调用
  @override
  Future<void> agreePrivacy(bool agree) {
    return _initializerChannel.invokeMethod(
      "agreePrivacy",
      <String, dynamic>{
        "agree": agree,
      },
    );
  }

  /// 设置地图属性
  @override
  Future<void> updateMapConfig(MapUpdateConfig config, {required int mapId}) {
    return _channel(mapId).invokeMethod(
      "updateMapConfig",
      <String, dynamic>{
        "config": config,
      },
    );
  }

  /// 移动地图视野
  @override
  Future<void> moveCamera(
    CameraPosition position,
    int duration, {
    required int mapId,
  }) {
    return _channel(mapId).invokeMethod(
      "moveCamera",
      <String, dynamic>{
        "position": position,
        "duration": duration,
      },
    );
  }

  /// 移动地图视野到某个地图区域
  @override
  Future<void> moveCameraToRegion(
    Region region,
    int duration, {
    required int mapId,
  }) {
    return _channel(mapId).invokeMethod(
      "moveCameraToRegion",
      <String, dynamic>{
        "region": region,
        "duration": duration,
      },
    );
  }

  /// 移动地图视野到包含一组坐标点的某个地图区域
  @override
  Future<void> moveCameraToFitPosition(
    List<Position>? positions,
    EdgePadding padding,
    int duration, {
    required int mapId,
  }) {
    return _channel(mapId).invokeMethod(
      "moveCameraToRegionWithPosition",
      <String, dynamic>{
        "positions": positions,
        "padding": padding,
        "duration": duration,
      },
    );
  }

  /// 限制地图显示区域
  @override
  Future<void> setRestrictRegion(Region region, {required int mapId}) {
    return _channel(mapId).invokeMethod(
      "setRestrictRegion",
      <String, dynamic>{
        "region": region,
      },
    );
  }

  /// 取消地图显示区域限制
  @override
  Future<void> removeRestrictRegion({required int mapId}) {
    return _channel(mapId).invokeMethod("removeRestrictRegion");
  }

  /// 添加标记点
  @override
  Future<void> addMarker(Marker marker, {required int mapId}) {
    return _channel(mapId).invokeMethod(
      "addMarker",
      <String, dynamic>{
        "marker": marker,
      },
    );
  }

  /// 移除标记点
  @override
  Future<void> removeMarker(String id, {required int mapId}) {
    return _channel(mapId).invokeMethod(
      "removeMarker",
      <String, dynamic>{
        "id": id,
      },
    );
  }

  /// 获取当前定位信息
  @override
  Future<Location> getUserLocation({required int mapId}) async {
    final result = await _channel(mapId).invokeMethod<Location>("getUserLocation");
    if (result == null) throw "Failed to get user location";
    return result;
  }

  /// 开始
  @override
  Future<void> start({required int mapId}) {
    return _channel(mapId).invokeMethod("start");
  }

  /// 暂停
  @override
  Future<void> pause({required int mapId}) {
    return _channel(mapId).invokeMethod("pause");
  }

  /// 恢复
  @override
  Future<void> resume({required int mapId}) {
    return _channel(mapId).invokeMethod("resume");
  }

  /// 销毁
  @override
  Future<void> destroy({required int mapId}) {
    if (_channels.containsKey(mapId)) {
      _channels.remove(mapId);
    }
    return _channel(mapId).invokeMethod("destroy");
  }
}
