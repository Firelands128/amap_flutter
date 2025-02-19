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
        const StandardMethodCodec(_AMapApiCodec()),
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
          arguments["position"] as LatLng,
        ));
        break;

      case "onMapDoublePress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapDoublePressEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onMapRightPress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapRightPressEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onMapLongPress":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapLongPressEvent(
          mapId,
          arguments["position"] as LatLng,
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
          arguments["position"] as LatLng,
        ));
        break;

      case "onMapMove":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapMoveEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onMapMoveEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MapMoveEndEvent(
          mapId,
          arguments["position"] as LatLng,
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
          arguments["position"] as LatLng,
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
          arguments["position"] as LatLng,
        ));
        break;

      case "onMouseOut":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseOutEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onMouseUp":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseUpEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onMouseDown":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MouseDownEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onDragStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(DragStartEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onDragging":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(DraggingEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onDragEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(DragEndEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onTouchStart":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(TouchStartEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onTouching":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(TouchingEvent(
          mapId,
          arguments["position"] as LatLng,
        ));
        break;

      case "onTouchEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(TouchEndEvent(
          mapId,
          arguments["position"] as LatLng,
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
          arguments["position"] as LatLng,
          arguments["markerId"] as String,
        ));
        break;
      case "onMarkerDrag":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MarkerDragEvent(
          mapId,
          arguments["position"] as LatLng,
          arguments["markerId"] as String,
        ));
        break;
      case "onMarkerDragEnd":
        final Map<String, Object?> arguments = _getArgumentDictionary(call);
        mapEventStreamController.add(MarkerDragEndEvent(
          mapId,
          arguments["position"] as LatLng,
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
    List<LatLng>? positions,
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

  /// 更新标记点
  @override
  Future<void> updateMarker(
    String markerId,
    LatLng latLng, {
    required int mapId,
  }) {
    return _channel(mapId).invokeMethod(
      "updateMarker",
      <String, dynamic>{
        "markerId": markerId,
        "position": latLng,
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

class _AMapApiCodec extends StandardMessageCodec {
  const _AMapApiCodec();

  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MapType) {
      buffer.putUint8(128);
      writeValue(buffer, value.index);
    } else if (value is UIControlAnchor) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else if (value is UserLocationType) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else if (value is Anchor) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is Bitmap) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CameraPosition) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is EdgePadding) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is Location) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is MapInitConfig) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is MapUpdateConfig) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is Marker) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is Poi) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is LatLng) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is Region) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is UIControlOffset) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is UIControlPosition) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is UserLocationConfig) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is UserLocationStyle) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MapType.values.elementAt(readValue(buffer) as int);
      case 129:
        return UIControlAnchor.values.elementAt(readValue(buffer) as int);
      case 130:
        return UserLocationType.values.elementAt(readValue(buffer) as int);
      case 131:
        return Anchor.decode(readValue(buffer) as List<Object?>);
      case 132:
        return Bitmap.decode(readValue(buffer) as List<Object?>);
      case 133:
        return CameraPosition.decode(readValue(buffer) as List<Object?>);
      case 134:
        return EdgePadding.decode(readValue(buffer) as List<Object?>);
      case 135:
        return Location.decode(readValue(buffer) as List<Object?>);
      case 136:
        return MapInitConfig.decode(readValue(buffer) as List<Object?>);
      case 137:
        return MapUpdateConfig.decode(readValue(buffer) as List<Object?>);
      case 138:
        return Marker.decode(readValue(buffer) as List<Object?>);
      case 139:
        return Poi.decode(readValue(buffer) as List<Object?>);
      case 140:
        return LatLng$Ext.decode(readValue(buffer) as List<Object?>);
      case 141:
        return Region.decode(readValue(buffer) as List<Object?>);
      case 142:
        return Size.decode(readValue(buffer) as List<Object?>);
      case 143:
        return UIControlOffset.decode(readValue(buffer) as List<Object?>);
      case 144:
        return UIControlPosition.decode(readValue(buffer) as List<Object?>);
      case 145:
        return UserLocationConfig.decode(readValue(buffer) as List<Object?>);
      case 146:
        return UserLocationStyle.decode(readValue(buffer) as List<Object?>);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}
