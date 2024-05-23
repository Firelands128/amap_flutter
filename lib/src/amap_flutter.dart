part of '../amap_flutter.dart';

/// 高德地图
class AMapFlutter extends StatefulWidget {
  const AMapFlutter({
    Key? key,
    this.mapType,
    this.mapStyle,
    this.mapFeatures = const {"bg", "road", "point", "building"},
    this.initCameraPosition,
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
    this.hawkEyeControlEnabled,
    this.mapTypeControlEnabled,
    this.logoPosition,
    this.compassControlPosition,
    this.scaleControlPosition,
    this.zoomControlPosition,
    this.doubleClickZoom,
    this.scrollWheel,
    this.touchZoom,
    this.touchZoomCenter,
    this.isHotspot,
    this.showTraffic,
    this.showBuildings = false,
    this.showIndoorMap = false,
    this.showSatelliteLayer = false,
    this.showRoadNetLayer = false,
    this.showBuildingBlock,
    this.showLabel,
    this.defaultCursor,
    this.viewMode,
    this.terrain,
    this.wallColor,
    this.roofColor,
    this.skyColor,
    this.showUserLocation,
    this.geolocationControlEnabled,
    this.userLocationStyle,
    this.onMapCreated,
    this.onMapInitComplete,
    this.onMapCompleted,
    this.onMapPress,
    this.onMapDoublePress,
    this.onMapRightPress,
    this.onMapLongPress,
    this.onCameraChange,
    this.onCameraChangeStart,
    this.onCameraChangeFinish,
    this.onMapMoveStart,
    this.onMapMove,
    this.onMapMoveEnd,
    this.onMapResized,
    this.onZoomChange,
    this.onZoomChangeStart,
    this.onZoomChangeEnd,
    this.onRotateChange,
    this.onRotateChangeStart,
    this.onRotateChangeEnd,
    this.onMouseMove,
    this.onMouseWheel,
    this.onMouseOver,
    this.onMouseOut,
    this.onMouseUp,
    this.onMouseDown,
    this.onDragStart,
    this.onDragging,
    this.onDragEnd,
    this.onTouchStart,
    this.onTouching,
    this.onTouchEnd,
    this.onPoiClick,
    this.onMarkerClick,
    this.onMarkerDragStart,
    this.onMarkerDrag,
    this.onMarkerDragEnd,
    this.onUserLocationChange,
  }) : super(key: key);

  /// 地图类型编号(iOS and Android Only)
  final MapType? mapType;

  /// 地图样式编号(Web Only)
  final String? mapStyle;

  /// 地图显示要素(Web Only)
  final Set<String> mapFeatures;

  /// 地图初始视野
  final CameraPosition? initCameraPosition;

  /// 地图是否允许拖拽
  final bool? dragEnable;

  /// 地图是否允许缩放
  final bool? zoomEnable;

  /// 地图是否允许俯仰
  final bool? tiltEnable;

  /// 地图是否允许旋转
  final bool? rotateEnable;

  /// 地图是否使用缓动效果，默认为true(Web Only)
  /// Only valid when init map
  final bool? jogEnable;

  /// 地图平移过程中是否使用动画，默认为true(Web Only)
  /// Only valid when init map
  final bool? animateEnable;

  /// 地图是否可通过键盘控制，默认为true(Web Only)
  /// Only valid when init map
  final bool? keyboardEnable;

  /// 是否显示指南针控件
  final bool? compassControlEnabled;

  /// 是否显示比例尺控件
  final bool? scaleControlEnabled;

  /// 是否显示缩放控件(Support Web/Android)
  final bool? zoomControlEnabled;

  /// 是否显示鹰眼控件(Web Only)
  final bool? hawkEyeControlEnabled;

  /// 是否显示地图类型控件(Web Only)
  final bool? mapTypeControlEnabled;

  /// Logo位置(Support iOS/Android)
  final UIControlPosition? logoPosition;

  /// 指南针控件位置
  final UIControlPosition? compassControlPosition;

  /// 比例尺控件位置
  final UIControlPosition? scaleControlPosition;

  /// 缩放控件位置(Support Web/Android)
  final UIControlPosition? zoomControlPosition;

