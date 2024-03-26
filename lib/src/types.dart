part of '../amap_flutter.dart';

/// 地图类型
enum MapType {
  /// 标准地图
  standard,

  /// 卫星地图
  satellite,

  /// 标准夜景地图
  standardNight,

  /// 导航地图
  navi,

  /// 公交地图
  bus,

  /// 导航夜景地图（iOS only）
  naviNight,
}

/// UI控件位置锚点
enum UIControlAnchor {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

/// 用户定位类型
enum UserLocationType {
  ///只定位一次（Android Only）
  locationTypeShow,

  ///定位一次，且将视角移动到地图中心点
  locationTypeLocate,

  ///连续定位、且将视角移动到地图中心点，定位蓝点跟随设备移动。（1秒1次定位）
  locationTypeFollow,

  ///连续定位、且将视角移动到地图中心点，地图依照设备方向旋转，定位点会跟随设备移动。（1秒1次定位）
  locationTypeMapRotate,

  ///连续定位、且将视角移动到地图中心点，定位点依照设备方向旋转，并且会跟随设备移动。（1秒1次定位）默认执行此种模式（Android Only）
  locationTypeLocationRotate,

  ///连续定位、蓝点不会移动到地图中心点，定位点依照设备方向旋转，并且蓝点会跟随设备移动（Android Only）
  locationTypeLocationRotateNoCenter,

  ///连续定位、蓝点不会移动到地图中心点，并且蓝点会跟随设备移动（Android Only）
  locationTypeFollowNoCenter,

  ///连续定位、蓝点不会移动到地图中心点，地图依照设备方向旋转，并且蓝点会跟随设备移动（Android Only）
  locationTypeMapRotateNoCenter,
}

/// 点标记图标锚点
class Anchor {
  Anchor({
    required this.x,
    required this.y,
  });

  /// 点标记图标锚点的X坐标
  double x;

  /// 点标记图标锚点的Y坐标
  double y;

  Object encode() {
    return <Object?>[
      x,
      y,
    ];
  }

  static Anchor decode(List<Object?> result) {
    return Anchor(
      x: result[0]! as double,
      y: result[1]! as double,
    );
  }
}

/// 高德地图api key
class ApiKey {
  ApiKey({
    required this.iosKey,
    required this.androidKey,
  });

  /// iOS平台的key
  final String iosKey;

  /// Android平台的key
  final String androidKey;

  Object encode() {
    return <Object?>[
      iosKey,
      androidKey,
    ];
  }

  static ApiKey decode(List<Object?> result) {
    return ApiKey(
      iosKey: result[0] as String,
      androidKey: result[1] as String,
    );
  }
}

/// 图片信息
class Bitmap {
  Bitmap({
    this.asset,
    this.bytes,
  });

  /// 图片资源路径
  String? asset;

  /// 图片数据
  Uint8List? bytes;

  Object encode() {
    return <Object?>[
      asset,
      bytes,
    ];
  }

  static Bitmap decode(List<Object?> result) {
    return Bitmap(
      asset: result[0] as String?,
      bytes: result[1] as Uint8List?,
    );
  }
}

/// 地图视野
class CameraPosition {
  CameraPosition({
    this.position,
    this.heading,
    this.skew,
    this.zoom,
  });

  /// 地图视野的位置
  Position? position;

  /// 地图视野的旋转角度
  double? heading;

  /// 地图视野的倾斜角度
  double? skew;

  /// 地图视野的缩放级别
  double? zoom;

  Object encode() {
    return <Object?>[
      position?.encode(),
      heading,
      skew,
      zoom,
    ];
  }

  static CameraPosition decode(List<Object?> result) {
    return CameraPosition(
      position: result[0] != null ? Position.decode(result[0]! as List<Object?>) : null,
      heading: result[1] as double?,
      skew: result[2] as double?,
      zoom: result[3] as double?,
    );
  }
}

/// 视野边缘宽度
class EdgePadding {
  EdgePadding({
    required this.top,
    required this.right,
    required this.bottom,
    required this.left,
  });

  /// 上边缘宽度
  double top;

  /// 右边缘宽度
  double right;

  /// 下边缘宽度
  double bottom;

  /// 左边缘宽度
  double left;

