@JS("AMap")
library amap_flutter;

import 'dart:html';
import 'dart:js_util';

import 'package:js/js.dart';

import 'js.dart';

/// 地图对象类，封装了地图的属性设置、图层变更、事件交互等接口的类
@JS("Map")
class AMap {
  /// 构造函数
  /// div：地图容器DIV的id值
  /// opts：地图初始化参数对象
  external AMap(String div, MapOptions opts);

  /// 重新计算容器大小
  external void resize();

  /// 设置中心点
  external void setCenter(LngLat center, bool immediately, num? duration);

  /// 地图缩放至指定级别并以指定点为地图显示中心点
  external void setZoomAndCenter(
    num? zoom,
    LngLat? center,
    bool immediately,
    num? duration,
  );

  /// 获取当前地图视图范围/可视区域
  external Bounds getBounds();

  /// 获取地图中心点经纬度坐标值
  external LngLat getCenter();

  /// 设置地图显示的缩放级别，参数 zoom 可设范围：[2, 30]
  external void setZoom(num zoom, bool immediately, num? duration);

  /// 返回地图对象的容器
  external HtmlElement getContainer();

  /// 获取地图容器尺寸，单位：像素
  external Size getSize();

  /// 获取当前地图缩放级别, 默认取值范围为[2, 20]
  external num getZoom([num? digits]);

  /// 地图放大一级显示
  external void zoomIn();

  /// 地图缩小一级显示
  external void zoomOut();

  /// 获取地图当前俯仰角
  external num getPitch();

  /// 设置地图俯仰角
  external void setPitch(num pitch, bool immediately, num? duration);

  /// 获取地图顺时针旋转角度, 范围: [0 ~ 360]
  external num getRotation();

  /// 设置地图顺时针旋转角度, 旋转原点为地图容器中心点, 取值范围: 任意数字
  external void setRotation(num rotation, bool immediately, num? duration);

  /// 指定当前地图显示范围，参数 bounds 为指定的范围
  external void setBounds(Bounds bounds, bool immediately, List<num> avoid);

  /// 地图中心点平移至指定点位置
  external void panTo(LngLat lnglat, num? duration);

  /// 将多个图层一次替代地图上原有图层，会移除地图原有图层
  external void setLayers(List<Layer> layers);

  /// 获取地图图层数组，数组为一个或多个图层
  external List<Layer> getLayers();

  /// 以像素为单位, 沿 x 方向和 y 方向移动地图, x 向右为正, y 向下为正
  external void panBy(num x, num y, num? duration);

  /// 获取当前地图状态信息
  external Object getStatus();

  /// 设置当前地图显示状态
  external void setStatus(Object status);

  /// 获取地图默认鼠标指针样式
  external String getDefaultCursor();

  /// 设置地图默认鼠标指针样式
  external void setDefaultCursor(String cursor);

  /// 注销地图对象，并清空地图容器
  external void destroy();

  /// 经纬度转莫卡托坐标（单位：米）
  external List<num> lngLatToCoords(LngLat lnglat);

  /// 莫卡托坐标（单位：米）转经纬度
  external LngLat coordsToLngLat(List<num> coords);

  /// 获取Map的限制区域
  external Bounds getLimitBounds();

  /// 地图经纬度坐标转为地图容器像素坐标
  external Pixel lngLatToContainer(LngLat lnglat);

  /// 设置Map的限制区域
  external void setLimitBounds(Bounds bounds);

  /// 清除Map的限制区域
  external void clearLimitBounds();

  /// 获取当前位置的海拔高度
  external num getAltitude(LngLat lnglat);

  /// 获取地图缩放等级范围
  external List<num> getZooms();

  /// 设置地图缩放等级范围
  external void setZooms(List<num> zooms);

  /// 地图容器坐标转换成经纬度
  external LngLat containerToLngLat(Pixel pixel);

  /// 莫卡托（单位：米）转成地图容器坐标
  external List<num> coordToContainer(List<num> coord);

  /// 地图容器坐标转成莫卡托坐标（单位：米）
  external List<num> containerToCoord(Pixel pixel);

  /// 获取海拔高度
  external num getAltitudeByContainer(Pixel pixel);

  /// 平面地图像素坐标转换为地图经纬度坐标
  external LngLat pixelToLngLat(Pixel pixel, num? zoom);

  /// 经纬度坐标转换成平面地图像素坐标
  external Pixel lngLatToPixel(LngLat nglat, num? zoom);

  /// 获取指定位置的地图分辨率，单位：米/像素
  external num getResolution();

  /// 获取当前地图比例尺
  external num getScale(num dpi);

  /// 获取地图中心点所在区域
  external String getCity(Function getCityCallBack, List<num> lnglat);

  /// 按照行政区名称或adcode来设置地图显示的中心点
  external void setCity(String cityName);

  /// 根据地图上添加的覆盖物分布情况，自动缩放地图到合适的视野级别，参数均可缺省
  external Bounds setFitView([
    List<Overlay>? overlays,
    bool? immediately,
    List<num>? avoid,
    num? maxZoom,
  ]);

  /// 根据overlays计算出合适的中心点和zoom级别
  external List<Object> getFitZoomAndCenterByOverlays(
    List<Overlay> overlays,
    List<num> avoid,
    num maxZoom,
  );