  /// 地图是否可通过双击鼠标放大地图，默认为true(Web Only)
  /// Only valid when init map
  final bool? doubleClickZoom;

  /// 地图是否可通过鼠标滚轮缩放浏览，默认为true(Web Only)
  /// Only valid when init map
  final bool? scrollWheel;

  /// 地图在移动终端上是否可通过多点触控缩放浏览地图，默认为true(Web Only)
  /// Only valid when init map
  final bool? touchZoom;

  /// 手机端双指缩放是否以地图中心为中心，否则以双指中间点为中心，默认为true(Web Only)
  /// Only valid when init map
  final bool? touchZoomCenter;

  /// 是否开启地图热点和标注的hover效果，PC端默认是true，移动端默认是 false(Web Only)
  /// Only valid when init map
  final bool? isHotspot;

  /// 是否显示实时路况
  final bool? showTraffic;

  /// 是否显示楼块图层
  final bool? showBuildings;

  /// 是否显示室内图层
  final bool? showIndoorMap;

  /// 是否显示卫星图层(Web Only)
  final bool showSatelliteLayer;

  /// 是否显示路网图层(Web Only)
  final bool showRoadNetLayer;

  /// 是否展示地图3D楼块，默认true(Web Only)
  /// Only valid when init map
  final bool? showBuildingBlock;

  /// 是否展示地图文字和 POI 信息，默认为true(Web Only)
  /// Only valid when init map
  final bool? showLabel;

  /// 地图默认鼠标样式(Web Only)
  /// Only valid when init map
  final String? defaultCursor;

  /// 初始地图视图模式，默认为2D, 3D 地形图 目前仅支持 v2.1Beta(Web Only)
  /// Only valid when init map
  final String? viewMode;

  /// 初始地图是否展示地形，默认为false(Web Only)
  /// Only valid when init map
  final bool? terrain;

  /// 地图楼块的侧面颜色(Web Only)
  /// Only valid when init map
  final Color? wallColor;

  /// 地图楼块的顶面颜色(Web Only)
  /// Only valid when init map
  final Color? roofColor;

  /// 天空颜色，3D模式下带有俯仰角时会显示(Web Only)
  /// Only valid when init map
  final Color? skyColor;

  /// 是否显示当前定位
  final bool? showUserLocation;

  /// 是否显示定位按钮
  final bool? geolocationControlEnabled;

  /// 用户定位样式
  final UserLocationStyle? userLocationStyle;

  /// 地图创建完成事件回调函数
  ///
  /// 可以使用参数 [AMapController] 调用地图方法
  final void Function(AMapController)? onMapCreated;

  /// 当地图初始化完成时触发该回调(iOS only)
  final void Function()? onMapInitComplete;

  /// 当地图加载完成时触发该回调
  final void Function()? onMapCompleted;

  /// 当地图点击时触发该回调
  final void Function(Position)? onMapPress;

  /// 当地图双击时触发该回调(Web only)
  final void Function(Position)? onMapDoublePress;

  /// 当地图右键点击时触发该回调(Web only)
  final void Function(Position)? onMapRightPress;

  /// 当地图长按时触发该回调
  final void Function(Position)? onMapLongPress;

  /// 当地图视野变化时触发该回调
  final void Function(CameraPosition)? onCameraChange;

  /// 当地图视野开始变化时触发该回调
  final void Function(CameraPosition)? onCameraChangeStart;

  /// 当地图视野变化结束时触发该回调
  final void Function(CameraPosition)? onCameraChangeFinish;

  /// 当地图平移开始时触发该回调
  final void Function(Position)? onMapMoveStart;

  /// 当地图平移时触发该回调
  final void Function(Position)? onMapMove;

  /// 当地图平移结束时触发该回调
  final void Function(Position)? onMapMoveEnd;

  /// 当地图容器尺寸改变时触发该回调
  final void Function(Size)? onMapResized;

  /// 当地图缩放级别改变时触发该回调
  final void Function(double)? onZoomChange;

  /// 当地图缩放级别开始改变时触发该回调
  final void Function(double)? onZoomChangeStart;

  /// 当地图缩放级别结束改变时触发该回调
  final void Function(double)? onZoomChangeEnd;

