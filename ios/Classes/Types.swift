import Foundation
import Flutter

/// 地图类型
enum MapType: Int {
  /// 标准地图
  case standard = 0
  /// 卫星地图
  case satellite = 1
  /// 夜景地图
  case standardNight = 2
  /// 导航地图
  case navi = 3
  /// 公交地图
  case bus = 4
  /// 导航夜景地图
  case naviNight = 5
}

/// UI控件位置锚点
enum UIControlAnchor: Int {
  case topLeft = 0
  case topCenter = 1
  case topRight = 2
  case centerLeft = 3
  case center = 4
  case centerRight = 5
  case bottomLeft = 6
  case bottomCenter = 7
  case bottomRight = 8
}

/// 用户定位类型
enum UserLocationType: Int {
  ///只定位一次（Android Only）
  case locationTypeShow = 0
  ///定位一次，且将视角移动到地图中心点
  case locationTypeLocate = 1
  ///连续定位、且将视角移动到地图中心点，定位蓝点跟随设备移动。（1秒1次定位）
  case locationTypeFollow = 2
  ///连续定位、且将视角移动到地图中心点，地图依照设备方向旋转，定位点会跟随设备移动。（1秒1次定位）
  case locationTypeMapRotate = 3
  ///连续定位、且将视角移动到地图中心点，定位点依照设备方向旋转，并且会跟随设备移动。（1秒1次定位）默认执行此种模式（Android Only）
  case locationTypeLocationRotate = 4
  ///连续定位、蓝点不会移动到地图中心点，定位点依照设备方向旋转，并且蓝点会跟随设备移动（Android Only）
  case locationTypeLocationRotateNoCenter = 5
  ///连续定位、蓝点不会移动到地图中心点，并且蓝点会跟随设备移动（Android Only）
  case locationTypeFollowNoCenter = 6
  ///连续定位、蓝点不会移动到地图中心点，地图依照设备方向旋转，并且蓝点会跟随设备移动（Android Only）
  case locationTypeMapRotateNoCenter = 7
}

/// 点标记图标锚点
struct Anchor {
  /// 点标记图标锚点的X坐标
  var x: Double
  /// 点标记图标锚点的Y坐标
  var y: Double

  static func fromList(_ list: [Any?]) -> Anchor {
    let x = list[0] as! Double
    let y = list[1] as! Double
    return Anchor(
      x: x,
      y: y
    )
  }

  func toList() -> [Any?] {
    return [
      x,
      y,
    ]
  }
}

/// 图片信息
struct Bitmap {
  /// 图片资源路径
  var asset: String? = nil
  /// 图片数据
  var bytes: FlutterStandardTypedData? = nil

  static func fromList(_ list: [Any?]) -> Bitmap {
    let asset: String? = nilOrValue(list[0])
    let bytes: FlutterStandardTypedData? = nilOrValue(list[1])
    return Bitmap(
      asset: asset,
      bytes: bytes
    )
  }

  func toList() -> [Any?] {
    return [
      asset,
      bytes,
    ]
  }
}

/// 地图视野
struct CameraPosition {
  /// 地图视野的位置
  var position: Position? = nil
  /// 地图视野的旋转角度
  var heading: Double? = nil
  /// 地图视野的倾斜角度
  var skew: Double? = nil
  /// 地图视野的缩放级别
  var zoom: Double? = nil

  static func fromList(_ list: [Any?]) -> CameraPosition {
    var position: Position? = nil
    if let positionList: [Any?] = nilOrValue(list[0]) {
      position = Position.fromList(positionList)
    }
    let heading: Double? = nilOrValue(list[1])
    let skew: Double? = nilOrValue(list[2])
    let zoom: Double? = nilOrValue(list[3])
    return CameraPosition(
      position: position,
      heading: heading,
      skew: skew,
      zoom: zoom
    )
  }

  func toList() -> [Any?] {
    return [
      position?.toList(),
      heading,
      skew,
      zoom,
    ]
  }
}

/// 视野边缘宽度
struct EdgePadding {
  /// 左边缘宽度
  var left: Double
  /// 上边缘宽度
  var top: Double
  /// 右边缘宽度
  var right: Double
  /// 下边缘宽度
  var bottom: Double

  static func fromList(_ list: [Any?]) -> EdgePadding {
    let left = list[0] as! Double
    let top = list[1] as! Double
    let right = list[2] as! Double
    let bottom = list[3] as! Double
    return EdgePadding(
      left: left,
      top: top,
      right: right,
      bottom: bottom
    )
  }