  Object encode() {
    return <Object?>[
      top,
      right,
      bottom,
      left,
    ];
  }

  static EdgePadding decode(List<Object?> result) {
    return EdgePadding(
      top: result[0]! as double,
      right: result[1]! as double,
      bottom: result[2]! as double,
      left: result[3]! as double,
    );
  }
}

/// 定位点
class Location {
  Location({
    this.position,
    this.heading,
    this.accuracy,
  });

  /// 定位点的位置
  Position? position;

  /// 定位点的方向
  double? heading;

  /// 定位点的精确度
  double? accuracy;

  Object encode() {
    return <Object?>[
      position?.encode(),
      heading,
      accuracy,
    ];
  }

  static Location decode(List<Object?> result) {
    return Location(
      position: result[0] != null ? Position.decode(result[0]! as List<Object?>) : null,
      heading: result[1] as double?,
      accuracy: result[2] as double?,
    );
  }
}

/// 初始化地图属性
class MapInitConfig {
  MapInitConfig({
    this.mapType,
    this.mapStyle,
    this.cameraPosition,
    this.dragEnable,
    this.zoomEnable,
    this.tiltEnable,
    this.rotateEnable,
    this.jogEnable,
    this.animateEnable,
    this.keyboardEnable,
    this.compassControlEnabled,
    this.scaleControlEnabled,
    this.zoomControlEnabled,
    this.logoPosition,
    this.doubleClickZoom,
    this.scrollWheel,
    this.touchZoom,
    this.touchZoomCenter,
    this.isHotspot,
    this.showBuildingBlock,
    this.showLabel,
    this.showIndoorMap,
    this.defaultCursor,
    this.viewMode,
    this.terrain,
    this.wallColor,
    this.roofColor,
    this.skyColor,
  });

  /// 设置地图类型
  final MapType? mapType;

  /// 设置地图的显示样式
  final String? mapStyle;

  /// 地图视野
  final CameraPosition? cameraPosition;

  /// 地图是否允许拖拽
  final bool? dragEnable;

  /// 地图是否允许缩放
  final bool? zoomEnable;

  /// 地图是否允许俯仰
  final bool? tiltEnable;

  /// 地图是否允许旋转
  final bool? rotateEnable;

  /// 地图是否使用缓动效果，默认为true(Web Only)
  final bool? jogEnable;

  /// 地图平移过程中是否使用动画，默认为true(Web Only)
  final bool? animateEnable;

  /// 地图是否可通过键盘控制，默认为true(Web Only)
  final bool? keyboardEnable;

  /// 是否显示指南针控件
  final bool? compassControlEnabled;

  /// 是否显示比例尺控件
  final bool? scaleControlEnabled;

  /// 是否显示缩放控件(Android Only)
  final bool? zoomControlEnabled;

  /// Logo位置锚点(Android Only)
  final UIControlPosition? logoPosition;

  /// 地图是否可通过双击鼠标放大地图，默认为true(Web Only)
  final bool? doubleClickZoom;

  /// 地图是否可通过鼠标滚轮缩放浏览，默认为true(Web Only)
  final bool? scrollWheel;

  /// 地图在移动终端上是否可通过多点触控缩放浏览地图，默认为true(Web Only)
  final bool? touchZoom;

  /// 手机端双指缩放是否以地图中心为中心，否则以双指中间点为中心，默认为true(Web Only)
  final bool? touchZoomCenter;

  /// 是否开启地图热点和标注的hover效果，PC端默认是true，移动端默认是 false(Web Only)
  final bool? isHotspot;

  /// 是否展示地图3D楼块，默认true(Web Only)
  final bool? showBuildingBlock;

  /// 是否展示地图文字和 POI 信息，默认为true(Web Only)
  final bool? showLabel;

  /// 是否自动展示室内地图，默认是false(Web Only)
  final bool? showIndoorMap;

  /// 地图默认鼠标样式(Web Only)
  final String? defaultCursor;

  /// 初始地图视图模式，默认为2D, 3D 地形图 目前仅支持 v2.1Beta(Web Only)
  final String? viewMode;

  /// 初始地图是否展示地形，默认为false(Web Only)
  final bool? terrain;

