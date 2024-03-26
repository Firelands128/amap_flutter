@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

/// LayerGroup类用来包装其它图层类的实例， 对实例集合做批量操作， 避免开发者对多个需要设置同样属性的图层实例做循环处理
@JS()
class LayerGroup {
  /// 构造函数
  external LayerGroup(List<Layer> layers);

  /// 添加到地图上面
  external dynamic setMap(AMap map);

  /// 判断传入的图层实例是否在集合中
  external void hasLayer(Layer layer);

  /// 修改图层属性(包括线样式、样色等等)
  external dynamic setOptions(LayerOptions opts);

  /// 对集合中的图层做迭代操作
  external void eachLayer(
    Function(Layer layer, num index, List collections) iterator,
  );

  /// 添加单个图层到集合中，不支持添加重复的图层
  external void addLayer(Layer layer);

  /// 添加图层数组到集合中，不支持添加重复的图层
  external void addLayers(List<Layer> layers);

  /// 从集合中删除传入的图层实例
  external void removeLayer(Layer layer);

  /// 从集合中删除传入的图层实例数组
  external void removeLayers(List<Layer> layers);

  /// 获取组里所有对象，包括图层和覆盖物
  external List<Layer> getLayers();

  /// 清空图层
  external void clearLayers();

  /// 设置图层隐藏
  external void hide();

  /// 设置图层可见
  external void show();

  /// 事件批量绑定
  external void on(String type, Function callback);

  /// 重新加载图层资源，重新渲染
  external dynamic reload();
}

@JS()
@anonymous
class LayerOptions {
  /// 构造函数
  external LayerOptions();

  /// 是否可见
  external bool visible;

  /// 透明度
  external num opacity;

  /// 层级
  external num zIndex;

  /// 集合可见范围
  external List<num> zooms;
}

/// OverlayGroup 类用来包装其它覆盖物类的实例，对实例集合做整体操作，避免开发者对多个需要设置同样属性的覆盖物实例做循环处理
/// 此外从group中移除该覆盖物时，也会将该覆盖物从group对应的map中移除
/// 目前OverlayGroup支持Marker, Polygon, Polyline, Circle,CircleMarker, Rectangle, Ellipse 和 BezierCurve
@JS()
class OverlayGroup {
  external OverlayGroup(List<Overlay> overlays);

  /// 添加单个覆盖物到集合中，不支持添加重复的覆盖物
  external void addOverlay(Overlay overlay);

  /// 添加覆盖物数组到集合中，不支持添加重复的覆盖物
  external void addOverlays(List<Overlay> overlays);

  /// 返回当前集合中所有的覆盖物
  external List getOverlays();

  /// 判断传入的覆盖物实例是否在集合中
  external bool hasOverlay(Overlay overlay);

  /// 从集合中删除传入的覆盖物实例
  external void removeOverlay(Overlay overlay);

  /// 从集合中删除传入的覆盖物实例数组
  external void removeOverlays(List overlays);

  /// 清空集合
  external void clearOverlays();

  /// 对集合中的覆盖物做迭代操作
  external void eachOverlay(
    Function(Overlay overlay, num index, List collections) iterator,
  );

  /// 在地图上显示集合中覆盖物
  external void show();

  /// 在地图上隐藏集合中覆盖物
  external void hide();

  /// 修改覆盖物属性(包括线样式、样色等等)
  external void setOptions(Object opt);
}