  func toList() -> [Any?] {
    return [
      left,
      top,
      right,
      bottom,
    ]
  }
}

/// 定位点
struct Location {
  /// 定位点的位置
  var position: Position? = nil
  /// 定位点的方向
  var heading: Double? = nil
  /// 定位点的精确度
  var accuracy: Double? = nil

  static func fromList(_ list: [Any?]) -> Location {
    var position: Position? = nil
    if let positionList: [Any?] = nilOrValue(list[0]) {
      position = Position.fromList(positionList)
    }
    let heading: Double? = nilOrValue(list[1])
    let accuracy: Double? = nilOrValue(list[2])
    return Location(
      position: position,
      heading: heading,
      accuracy: accuracy
    )
  }

  func toList() -> [Any?] {
    return [
      position?.toList(),
      heading,
      accuracy,
    ]
  }
}

/// 初始化地图属性
struct MapInitConfig {
  var mapType: MapType? = nil
  var mapStyle: String? = nil
  var cameraPosition: CameraPosition? = nil
  var fitPositions: [Position]? = nil
  var dragEnable: Bool? = nil
  var zoomEnable: Bool? = nil
  var tiltEnable: Bool? = nil
  var rotateEnable: Bool? = nil
  var jogEnable: Bool? = nil
  var animateEnable: Bool? = nil
  var keyboardEnable: Bool? = nil
  var compassControlEnabled: Bool? = nil
  var scaleControlEnabled: Bool? = nil
  var zoomControlEnabled: Bool? = nil
  var logoPosition: UIControlPosition? = nil
  var doubleClickZoom: Bool? = nil
  var scrollWheel: Bool? = nil
  var touchZoom: Bool? = nil
  var touchZoomCenter: Bool? = nil
  var isHotspot: Bool? = nil
  var showBuildingBlock: Bool? = nil
  var showLabel: Bool? = nil
  var showIndoorMap: Bool? = nil
  var defaultCursor: String? = nil
  var viewMode: String? = nil
  var terrain: Bool? = nil
  var wallColor: UIColor? = nil
  var roofColor: UIColor? = nil
  var skyColor: UIColor? = nil

  static func fromList(_ list: [Any?]) -> MapInitConfig {
    var mapType: MapType? = nil
    if let type: Int = nilOrValue(list[0]) {
      mapType = MapType(rawValue: type)!
    }
    let mapStyle: String? = nilOrValue(list[1])
    var cameraPosition: CameraPosition? = nil
    if let cameraPositionList: [Any?] = nilOrValue(list[2]) {
      cameraPosition = CameraPosition.fromList(cameraPositionList)
    }
    var fitPositions: [Position]? = nil
    if let fitPositionsList: [[Any?]] = nilOrValue(list[3]) {
      fitPositions = fitPositionsList.map({ position in Position.fromList(position) })
    }
    let dragEnable: Bool? = nilOrValue(list[4])
    let zoomEnable: Bool? = nilOrValue(list[5])
    let tiltEnable: Bool? = nilOrValue(list[6])
    let rotateEnable: Bool? = nilOrValue(list[7])
    let jogEnable: Bool? = nilOrValue(list[8])
    let animateEnable: Bool? = nilOrValue(list[9])
    let keyboardEnable: Bool? = nilOrValue(list[10])
    let compassControlEnabled: Bool? = nilOrValue(list[11])
    let scaleControlEnabled: Bool? = nilOrValue(list[12])
    let zoomControlEnabled: Bool? = nilOrValue(list[13])
    var logoPosition: UIControlPosition? = nil
    if let logoPositionList: [Any?] = nilOrValue(list[14]) {
      logoPosition = UIControlPosition.fromList(logoPositionList)
    }
    let doubleClickZoom: Bool? = nilOrValue(list[15])
    let scrollWheel: Bool? = nilOrValue(list[16])
    let touchZoom: Bool? = nilOrValue(list[17])
    let touchZoomCenter: Bool? = nilOrValue(list[18])
    let isHotspot: Bool? = nilOrValue(list[19])
    let showBuildingBlock: Bool? = nilOrValue(list[20])
    let showLabel: Bool? = nilOrValue(list[21])
    let showIndoorMap: Bool? = nilOrValue(list[22])
    let defaultCursor: String? = nilOrValue(list[23])
    let viewMode: String? = nilOrValue(list[24])
    let terrain: Bool? = nilOrValue(list[25])
    var wallColor: UIColor? = nil
    if let color: UInt = nilOrValue(list[26]) {
      wallColor = UIColor(hex: color)
    }
    var roofColor: UIColor? = nil
    if let color: UInt = nilOrValue(list[27]) {
      roofColor = UIColor(hex: color)
    }
    var skyColor: UIColor? = nil
    if let color: UInt = nilOrValue(list[28]) {
      skyColor = UIColor(hex: color)
    }
    return MapInitConfig(
      mapType: mapType,
      mapStyle: mapStyle,
      cameraPosition: cameraPosition,
      fitPositions: fitPositions,
      dragEnable: dragEnable,
      zoomEnable: zoomEnable,
      tiltEnable: tiltEnable,
      rotateEnable: rotateEnable,
      jogEnable: jogEnable,
      animateEnable: animateEnable,
      keyboardEnable: keyboardEnable,
      compassControlEnabled: compassControlEnabled,
      scaleControlEnabled: scaleControlEnabled,
      zoomControlEnabled: zoomControlEnabled,
      logoPosition: logoPosition,
      doubleClickZoom: doubleClickZoom,
      scrollWheel: scrollWheel,
      touchZoom: touchZoom,
      touchZoomCenter: touchZoomCenter,
      isHotspot: isHotspot,
      showBuildingBlock: showBuildingBlock,
      showLabel: showLabel,
      showIndoorMap: showIndoorMap,
      defaultCursor: defaultCursor,
      viewMode: viewMode,
      terrain: terrain,
      wallColor: wallColor,
      roofColor: roofColor,
      skyColor: skyColor
    )
  }