  /// 根据bounds计算出合适的中心点和zoom级别
  external List<Object> getFitZoomAndCenterByBounds(
    List<num> bounds,
    List<num> avoid,
    num maxZoom,
  );

  /// 添加控件
  external void addControl(Control control);

  /// 移除地图上的指定控件
  external void removeControl(Control control);

  /// 设置地图的显示样式
  external void setMapStyle(String value);

  /// 获取地图的显示样式
  external String getMapStyle();

  /// 返回添加的覆盖物对象
  external List<Overlay> getAllOverlays(String? type);

  /// 删除地图上所有的覆盖物
  external void clearMap();

  /// 清除地图上的信息窗体
  external void clearInfoWindow();

  /// 获取地图显示元素种类
  external List<String> getFeatures();

  /// 设置地图上显示的元素种类
  external void setFeatures(List<String> features);

  external String getMapApprovalNumber();

  external void setMask(List<List<num>> maskPath);

  /// 设置文字是否拒绝掩模，true：不进行掩模，false：掩模
  external void setLabelRejectMask(bool reject);
}

extension Map$Event on AMap {
  /// 绑定事件
  on(String type, void Function(MapsEvent) handler) {
    final jsHandler = allowInterop(handler);
    callMethod(this, "on", [type, jsHandler]);
  }

  /// 解绑地图事件
  off(String type, void Function(MapsEvent) handler) {
    final jsHandler = allowInterop(handler);
    callMethod(this, "off", [type, jsHandler]);
  }

  /// 添加覆盖物
  void addOverlay(Overlay overlay) {
    callMethod(this, "add", [overlay]);
  }

  /// 添加多个覆盖物
  void addOverlays(List<Overlay> overlays) {
    callMethod(this, "add", [overlays]);
  }

  /// 添加图层
  void addLayer(Layer layer) {
    callMethod(this, "add", [layer]);
  }

  /// 添加多个图层
  void addLayers(List<Layer> layers) {
    callMethod(this, "add", [layers]);
  }

  /// 删除覆盖物
  void removeOverlay(Overlay overlay) {
    callMethod(this, "remove", [overlay]);
  }

  /// 删除多个覆盖物
  void removeOverlays(List<Overlay> overlays) {
    callMethod(this, "remove", [overlays]);
  }

  /// 删除图层
  void removeLayer(Layer layer) {
    callMethod(this, "remove", [layer]);
  }

  /// 删除多个图层
  void removeLayers(List<Layer> layers) {
    callMethod(this, "remove", [layers]);
  }
}

@JS()
@anonymous
class MapOptions {
  /// 构造函数
  external factory MapOptions();

  /// 初始地图中心经纬度
  external LngLat center;

  /// 初始地图缩放级别
  external num zoom;

  /// 初始地图顺时针旋转的角度，默认为0
  external num rotation;

  /// 初始地图俯仰角度，默认为0
  external num pitch;

  /// 初始地图视图模式，默认为2D
  external String viewMode;

  /// 初始地图是否展示地形，默认为false
  external bool terrain;

  /// 设置地图上显示的元素种类，默认为['bg','point','road','building']
  external List<String> features;

  /// 地图图层数组
  external List<String> layers;

  /// 地图显示的缩放级别范围，默认为[2,20]
  external List<num> zooms;

  /// 地图是否允许拖拽，默认为true
  external bool dragEnable;

  /// 地图是否允许缩放
  external bool zoomEnable;

  /// 地图是否使用缓动效果，默认为true
  external bool jogEnable;

  /// 是否允许设置俯仰角度，默认为true
  external bool pitchEnable;

  /// 地图是否可旋转，默认为true
  external bool rotateEnable;

  /// 地图平移过程中是否使用动画，默认为true
  external bool animateEnable;

  /// 地图是否可通过键盘控制，默认为true
  external bool keyboardEnable;

  /// 地图是否可通过双击鼠标放大地图，默认为true
  external bool doubleClickZoom;

  /// 地图是否可通过鼠标滚轮缩放浏览，默认为true
  external bool scrollWheel;

  /// 地图在移动终端上是否可通过多点触控缩放浏览地图，默认为true
  external bool touchZoom;

  /// 手机端双指缩放是否以地图中心为中心，否则以双指中间点为中心，默认为true
  external bool touchZoomCenter;

  /// 是否展示地图文字和 POI 信息，默认为true
  external bool showLabel;

  /// 地图默认鼠标样式
  external String defaultCursor;

  /// 是否开启地图热点和标注的hover效果，PC端默认是true，移动端默认是 false
  external bool isHotspot;

  /// 设置地图的显示样式
  external String mapStyle;

  /// 地图楼块的侧面颜色
  external String wallColor;

  /// 地图楼块的顶面颜色
  external String roofColor;

  /// 是否展示地图3D楼块，默认true
  external bool showBuildingBlock;

  /// 是否自动展示室内地图，默认是false
  external bool showIndoorMap;

  /// 天空颜色，3D模式下带有俯仰角时会显示
  external String skyColor;

  /// 文字是否拒绝掩模图层进行掩模，默认是false
  external bool labelRejectMask;

  /// 为Map实例指定掩模的路径，各图层将只显示路径范围内图像，3D视图下有效。格式为一个经纬度的一维、二维或三维数组
  external List<num> mask;

  /// 额外配置的WebGL参数，默认为空
  @JS("WebGLParams")
  external Object webGLParams;
}
