import Flutter

class AMapController: NSObject {
  let api: _AMapApi
  let channel: FlutterMethodChannel

  init(viewId: Int64, registrar: FlutterPluginRegistrar, api: _AMapApi) {
    self.api = api
    channel = FlutterMethodChannel(
      name: "plugins.flutter.dev/amap_\(viewId)",
      binaryMessenger: registrar.messenger(),
      codec: AMapCodec.shared
    )
    super.init()
    channel.setMethodCallHandler { [weak self] (call, result) in
      self?.onMethodCall(call: call, result: result)
    }
  }

  func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "updateMapConfig") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let config = arguments["config"] as! MapUpdateConfig
      api.updateMapConfig(config: config)
      result(nil)
    }
    else if(call.method == "getUserLocation") {
      result(api.getUserLocation())
    }
    else if(call.method == "moveCamera") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let position = arguments["position"] as! CameraPosition
      let duration = arguments["duration"] as! Int64
      api.moveCamera(position: position, duration: duration)
      result(nil)
    }
    else if(call.method == "moveCameraToRegion") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let region = arguments["region"] as! Region
      let duration = arguments["duration"] as! Int64
      api.moveCameraToRegion(region: region, duration: duration)
      result(nil)
    }
    else if(call.method == "moveCameraToRegionWithPosition") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let positions = (arguments["positions"] as! [Any?]).map({ position in position as! Position })
      let padding = arguments["padding"] as! EdgePadding
      let duration = arguments["duration"] as! Int64
      api.moveCameraToRegionWithPosition(positions: positions, padding: padding, duration: duration)
      result(nil)
    }
    else if(call.method == "setRestrictRegion") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let region = arguments["region"] as! Region
      api.setRestrictRegion(region: region)
      result(nil)
    }
    else if(call.method == "removeRestrictRegion") {
      api.removeRestrictRegion()
      result(nil)
    }
    else if(call.method == "addMarker") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let marker = arguments["marker"] as! Marker
      api.addMarker(marker: marker)
      result(nil)
    }
    else if(call.method == "removeMarker") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let id = arguments["id"] as! String
      api.removeMarker(id: id)
      result(nil)
    }
    else if(call.method == "updateMarker") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let markerId = arguments["markerId"] as! String
      let position = arguments["position"] as! Position
      api.updateMarker(markerId: markerId, position: position)
      result(nil)
    }
    else if(call.method == "start") {
      api.start()
      result(nil)
    }
    else if(call.method == "pause") {
      api.pause()
      result(nil)
    }
    else if(call.method == "resume") {
      api.resume()
      result(nil)
    }
    else if(call.method == "destroy") {
      api.destroy()
      result(nil)
    }
  }

  /// 当地图初始化完成时触发该回调
  func onMapInitComplete() {
    api.initMap()
    channel.invokeMethod(
      "onMapInitCompleted",
      arguments: nil
    )
  }

  /// 当地图加载完成时触发该回调
  func onMapCompleted() {
    channel.invokeMethod(
      "onMapCompleted",
      arguments: nil
    )
  }

  /// 当点击地图上任意地点时会触发该回调，方法会传入点击的坐标点，事件可能被上层覆盖物拦截
  func onMapPress(position: Position) {
    channel.invokeMethod("onMapPress", arguments: [
      "position": position,
    ] as [String: Any])
  }

  /// 当地图上任意地点进行长按点击时会触发该回调，事件可能被上层覆盖物拦截（Android Only）
  func onMapLongPress(position: Position) {
    channel.invokeMethod("onMapLongPress", arguments: [
      "position": position,
    ] as [String: Any])
  }

  /// 当地图视野变化时触发该回调
  func onCameraChange(camera: CameraPosition) {
    channel.invokeMethod("onCameraChange", arguments: [
      "camera": camera,
    ] as [String: Any])
  }

  /// 当地图视野开始变化时触发该回调
  func onCameraChangeStart(camera: CameraPosition) {
    channel.invokeMethod("onCameraChangeStart", arguments: [
      "camera": camera,
    ] as [String: Any])
  }

  /// 当地图视野变化结束时触发该回调
  func onCameraChangeFinish(camera: CameraPosition) {
    channel.invokeMethod("onCameraChangeFinish", arguments: [
      "camera": camera,
    ] as [String: Any])
  }

  /// 当地图视野即将改变时会触发该回调（iOS Only）
  func onMapMoveStart(position: Position) {
    channel.invokeMethod("onMapMoveStart", arguments: [
      "position": position,
    ] as [String: Any])
  }

  /// 当地图视野变化完成时触发该回调，需注意当前地图状态有可能并不是稳定状态
  func onMapMoveEnd(position: Position) {
    channel.invokeMethod("onMapMoveEnd", arguments: [
      "position": position,
    ] as [String: Any])
  }

  /// 当地图缩放级别开始改变时触发该回调
  func onZoomChangeStart(zoom: Double) {
    channel.invokeMethod("onZoomChangeStart", arguments: [
      "zoom": zoom,
    ] as [String: Any])
  }

  /// 当地图缩放级别结束改变时触发该回调
  func onZoomChangeEnd(zoom: Double) {
    channel.invokeMethod("onZoomChangeEnd", arguments: [
      "zoom": zoom,
    ] as [String: Any])
  }

  /// 当点击地图上任意的POI时调用，方法会传入点击的POI信息
  func onPoiClick(poi: Poi) {
    channel.invokeMethod("onPoiClick", arguments: [
      "poi": poi,
    ] as [String: Any])
  }

  /// 当点击点标记时触发该回调
  func onMarkerClick(_ annotation: Int) {
    if let markerId = api.getMarkerIdByAnnotation(annotation) {
      channel.invokeMethod("onMarkerClick", arguments: [
        "markerId": markerId,
      ] as [String: Any])
    }
  }

  /// 当开始拖动点标记时触发该回调
  func onMarkerDragStart(markerId: String, position: Position) {
    channel.invokeMethod("onMarkerDragStart", arguments: [
      "markerId": markerId,
      "position": position,
    ] as [String: Any])
  }

  /// 当拖动点标记时触发该回调
  func onMarkerDrag(markerId: String, position: Position) {
    channel.invokeMethod("onMarkerDrag", arguments: [
      "markerId": markerId,
      "position": position,
    ] as [String: Any])
  }

  /// 当拖动点标记完成时触发该回调
  func onMarkerDragEnd(markerId: String, position: Position) {
    channel.invokeMethod("onMarkerDragEnd", arguments: [
      "markerId": markerId,
      "position": position,
    ] as [String: Any])
  }

  /// 当前位置改变时触发该回调（Android Only）
  func onUserLocationChange(location: Location) {
    channel.invokeMethod("onUserLocationChange", arguments: [
      "location": location,
    ] as [String: Any])
  }

  private class AMapCodecReader: FlutterStandardReader {
    override func readValue(ofType type: UInt8) -> Any? {
      switch type {
      case 128:
        return MapType(rawValue: self.readValue() as! Int)
      case 129:
        return UIControlAnchor(rawValue: self.readValue() as! Int)
      case 130:
        return UserLocationType(rawValue: self.readValue() as! Int)
      case 131:
        return Anchor.fromList(self.readValue() as! [Any?])
      case 132:
        return Bitmap.fromList(self.readValue() as! [Any?])
      case 133:
        return CameraPosition.fromList(self.readValue() as! [Any?])
      case 134:
        return EdgePadding.fromList(self.readValue() as! [Any?])
      case 135:
        return Location.fromList(self.readValue() as! [Any?])
      case 136:
        return MapInitConfig.fromList(self.readValue() as! [Any?])
      case 137:
        return MapUpdateConfig.fromList(self.readValue() as! [Any?])
      case 138:
        return Marker.fromList(self.readValue() as! [Any?])
      case 139:
        return Poi.fromList(self.readValue() as! [Any?])
      case 140:
        return Position.fromList(self.readValue() as! [Any?])
      case 141:
        return Region.fromList(self.readValue() as! [Any?])
      case 142:
        return Size.fromList(self.readValue() as! [Any?])
      case 143:
        return UIControlOffset.fromList(self.readValue() as! [Any?])
      case 144:
        return UIControlPosition.fromList(self.readValue() as! [Any?])
      case 145:
        return UserLocationConfig.fromList(self.readValue() as! [Any?])
      case 146:
        return UserLocationStyle.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
      }
    }
  }

  private class AMapCodecWriter: FlutterStandardWriter {
    override func writeValue(_ value: Any) {
      if let value = value as? MapType {
        super.writeValue(128)
        super.writeValue(value.rawValue)
      } else if let value = value as? UIControlAnchor {
        super.writeValue(129)
        super.writeValue(value.rawValue)
      } else if let value = value as? UserLocationType {
        super.writeValue(130)
        super.writeValue(value.rawValue)
      } else if let value = value as? Anchor {
        super.writeByte(131)
        super.writeValue(value.toList())
      } else if let value = value as? Bitmap {
        super.writeByte(132)
        super.writeValue(value.toList())
      } else if let value = value as? CameraPosition {
        super.writeByte(133)
        super.writeValue(value.toList())
      } else if let value = value as? EdgePadding {
        super.writeByte(134)
        super.writeValue(value.toList())
      } else if let value = value as? Location {
        super.writeByte(135)
        super.writeValue(value.toList())
      } else if let value = value as? MapInitConfig {
        super.writeByte(136)
        super.writeValue(value.toList())
      } else if let value = value as? MapUpdateConfig {
        super.writeByte(137)
        super.writeValue(value.toList())
      } else if let value = value as? Marker {
        super.writeByte(138)
        super.writeValue(value.toList())
      } else if let value = value as? Poi {
        super.writeByte(139)
        super.writeValue(value.toList())
      } else if let value = value as? Position {
        super.writeByte(140)
        super.writeValue(value.toList())
      } else if let value = value as? Region {
        super.writeByte(141)
        super.writeValue(value.toList())
      } else if let value = value as? Size {
        super.writeByte(142)
        super.writeValue(value.toList())
      } else if let value = value as? UIControlOffset {
        super.writeByte(143)
        super.writeValue(value.toList())
      } else if let value = value as? UIControlPosition {
        super.writeByte(144)
        super.writeValue(value.toList())
      } else if let value = value as? UserLocationConfig {
        super.writeByte(145)
        super.writeValue(value.toList())
      } else if let value = value as? UserLocationStyle {
        super.writeByte(146)
        super.writeValue(value.toList())
      } else {
        super.writeValue(value)
      }
    }
  }

  private class AMapCodecReaderWriter: FlutterStandardReaderWriter {
    override func reader(with data: Data) -> FlutterStandardReader {
      return AMapCodecReader(data: data)
    }

    override func writer(with data: NSMutableData) -> FlutterStandardWriter {
      return AMapCodecWriter(data: data)
    }
  }

  private class AMapCodec: FlutterStandardMethodCodec {
    static let shared = AMapCodec(readerWriter: AMapCodecReaderWriter())
  }
}