  func toList() -> [Any?] {
    return [
      mapType?.rawValue,
      mapStyle,
      cameraPosition?.toList(),
      fitPositions?.map({ position in position.toList() }),
      dragEnable,
      zoomEnable,
      tiltEnable,
      rotateEnable,
      jogEnable,
      animateEnable,
      keyboardEnable,
      compassControlEnabled,
      scaleControlEnabled,
      zoomControlEnabled,
      logoPosition?.toList(),
      doubleClickZoom,
      scrollWheel,
      touchZoom,
      touchZoomCenter,
      isHotspot,
      showBuildingBlock,
      showLabel,
      showIndoorMap,
      defaultCursor,
      viewMode,
      terrain,
      wallColor?.hex,
      roofColor?.hex,
      skyColor?.hex,
    ]
  }
}

/// 地图属性配置
struct MapUpdateConfig {
  var mapType: MapType? = nil
  var mapStyle: String? = nil
  var mapFeatures: [String]? = nil
  var dragEnable: Bool? = nil
  var zoomEnable: Bool? = nil
  var tiltEnable: Bool? = nil
  var rotateEnable: Bool? = nil
  var compassControlEnabled: Bool? = nil
  var scaleControlEnabled: Bool? = nil
  var zoomControlEnabled: Bool? = nil
  var hawkEyeControlEnabled: Bool? = nil
  var mapTypeControlEnabled: Bool? = nil
  var logoPosition: UIControlPosition? = nil
  var compassControlPosition: UIControlPosition? = nil
  var scaleControlPosition: UIControlPosition? = nil
  var zoomControlPosition: UIControlPosition? = nil
  var showTraffic: Bool? = nil
  var showBuildings: Bool? = nil
  var showIndoorMap: Bool? = nil
  var showSatelliteLayer: Bool? = nil
  var showRoadNetLayer: Bool? = nil
  var userLocationConfig: UserLocationConfig? = nil