  /// 当地图旋转时触发该回调
  final void Function(double)? onRotateChange;

  /// 当地图旋转开始时触发该回调
  final void Function(double)? onRotateChangeStart;

  /// 当地图旋转结束时触发该回调
  final void Function(double)? onRotateChangeEnd;

  /// 当移动鼠标时触发该回调(Web only)
  final void Function(Position)? onMouseMove;

  /// 当鼠标滚轮缩放地图时触发该回调(Web only)
  final void Function(double)? onMouseWheel;

  /// 当鼠标移入地图容器内时触发时触发该回调(Web only)
  final void Function(Position)? onMouseOver;

  /// 当鼠标移出地图容器时触发时触发该回调(Web only)
  final void Function(Position)? onMouseOut;

  /// 当鼠标在地图上单击抬起时触发时触发该回调(Web only)
  final void Function(Position)? onMouseUp;

  /// 当鼠标在地图上单击按下时触发时触发该回调(Web only)
  final void Function(Position)? onMouseDown;

  /// 当开始拖拽地图时触发该回调(Web only)
  final void Function(Position)? onDragStart;

  /// 当拖拽地图时触发该回调(Web only)
  final void Function(Position)? onDragging;

  /// 当停止拖拽地图时触发该回调(Web only)
  final void Function(Position)? onDragEnd;

  /// 当开始触摸地图时触发该回调(Web only)
  final void Function(Position)? onTouchStart;

  /// 当触摸移动地图时触发时触发该回调(Web only)
  final void Function(Position)? onTouching;

  /// 当停止触摸地图时触发该回调(Web only)
  final void Function(Position)? onTouchEnd;

  /// 当点击地图上任意的POI时调用，方法会传入点击的POI信息
  final void Function(Poi)? onPoiClick;

  /// 当点击点标记时触发该回调
  final void Function(String markerId)? onMarkerClick;

  /// 当开始拖动点标记时触发该回调
  final void Function(String markerId, Position position)? onMarkerDragStart;

  /// 当拖动点标记时触发该回调
  final void Function(String markerId, Position position)? onMarkerDrag;

  /// 当拖动点标记完成时触发该回调
  final void Function(String markerId, Position position)? onMarkerDragEnd;

  /// 当前位置改变时触发该回调
  final void Function(Location)? onUserLocationChange;

  @override
  createState() => AMapFlutterState();

  /// 初始化 SDK，显示地图前必须调用
  /// 请确保用户设置高德地图SDK API key
  /// 请确保用户同意高德地图SDK隐私协议
  static void init({
    required ApiKey apiKey,
    bool agreePrivacy = true,
  }) async {
    if (!kIsWeb) {
      await AMapFlutterPlatformInterface.instance.setApiKey(apiKey);
      await AMapFlutterPlatformInterface.instance.agreePrivacy(agreePrivacy);
    }
  }
}