  /// 地图楼块的侧面颜色(Web Only)
  final Color? wallColor;

  /// 地图楼块的顶面颜色(Web Only)
  final Color? roofColor;

  /// 天空颜色，3D模式下带有俯仰角时会显示(Web Only)
  final Color? skyColor;

  Object encode() {
    return <Object?>[
      mapType?.index,
      mapStyle,
      cameraPosition?.encode(),
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
      logoPosition?.encode(),
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
      wallColor?.value,
      roofColor?.value,
      skyColor?.value,
    ];
  }

  static MapInitConfig decode(List<Object?> result) {
    return MapInitConfig(
      mapType: result[0] as MapType?,
      mapStyle: result[1] as String?,
      cameraPosition: result[2] != null ? CameraPosition.decode(result[2]! as List<Object?>) : null,
      dragEnable: result[3] as bool?,
      zoomEnable: result[4] as bool?,
      tiltEnable: result[5] as bool?,
      rotateEnable: result[6] as bool?,
      jogEnable: result[7] as bool?,
      animateEnable: result[8] as bool?,
      keyboardEnable: result[9] as bool?,
      compassControlEnabled: result[10] as bool?,
      scaleControlEnabled: result[11] as bool?,
      zoomControlEnabled: result[12] as bool?,
      logoPosition: result[13] != null ? UIControlPosition.decode(result[13]! as List<Object?>) : null,
      doubleClickZoom: result[14] as bool?,
      scrollWheel: result[15] as bool?,
      touchZoom: result[16] as bool?,
      touchZoomCenter: result[17] as bool?,
      isHotspot: result[18] as bool?,
      showBuildingBlock: result[19] as bool?,
      showLabel: result[20] as bool?,
      showIndoorMap: result[21] as bool?,
      defaultCursor: result[22] as String?,
      viewMode: result[23] as String?,
      terrain: result[24] as bool?,
      wallColor: result[25] != null ? Color(result[25] as int) : null,
      roofColor: result[26] != null ? Color(result[26] as int) : null,
      skyColor: result[27] != null ? Color(result[27] as int) : null,
    );
  }
}

/// 更新地图属性
class MapUpdateConfig {
  MapUpdateConfig({
    this.mapType,
    this.mapStyle,
    this.mapFeatures,
    this.dragEnable,
    this.zoomEnable,
    this.tiltEnable,
    this.rotateEnable,
    this.compassControlEnabled,
    this.scaleControlEnabled,
    this.zoomControlEnabled,
    this.hawkEyeControlEnabled,
    this.mapTypeControlEnabled,
    this.logoPosition,
    this.compassControlPosition,
    this.scaleControlPosition,
    this.zoomControlPosition,
    this.showTraffic,
    this.showBuildings,
    this.showIndoorMap,
    this.showSatelliteLayer,
    this.showRoadNetLayer,
    this.userLocationConfig,
  });

  /// 设置地图类型
  MapType? mapType;

  /// 设置地图的显示样式
  String? mapStyle;

  /// 地图显示要素(Web Only)
  List<String>? mapFeatures;

  /// 地图是否允许拖拽
  bool? dragEnable;

  /// 地图是否允许缩放
  bool? zoomEnable;

  /// 地图是否允许俯仰
  bool? tiltEnable;

  /// 地图是否允许旋转
  bool? rotateEnable;

  /// 是否显示指南针控件
  bool? compassControlEnabled;

  /// 是否显示比例尺控件
  bool? scaleControlEnabled;

  /// 是否显示缩放控件(iOS not support)
  bool? zoomControlEnabled;

  /// 是否显示鹰眼控件(Web Only)
  bool? hawkEyeControlEnabled;

  /// 是否显示地图类型控件(Web Only)
  bool? mapTypeControlEnabled;

  /// Logo位置
  UIControlPosition? logoPosition;

  /// 指南针控件位置
  UIControlPosition? compassControlPosition;

  /// 比例尺控件位置
  UIControlPosition? scaleControlPosition;

  /// 缩放控件位置
  UIControlPosition? zoomControlPosition;

  /// 是否显示实时路况
  bool? showTraffic;

  /// 是否显示楼块
  bool? showBuildings;

  /// 是否显示室内图
  bool? showIndoorMap;