  static func fromList(_ list: [Any?]) -> MapUpdateConfig {
    var mapType: MapType? = nil
    if let type: Int = nilOrValue(list[0]) {
      mapType = MapType(rawValue: type)!
    }
    let mapStyle: String? = nilOrValue(list[1])
    let mapFeatures: [String]? = nilOrValue(list[2])
    let dragEnable: Bool? = nilOrValue(list[3])
    let zoomEnable: Bool? = nilOrValue(list[4])
    let tiltEnable: Bool? = nilOrValue(list[5])
    let rotateEnable: Bool? = nilOrValue(list[6])
    let compassControlEnabled: Bool? = nilOrValue(list[7])
    let scaleControlEnabled: Bool? = nilOrValue(list[8])
    let zoomControlEnabled: Bool? = nilOrValue(list[9])
    let hawkEyeControlEnabled: Bool? = nilOrValue(list[10])
    let mapTypeControlEnabled: Bool? = nilOrValue(list[11])
    var logoPosition: UIControlPosition? = nil
    if let logoPositionList: [Any?] = nilOrValue(list[12]) {
      logoPosition = UIControlPosition.fromList(logoPositionList)
    }
    var compassControlPosition: UIControlPosition? = nil
    if let compassControlPositionList: [Any?] = nilOrValue(list[13]) {
      compassControlPosition = UIControlPosition.fromList(compassControlPositionList)
    }
    var scaleControlPosition: UIControlPosition? = nil
    if let scaleControlPositionList: [Any?] = nilOrValue(list[14]) {
      scaleControlPosition = UIControlPosition.fromList(scaleControlPositionList)
    }
    var zoomControlPosition: UIControlPosition? = nil
    if let zoomControlPositionList: [Any?] = nilOrValue(list[15]) {
      zoomControlPosition = UIControlPosition.fromList(zoomControlPositionList)
    }
    let showTraffic: Bool? = nilOrValue(list[16])
    let showBuildings: Bool? = nilOrValue(list[17])
    let showIndoorMap: Bool? = nilOrValue(list[18])
    let showSatelliteLayer: Bool? = nilOrValue(list[19])
    let showRoadNetLayer: Bool? = nilOrValue(list[20])
    var userLocationConfig: UserLocationConfig? = nil
    if let userLocationConfigList: [Any?] = nilOrValue(list[21]) {
      userLocationConfig = UserLocationConfig.fromList(userLocationConfigList)
    }
    return MapUpdateConfig(
      mapType: mapType,
      mapStyle: mapStyle,
      mapFeatures: mapFeatures,
      dragEnable: dragEnable,
      zoomEnable: zoomEnable,
      tiltEnable: tiltEnable,
      rotateEnable: rotateEnable,
      compassControlEnabled: compassControlEnabled,
      scaleControlEnabled: scaleControlEnabled,
      zoomControlEnabled: zoomControlEnabled,
      hawkEyeControlEnabled: hawkEyeControlEnabled,
      mapTypeControlEnabled: mapTypeControlEnabled,
      logoPosition: logoPosition,
      compassControlPosition: compassControlPosition,
      scaleControlPosition: scaleControlPosition,
      zoomControlPosition: zoomControlPosition,
      showTraffic: showTraffic,
      showBuildings: showBuildings,
      showIndoorMap: showIndoorMap,
      showSatelliteLayer: showSatelliteLayer,
      showRoadNetLayer: showRoadNetLayer,
      userLocationConfig: userLocationConfig
    )
  }

  func toList() -> [Any?] {
    return [
      mapType?.rawValue,
      mapStyle,
      mapFeatures,
      dragEnable,
      zoomEnable,
      tiltEnable,
      rotateEnable,
      compassControlEnabled,
      scaleControlEnabled,
      zoomControlEnabled,
      hawkEyeControlEnabled,
      mapTypeControlEnabled,
      logoPosition?.toList(),
      compassControlPosition?.toList(),
      scaleControlPosition?.toList(),
      zoomControlPosition?.toList(),
      showTraffic,
      showBuildings,
      showIndoorMap,
      showSatelliteLayer,
      showRoadNetLayer,
      userLocationConfig?.toList(),
    ]
  }
}

/// 标记点配置属性
struct Marker {
  /// 标记点ID
  var id: String
  /// 标记点的位置
  var position: Position

  static func fromList(_ list: [Any?]) -> Marker {
    let id = list[0] as! String
    let position = Position.fromList(list[1] as! [Any?])
    return Marker(
      id: id,
      position: position
    )
  }

  func toList() -> [Any?] {
    return [
      id,
      position.toList(),
    ]
  }
}

/// 地图兴趣点
struct Poi {
  /// 兴趣点的名称
  var name: String
  /// 兴趣点的位置
  var position: Position

  static func fromList(_ list: [Any?]) -> Poi {
    let name = list[0] as! String
    let position = Position.fromList(list[1] as! [Any?])
    return Poi(
      name: name,
      position: position
    )
  }

  func toList() -> [Any?] {
    return [
      name,
      position.toList(),
    ]
  }
}

/// 位置
struct Position {
  /// 位置的纬度
  var latitude: Double
  /// 位置的经度
  var longitude: Double

  static func fromList(_ list: [Any?]) -> Position {
    let latitude = list[0] as! Double
    let longitude = list[1] as! Double
    return Position(
      latitude: latitude,
      longitude: longitude
    )
  }

