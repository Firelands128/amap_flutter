@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'package:web/web.dart' show HTMLElement;
import 'js.dart';

/// 信息窗体，地图仅可同时展示一个信息窗体，推荐为信息窗体通过样式显示设置尺寸
extension type InfoWindow._(JSObject _) implements JSObject {
  /// 构造函数
  external InfoWindow(InfoOptions opts);

  /// 打开信息窗体
  external void open(AMap map, LngLat position, num height);

  /// 获取信息窗体是否打开
  external JSBoolean getIsOpen();

  /// 设置信息窗体大小（isCustom为false时有效）
  external void setSize(Size size);

  /// 获取信息窗体大小
  external void setContent(HTMLElement content);

  /// 设置信息窗体锚点 默认值：'bottom-center'。可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external void setAnchor(String anchor);

  /// 获取用户自定义属性
  external JSAny getExtData();

  /// 设置用户自定义属性
  external void setExtData(JSAny extData);
}

extension type InfoOptions._(JSObject _) implements JSObject {
  /// 构造函数
  InfoOptions() : this._(JSObject());

  /// 是否自定义窗体。设为true时，信息窗体外框及内容完全按照content所设的值添加（默认为false，即在系统默认的信息窗体外框中显示content内容）
  external JSBoolean isCustom;

  /// 是否自动调整窗体到视野内（当信息窗体超出视野范围时，通过该属性设置是否自动平移地图，使信息窗体完全显示）
  external JSBoolean autoMove;

  /// autoMove 为 true 时，自动平移到视野内后的上右下左的避让宽度。默认值： [20, 20, 20, 20]
  external JSArray<JSNumber> avoid;

  /// 控制是否在鼠标点击地图后关闭信息窗体，默认false，鼠标点击地图后不关闭信息窗体
  external JSBoolean closeWhenClickMap;

  /// 显示内容，可以是HTML要素字符串或者HTMLElement对象
  external HTMLElement content;

  /// 信息窗体尺寸（isCustom为true时，该属性无效）
  external Size size;

  /// 信息窗体锚点。默认值：'bottom-center'。可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external JSString anchor;

  /// 信息窗体显示位置偏移量。默认基准点为信息窗体的底部中心。默认值: [0, 0]
  external Pixel offset;

  /// 信息窗体显示基点位置
  external LngLat position;
}

/// 详细信息展示窗体
extension type AdvancedInfoWindow._(JSObject _) implements JSObject {
  /// 构造详细信息展示窗体
  external AdvancedInfoWindow(AdvancedInfoWindowOptions opt);

  /// 在地图的指定位置打开信息窗体
  external void open(AMap aMap, LngLat pos);

  /// 关闭信息窗体
  external void close();

  /// 获取信息窗体是否打开
  external JSBoolean getIsOpen();

  /// 设置信息窗体内容，可通过该函数动态更新信息窗体中的信息
  external void setContent(HTMLElement content);

  /// 获取信息窗体内容，结果以字符串方式返回
  external JSString getContent();

  /// 设置信息窗体显示基点位置
  external void setPosition(LngLat lnglat);

  /// 获取信息窗体显示基点位置
  external LngLat getPosition();

  /// 获取信息窗体锚点（自v1.4.13 新增）
  external JSString getAnchor();

  /// 设置信息窗体锚点
  /// 可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  /// （自v1.4.13 新增）
  external void setAnchor();

  /// 清除高级信息窗体在地图上绘制的路线规划或者搜索的结果
  external void clear();
}

extension type AdvancedInfoWindowOptions._(JSObject _) implements JSObject {
  /// 构造函数
  AdvancedInfoWindowOptions() : this._(JSObject());

  /// 是否自动调整窗体到视野内（当信息窗体超出视野范围时，通过该属性设置是否自动平移地图，使信息窗体完全显示）
  external JSBoolean autoMove;

  /// 控制是否在鼠标点击地图后关闭信息窗体，默认false，鼠标点击地图后不关闭信息窗体
  external JSBoolean closeWhenClickMap;

  /// 显示内容，可以是HTML要素字符串或者HTMLElement对象
  external HTMLElement content;

  /// 信息窗体锚点，（自v1.4.13 新增）
  /// 默认值：'bottom-center'
  /// 可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external JSString anchor;

  /// 信息窗体显示位置偏移量。默认基准点为信息窗体的底部中心（若设置了anchor，则以anchor值为基准点）。
  external Pixel offset;

  /// 信息窗体显示基点位置（自v1.2 新增）
  external LngLat position;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选值
  external HTMLElement panel;

  /// 设定周边搜索的半径，默认值：5000，单位：米
  external JSNumber searchRadius;

  /// 是否支持显示周边搜索，默认是true
  external JSBoolean placeSearch;

  /// 是否支持驾车路径规划，默认是true
  external JSBoolean driving;

  /// 是否支持步行路径规划，默认是true
  external JSBoolean walking;

  /// 是否支持公交路径规划，默认是true
  external JSBoolean transit;

  /// 是否支持作为路径规划的起点，默认是true
  external JSBoolean asOrigin;

  /// 是否支持作为路径规划的终点，默认是true
  external JSBoolean asDestination;
}