  /// 是否显示卫星图层(Web Only)
  bool? showSatelliteLayer;

  /// 是否显示路网图层(Web Only)
  bool? showRoadNetLayer;

  /// 用户定位配置
  UserLocationConfig? userLocationConfig;

  Object encode() {
    return <Object?>[
      mapType?.index,
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
      logoPosition?.encode(),
      compassControlPosition?.encode(),
      scaleControlPosition?.encode(),
      zoomControlPosition?.encode(),
      showTraffic,
      showBuildings,
      showIndoorMap,
      showSatelliteLayer,
      showRoadNetLayer,
      userLocationConfig?.encode(),
    ];
  }

  static MapUpdateConfig decode(List<Object?> result) {
    return MapUpdateConfig(
      mapType: result[0] as MapType?,
      mapStyle: result[1] as String?,
      mapFeatures: result[2] as List<String>?,
      dragEnable: result[3] as bool?,
      zoomEnable: result[4] as bool?,
      tiltEnable: result[5] as bool?,
      rotateEnable: result[6] as bool?,
      compassControlEnabled: result[7] as bool?,
      scaleControlEnabled: result[8] as bool?,
      zoomControlEnabled: result[9] as bool?,
      hawkEyeControlEnabled: result[10] as bool?,
      mapTypeControlEnabled: result[11] as bool?,
      logoPosition: result[12] != null ? UIControlPosition.decode(result[12]! as List<Object?>) : null,
      compassControlPosition: result[13] != null ? UIControlPosition.decode(result[13]! as List<Object?>) : null,
      scaleControlPosition: result[14] != null ? UIControlPosition.decode(result[14]! as List<Object?>) : null,
      zoomControlPosition: result[15] != null ? UIControlPosition.decode(result[15]! as List<Object?>) : null,
      showTraffic: result[16] as bool?,
      showBuildings: result[17] as bool?,
      showIndoorMap: result[18] as bool?,
      showSatelliteLayer: result[19] as bool?,
      showRoadNetLayer: result[20] as bool?,
      userLocationConfig: result[21] != null ? UserLocationConfig.decode(result[21]! as List<Object?>) : null,
    );
  }
}

/// 标记点配置属性
class Marker {
  Marker({
    required this.id,
    required this.position,
  });

  /// 标记点ID
  String id;

  /// 标记点的位置
  Position position;

  Object encode() {
    return <Object?>[
      id,
      position.encode(),
    ];
  }

  static Marker decode(List<Object?> result) {
    return Marker(
      id: result[0]! as String,
      position: Position.decode(result[1]! as List<Object?>),
    );
  }
}

/// 地图兴趣点
class Poi {
  Poi({
    required this.name,
    required this.position,
  });

  /// 兴趣点的名称
  String name;

  /// 兴趣点的位置
  Position position;

  Object encode() {
    return <Object?>[
      name,
      position.encode(),
    ];
  }

  static Poi decode(List<Object?> result) {
    return Poi(
      name: result[0]! as String,
      position: Position.decode(result[1]! as List<Object?>),
    );
  }
}

/// 位置
class Position {
  Position({
    required double latitude,
    required double longitude,
  })  : latitude = latitude < -90.0 ? -90.0 : (latitude > 90.0 ? 90.0 : latitude),
        longitude = longitude >= -180 && longitude < 180 ? longitude : (longitude + 180.0) % 360.0 - 180.0;

  /// 位置的纬度
  double latitude;

  /// 位置的经度
  double longitude;

  Object encode() {
    return <Object?>[
      latitude,
      longitude,
    ];
  }

  static Position decode(List<Object?> result) {
    assert(result.length == 2);
    return Position(
      latitude: result[0]! as double,
      longitude: result[1]! as double,
    );
  }
}

/// 地图区域
class Region {
  Region({
    required this.north,
    required this.east,
    required this.south,
    required this.west,
  });

  /// 最北的纬度
  double north;

  /// 最东的经度
  double east;

  /// 最南的纬度
  double south;

  /// 最西的经度
  double west;

  Object encode() {
    return <Object?>[
      north,
      east,
      south,
      west,
    ];
  }