class AMapFlutterState extends State<AMapFlutter> {
  static final defaultUIControlOffset = UIControlOffset(x: 0, y: 0);
  late final int mapId;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return HtmlElementView(
        viewType: "amap_flutter",
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: "amap_flutter",
          creationParams: {
            "options": MapInitConfig(
              mapType: widget.mapType,
              mapStyle: widget.mapStyle,
              cameraPosition: widget.initCameraPosition,
              dragEnable: widget.dragEnable,
              zoomEnable: widget.zoomEnable,
              tiltEnable: widget.tiltEnable,
              rotateEnable: widget.rotateEnable,
              jogEnable: widget.jogEnable,
              animateEnable: widget.animateEnable,
              keyboardEnable: widget.keyboardEnable,
              compassControlEnabled: widget.compassControlEnabled,
              scaleControlEnabled: widget.scaleControlEnabled,
              zoomControlEnabled: widget.zoomControlEnabled,
              logoPosition: widget.logoPosition,
              doubleClickZoom: widget.doubleClickZoom,
              scrollWheel: widget.scrollWheel,
              touchZoom: widget.touchZoom,
              touchZoomCenter: widget.touchZoomCenter,
              isHotspot: widget.isHotspot,
              showBuildingBlock: widget.showBuildingBlock,
              showLabel: widget.showLabel,
              showIndoorMap: widget.showIndoorMap,
              defaultCursor: widget.defaultCursor,
              viewMode: widget.viewMode,
              terrain: widget.terrain,
              wallColor: widget.wallColor,
              roofColor: widget.roofColor,
              skyColor: widget.skyColor,
            ).encode(),
          },
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: "amap_flutter",
          creationParams: {
            "options": MapInitConfig(
              mapType: widget.mapType,
              mapStyle: widget.mapStyle,
              cameraPosition: widget.initCameraPosition,
              dragEnable: widget.dragEnable,
              zoomEnable: widget.zoomEnable,
              tiltEnable: widget.tiltEnable,
              rotateEnable: widget.rotateEnable,
              jogEnable: widget.jogEnable,
              animateEnable: widget.animateEnable,
              keyboardEnable: widget.keyboardEnable,
              compassControlEnabled: widget.compassControlEnabled,
              scaleControlEnabled: widget.scaleControlEnabled,
              doubleClickZoom: widget.doubleClickZoom,
              scrollWheel: widget.scrollWheel,
              touchZoom: widget.touchZoom,
              touchZoomCenter: widget.touchZoomCenter,
              isHotspot: widget.isHotspot,
              showBuildingBlock: widget.showBuildingBlock,
              showLabel: widget.showLabel,
              showIndoorMap: widget.showIndoorMap,
              defaultCursor: widget.defaultCursor,
              viewMode: widget.viewMode,
              terrain: widget.terrain,
              wallColor: widget.wallColor,
              roofColor: widget.roofColor,
              skyColor: widget.skyColor,
            ).encode(),
          },
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      default:
        return Text("$defaultTargetPlatform is not supported");
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    MapUpdateConfig config = MapUpdateConfig();
    if (widget.mapType != null && widget.mapType != oldWidget.mapType) {
      config.mapType = widget.mapType;
    }
    if (widget.mapStyle != null && widget.mapStyle != oldWidget.mapStyle) {
      config.mapStyle = widget.mapStyle;
    }
    if (!setEquals(widget.mapFeatures, oldWidget.mapFeatures)) {
      config.mapFeatures = widget.mapFeatures.toList();
    }
    if (widget.dragEnable != null &&
        widget.dragEnable != oldWidget.dragEnable) {
      config.dragEnable = widget.dragEnable;
    }
    if (widget.zoomEnable != null &&
        widget.zoomEnable != oldWidget.zoomEnable) {
      config.zoomEnable = widget.zoomEnable;
    }
    if (widget.tiltEnable != null &&
        widget.tiltEnable != oldWidget.tiltEnable) {
      config.tiltEnable = widget.tiltEnable;
    }
    if (widget.rotateEnable != null &&
        widget.rotateEnable != oldWidget.rotateEnable) {
      config.rotateEnable = widget.rotateEnable;
    }
    if (widget.compassControlEnabled != null &&
        widget.compassControlEnabled != oldWidget.compassControlEnabled) {
      config.compassControlEnabled = widget.compassControlEnabled;
    }
    if (widget.scaleControlEnabled != null &&
        widget.scaleControlEnabled != oldWidget.scaleControlEnabled) {
      config.scaleControlEnabled = widget.scaleControlEnabled;
    }
    if (widget.zoomControlEnabled != null &&
        widget.zoomControlEnabled != oldWidget.zoomControlEnabled) {
      config.zoomControlEnabled = widget.zoomControlEnabled;
    }
    if (widget.hawkEyeControlEnabled != null &&
        widget.hawkEyeControlEnabled != oldWidget.hawkEyeControlEnabled) {
      config.hawkEyeControlEnabled = widget.hawkEyeControlEnabled;
    }
    if (widget.mapTypeControlEnabled != null &&
        widget.mapTypeControlEnabled != oldWidget.mapTypeControlEnabled) {
      config.mapTypeControlEnabled = widget.mapTypeControlEnabled;
    }
    if (widget.logoPosition != null &&
        widget.logoPosition != oldWidget.logoPosition) {
      config.logoPosition = widget.logoPosition;
    }
    if (widget.compassControlPosition != null &&
        widget.compassControlPosition != oldWidget.compassControlPosition) {
      config.compassControlPosition = widget.compassControlPosition;
    }
    if (widget.scaleControlPosition != null &&
        widget.scaleControlPosition != oldWidget.scaleControlPosition) {
      config.scaleControlPosition = widget.scaleControlPosition;
    }
    if (widget.zoomControlPosition != null &&
        widget.zoomControlPosition != oldWidget.zoomControlPosition) {
      config.zoomControlPosition = widget.zoomControlPosition;
    }
    if (widget.showTraffic != null &&
        widget.showTraffic != oldWidget.showTraffic) {
      config.showTraffic = widget.showTraffic;
    }
    if (widget.showBuildings != null &&
        widget.showBuildings != oldWidget.showBuildings) {
      config.showBuildings = widget.showBuildings;
    }
    if (widget.showIndoorMap != oldWidget.showIndoorMap) {
      config.showIndoorMap = widget.showIndoorMap;
    }
    if (widget.showSatelliteLayer != oldWidget.showSatelliteLayer) {
      config.showSatelliteLayer = widget.showSatelliteLayer;
    }
    if (widget.showRoadNetLayer != oldWidget.showRoadNetLayer) {
      config.showRoadNetLayer = widget.showRoadNetLayer;
    }
    if (widget.geolocationControlEnabled != null &&
        widget.geolocationControlEnabled !=
            oldWidget.geolocationControlEnabled) {
      config.userLocationConfig = config.userLocationConfig?.copyWith(
            userLocationButton: widget.geolocationControlEnabled,
          ) ??
          UserLocationConfig(
            userLocationButton: widget.geolocationControlEnabled,
          );
    }
    if (widget.showUserLocation != null &&
        widget.showUserLocation != oldWidget.showUserLocation) {
      config.userLocationConfig = config.userLocationConfig?.copyWith(
            showUserLocation: widget.showUserLocation,
          ) ??
          UserLocationConfig(
            showUserLocation: widget.showUserLocation,
          );
    }
    AMapFlutterPlatformInterface.instance.updateMapConfig(config, mapId: mapId);
  }