  func toList() -> [Any?] {
    return [
      latitude,
      longitude,
    ]
  }
}

/// 地图区域
struct Region {
  /// 最北的纬度
  var north: Double
  /// 最东的经度
  var east: Double
  /// 最南的纬度
  var south: Double
  /// 最西的经度
  var west: Double

  static func fromList(_ list: [Any?]) -> Region {
    let north = list[0] as! Double
    let east = list[1] as! Double
    let south = list[2] as! Double
    let west = list[3] as! Double
    return Region(
      north: north,
      east: east,
      south: south,
      west: west
    )
  }

  func toList() -> [Any?] {
    return [
      north,
      east,
      south,
      west,
    ]
  }
}

/// 对象的像素尺寸
struct Size {
  /// 宽度
  var width: Double
  /// 高度
  var height: Double

  static func fromList(_ list: [Any?]) -> Size {
    let width = list[0] as! Double
    let height = list[1] as! Double
    return Size(
      width: width,
      height: height
    )
  }

  func toList() -> [Any?] {
    return [
      width,
      height,
    ]
  }
}

/// UI控件位置偏移
struct UIControlOffset {
  /// X轴方向的位置偏移
  var x: Double
  /// Y轴方向的位置偏移
  var y: Double

  static func fromList(_ list: [Any?]) -> UIControlOffset {
    let x = list[0] as! Double
    let y = list[1] as! Double
    return UIControlOffset(
      x: x,
      y: y
    )
  }

  func toList() -> [Any?] {
    return [
      x,
      y,
    ]
  }
}

/// UI控件位置
struct UIControlPosition {
  /// UI控件位置锚点
  var anchor: UIControlAnchor
  /// UI控件位置偏移
  var offset: UIControlOffset

  static func fromList(_ list: [Any?]) -> UIControlPosition? {
    let anchor = UIControlAnchor(rawValue: list[0] as! Int)!
    let offset = UIControlOffset.fromList(list[1] as! [Any?])
    return UIControlPosition(
      anchor: anchor,
      offset: offset
    )
  }

  func toList() -> [Any?] {
    return [
      anchor.rawValue,
      offset.toList(),
    ]
  }
}

/// 用户定位配置
struct UserLocationConfig {
  var userLocationButton: Bool?
  var showUserLocation: Bool?
  var userLocationStyle: UserLocationStyle?

  static func fromList(_ list: [Any?]) -> UserLocationConfig? {
    let userLocationButton: Bool? = nilOrValue(list[0])
    let showUserLocation: Bool? = nilOrValue(list[1])
    var userLocationStyle: UserLocationStyle? = nil
    if let userLocationStyleList: [Any?] = nilOrValue(list[2]) {
      userLocationStyle = UserLocationStyle.fromList(userLocationStyleList)
    }
    return UserLocationConfig(
      userLocationButton: userLocationButton,
      showUserLocation: showUserLocation,
      userLocationStyle: userLocationStyle
    )
  }

  func toList() -> [Any?] {
    return [
      userLocationButton,
      showUserLocation,
      userLocationStyle?.toList(),
    ]
  }
}

/// 用户定位样式
struct UserLocationStyle {
  var userLocationType: UserLocationType?
  var fillColor: UIColor?
  var strokeColor: UIColor?
  var lineWidth: Double?
  var image: Bitmap?

  static func fromList(_ list: [Any?]) -> UserLocationStyle? {
    var userLocationType: UserLocationType? = nil
    if let type: Int = nilOrValue(list[0]) {
      userLocationType = UserLocationType(rawValue: type)!
    }
    var fillColor: UIColor? = nil
    if let color: UInt = nilOrValue(list[1]) {
      fillColor = UIColor(hex: color)
    }
    var strokeColor: UIColor? = nil
    if let color: UInt = nilOrValue(list[2]) {
      strokeColor = UIColor(hex: color)
    }
    let lineWidth: Double? = nilOrValue(list[3])
    var image: Bitmap? = nil
    if let imageList: [Any?] = nilOrValue(list[4]) {
      image = Bitmap.fromList(imageList)
    }
    return UserLocationStyle(
      userLocationType: userLocationType,
      fillColor: fillColor,
      strokeColor: strokeColor,
      lineWidth: lineWidth,
      image: image
    )
  }

  func toList() -> [Any?] {
    return [
      userLocationType?.rawValue,
      fillColor?.hex,
      strokeColor?.hex,
      lineWidth,
      image?.toList(),
    ]
  }
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}