  static Region decode(List<Object?> result) {
    return Region(
      north: result[0]! as double,
      east: result[1]! as double,
      south: result[2]! as double,
      west: result[3]! as double,
    );
  }
}

/// 对象的像素尺寸
class Size {
  Size({
    required this.width,
    required this.height,
  });

  double width;
  double height;

  Object encode() {
    return <Object?>[
      width,
      height,
    ];
  }

  static Size decode(List<Object?> result) {
    return Size(
      width: result[0]! as double,
      height: result[1]! as double,
    );
  }
}

/// UI控件位置偏移
class UIControlOffset {
  UIControlOffset({
    required this.x,
    required this.y,
  });

  /// X轴方向的位置偏移
  double x;

  /// Y轴方向的位置偏移
  double y;

  Object encode() {
    return <Object?>[
      x,
      y,
    ];
  }

  static UIControlOffset decode(List<Object?> result) {
    return UIControlOffset(
      x: result[0]! as double,
      y: result[1]! as double,
    );
  }

  UIControlOffset copyWith({
    double? x,
    double? y,
  }) {
    return UIControlOffset(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }
}

/// UI控件位置
class UIControlPosition {
  UIControlPosition({
    required this.anchor,
    required this.offset,
  });

  /// UI控件位置锚点
  UIControlAnchor anchor;

  /// UI控件位置偏移
  UIControlOffset offset;

  Object encode() {
    return <Object?>[
      anchor.index,
      offset.encode(),
    ];
  }

  static UIControlPosition decode(List<Object?> result) {
    return UIControlPosition(
      anchor: result[0] as UIControlAnchor,
      offset: UIControlOffset.decode(result[1]! as List<Object?>),
    );
  }

  UIControlPosition copyWith({
    UIControlAnchor? anchor,
    UIControlOffset? offset,
  }) {
    return UIControlPosition(
      anchor: anchor ?? this.anchor,
      offset: offset ?? this.offset,
    );
  }
}

/// 用户定位配置
class UserLocationConfig {
  UserLocationConfig({
    this.userLocationButton,
    this.showUserLocation,
    this.userLocationStyle,
  });

  final bool? userLocationButton;
  final bool? showUserLocation;
  final UserLocationStyle? userLocationStyle;

  Object encode() {
    return <Object?>[
      userLocationButton,
      showUserLocation,
      userLocationStyle?.encode(),
    ];
  }

  static UserLocationConfig decode(List<Object?> result) {
    return UserLocationConfig(
      userLocationButton: result[0] as bool?,
      showUserLocation: result[1] as bool?,
      userLocationStyle: result[2] != null ? UserLocationStyle.decode(result[2]! as List<Object?>) : null,
    );
  }

  UserLocationConfig copyWith({
    bool? userLocationButton,
    bool? showUserLocation,
    UserLocationStyle? userLocationStyle,
  }) {
    return UserLocationConfig(
      userLocationButton: userLocationButton ?? this.userLocationButton,
      showUserLocation: showUserLocation ?? this.showUserLocation,
      userLocationStyle: userLocationStyle ?? this.userLocationStyle,
    );
  }
}

/// 用户定位样式
class UserLocationStyle {
  UserLocationStyle({
    this.userLocationType,
    this.fillColor,
    this.strokeColor,
    this.lineWidth,
    this.image,
  });

  /// 用户定位类型
  final UserLocationType? userLocationType;

  /// 精度圈的填充颜色
  final Color? fillColor;

  /// 精度圈的边线颜色
  final Color? strokeColor;

  /// 精度圈的边线宽度
  final double? lineWidth;

  /// 定位图标以替代蓝色原点
  final Bitmap? image;

  Object encode() {
    return <Object?>[
      userLocationType?.index,
      fillColor?.value,
      strokeColor?.value,
      lineWidth,
      image?.encode(),
    ];
  }

  static UserLocationStyle decode(List<Object?> result) {
    return UserLocationStyle(
      userLocationType: result[0] as UserLocationType?,
      fillColor: result[1] != null ? Color(result[1] as int) : null,
      strokeColor: result[2] != null ? Color(result[2] as int) : null,
      lineWidth: result[3] as double?,
      image: result[4] != null ? Bitmap.decode(result[4]! as List<Object?>) : null,
    );
  }
}