  _onPlatformViewCreated(int id) async {
    mapId = id;
    await AMapFlutterPlatformInterface.instance.init(id, widget);
    final AMapController controller = AMapController(widget, mapId: id);
    _initMap();
    widget.onMapCreated?.call(controller);
  }

  _initMap() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MapUpdateConfig config = MapUpdateConfig(
        mapType: widget.mapType,
        mapStyle: widget.mapStyle,
        mapFeatures: widget.mapFeatures.toList(),
        dragEnable: widget.dragEnable,
        zoomEnable: widget.zoomEnable,
        tiltEnable: widget.tiltEnable,
        rotateEnable: widget.rotateEnable,
        compassControlEnabled: widget.compassControlEnabled,
        scaleControlEnabled: widget.scaleControlEnabled,
        zoomControlEnabled: widget.zoomControlEnabled,
        hawkEyeControlEnabled: widget.hawkEyeControlEnabled,
        mapTypeControlEnabled: widget.mapTypeControlEnabled,
        logoPosition: widget.logoPosition,
        compassControlPosition: widget.compassControlPosition,
        scaleControlPosition: widget.scaleControlPosition,
        zoomControlPosition: widget.zoomControlPosition,
        showTraffic: widget.showTraffic,
        showBuildings: widget.showBuildings,
        showIndoorMap: widget.showIndoorMap,
        showSatelliteLayer: widget.showSatelliteLayer,
        showRoadNetLayer: widget.showRoadNetLayer,
        userLocationConfig: UserLocationConfig(
          userLocationButton: widget.geolocationControlEnabled,
          showUserLocation: widget.showUserLocation,
          userLocationStyle: widget.userLocationStyle,
        ),
      );
      AMapFlutterPlatformInterface.instance.updateMapConfig(
        config,
        mapId: mapId,
      );
      if (widget.initCameraPosition != null) {
        AMapFlutterPlatformInterface.instance.moveCamera(
          widget.initCameraPosition!,
          0,
          mapId: mapId,
        );
      }
    });
  }
}
