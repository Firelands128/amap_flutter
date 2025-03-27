@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// LayerGroup类用来包装其它图层类的实例， 对实例集合做批量操作， 避免开发者对多个需要设置同样属性的图层实例做循环处理
extension type LayerGroup._(JSObject _) implements JSObject {
  /// 构造函数
  external LayerGroup(JSArray<Layer> layers);

  /// 添加到地图上面
  external JSAny setMap(AMap map);

  /// 判断传入的图层实例是否在集合中
  external void hasLayer(Layer layer);

  /// 修改图层属性(包括线样式、样色等等)
  external JSAny setOptions(LayerOptions opts);

  /// 对集合中的图层做迭代操作
  external void eachLayer(EachLayerHandler iterator);

  /// 添加单个图层到集合中，不支持添加重复的图层
  external void addLayer(Layer layer);

  /// 添加图层数组到集合中，不支持添加重复的图层
  external void addLayers(JSArray<Layer> layers);

  /// 从集合中删除传入的图层实例
  external void removeLayer(Layer layer);

  /// 从集合中删除传入的图层实例数组
  external void removeLayers(JSArray<Layer> layers);

  /// 获取组里所有对象，包括图层和覆盖物
  external JSArray<Layer> getLayers();

  /// 清空图层
  external void clearLayers();

  /// 设置图层隐藏
  external void hide();

  /// 设置图层可见
  external void show();

  /// 事件批量绑定
  external void on(String type, JSFunction callback);

  /// 重新加载图层资源，重新渲染
  external JSAny reload();
}

/// 图层做迭代操作函数扩展类型
extension type EachLayerHandler(JSFunction _) implements JSFunction {
  external void call(Layer layer, num index, JSArray collections);
}

extension type LayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  LayerOptions() : this._(JSObject());

  /// 是否可见
  external JSBoolean visible;

  /// 透明度
  external JSNumber opacity;

  /// 层级
  external JSNumber zIndex;

  /// 集合可见范围
  external JSArray<JSNumber> zooms;
}

/// OverlayGroup 类用来包装其它覆盖物类的实例，对实例集合做整体操作，避免开发者对多个需要设置同样属性的覆盖物实例做循环处理
/// 此外从group中移除该覆盖物时，也会将该覆盖物从group对应的map中移除
/// 目前OverlayGroup支持Marker, Polygon, Polyline, Circle,CircleMarker, Rectangle, Ellipse 和 BezierCurve
extension type OverlayGroup._(JSObject _) implements JSObject {
  /// 构造函数
  external OverlayGroup(JSArray<Overlay> overlays);

  /// 添加单个覆盖物到集合中，不支持添加重复的覆盖物
  external void addOverlay(Overlay overlay);

  /// 添加覆盖物数组到集合中，不支持添加重复的覆盖物
  external void addOverlays(JSArray<Overlay> overlays);

  /// 返回当前集合中所有的覆盖物
  external JSArray getOverlays();

  /// 判断传入的覆盖物实例是否在集合中
  external JSBoolean hasOverlay(Overlay overlay);

  /// 从集合中删除传入的覆盖物实例
  external void removeOverlay(Overlay overlay);

  /// 从集合中删除传入的覆盖物实例数组
  external void removeOverlays(JSArray overlays);

  /// 清空集合
  external void clearOverlays();

  /// 对集合中的覆盖物做迭代操作
  external void eachOverlay(EachOverlayHandler iterator);

  /// 在地图上显示集合中覆盖物
  external void show();

  /// 在地图上隐藏集合中覆盖物
  external void hide();

  /// 修改覆盖物属性(包括线样式、样色等等)
  external void setOptions(JSObject opt);
}

/// 覆盖物迭代操作的回调函数扩展类型
extension type EachOverlayHandler(JSFunction _) implements JSFunction {
  external void call(Overlay overlay, num index, JSArray collections);
}
