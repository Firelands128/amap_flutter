@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// 地图控件基类，可扩展做自定义地图控件
extension type Control._(JSObject _) implements JSObject {
  /// 构造函数
  external Control(ControlConfig opts);

  /// 添加控件到地图上
  external void addTo(AMap map);

  /// 从地图上移除控件
  external void remove();

  /// 设置控件可见
  external void show();

  /// 设置控件隐藏
  external void hide();
}

/// 地图控件配置类
extension type ControlConfig._(JSObject _) implements JSObject {
  /// 构造函数
  ControlConfig() : this._(JSObject());

  /// 控件停靠位置 { top: 5; left: 5; right: 5; bottom: 5 } 或者 'LT': 左上角, 'RT': 右上角, 'LB': 左下角, 'RB': 右下角
  external ControlPosition position;

  /// 相对于地图容器左上角的偏移量，正数代表向右下偏移，默认为AMap.Pixel(10,10)
  external Pixel offset;

  /// 是否显示倾斜、旋转按钮。默认为 true
  external JSBoolean showControlButton;
}

/// 地图控件停靠位置
extension type ControlPosition._(JSObject _) implements JSObject {
  /// 构造函数
  ControlPosition() : this._(JSObject());

  /// 距顶端距离
  external JSString top;

  /// 距左侧距离
  external JSString left;

  /// 距底端距离
  external JSString bottom;

  /// 距右侧距离
  external JSString right;
}

/// 比例尺插件。位于地图右下角，用户可控制其显示与隐藏。继承自 AMap.Control
extension type Scale._(JSObject _) implements Control {
  /// 构造函数
  external Scale(ControlConfig opts);
}

/// 地图操作工具条插件。可支持方向导航、位置定位、视野级别缩放、视野级别选择等操作。继承自 AMap.Control
extension type ToolBar._(JSObject _) implements Control {
  /// 构造函数
  external ToolBar(ControlConfig opts);
}

/// 组合了旋转、倾斜、复位在内的地图控件
@JS()
extension type ControlBar._(JSObject _) implements Control {
  /// 构造函数
  external ControlBar(ControlConfig opts);
}

/// 地图类型切换插件。用户通过该插件进行地图切换。
@JS("MapType")
extension type MapTypeControl._(JSObject _) implements Control {
  external MapTypeControl(MapTypeControlOptions opts);

  /// 添加一个图层
  external void addLayer(LayerInfo layerInfo);

  /// 移除一个图层
  external void removeLayer(String id);
}

/// 地图类型配置类
extension type MapTypeControlOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MapTypeControlOptions() : this._(JSObject());

  /// 初始化默认图层类型。取值为0：默认底图，取值为1：卫星图，默认值为0。
  external JSNumber defaultType;

  /// 叠加实时交通图层，默认值为false
  external JSBoolean showTraffic;

  /// 叠加路网图层，默认值为false
  external JSBoolean showRoad;
}

/// 图层信息类
extension type LayerInfo._(JSObject _) implements JSObject {
  /// 构造函数
  LayerInfo() : this._(JSObject());

  /// 图层id
  external JSString id;

  /// 图层是否可用
  external JSString enable;

  /// 图层暂时名称
  external JSString name;

  /// ("base" | "overlay")	图层类型，base 是属于底图图层，overlay 属于叠加图层。
  external JSString type;

  /// 图层对象
  external Layer layer;

  /// 图层是否显示
  external JSBoolean show;
}

/// 鹰眼控件，用于显示缩略地图，显示于地图右下角，可以随主图的视口变化而变化，也可以配置成固定位置实现类似于南海附图的效果。
@JS()
extension type HawkEye._(JSObject _) implements Control {
  external HawkEye(HawkEyeOptions options);
}

/// 鹰眼控件配置类
extension type HawkEyeOptions._(JSObject _) implements JSObject {
  /// 构造函数
  HawkEyeOptions() : this._(JSObject());

  /// 是否随主图视口变化移动
  external JSBoolean autoMove;

  /// 是否显示视口矩形
  external JSBoolean showRectangle;

  /// 是否显示打开关闭的按钮
  external JSBoolean showButton;

  /// 默认是否展开
  external JSBoolean opened;

  /// 缩略图要显示的地图自定义样式，如'amap://styles/dark'
  external JSString mapStyle;

  /// 缩略图要显示的图层类型，默认为普通矢量地图
  external JSArray layers;

  /// 缩略图的宽度，同CSS，如'200px'
  external JSString width;

  /// 缩略图的高度，同CSS，如'200px'
  external JSString height;

  /// 缩略图距离地图右下角的像素距离，如 [2,2]
  external Pixel offset;

  /// 缩略图的边框样式，同CSS，如"double solid solid double"
  external JSString borderStyle;

  /// 缩略图的边框颜色，同CSS，如'silver'
  external JSString borderColor;

  /// 缩略图的圆角半径，同CSS，如'5px'
  external JSString borderRadius;

  /// 缩略图的边框宽度，同CSS，如'2px'
  external JSString borderWidth;

  /// 缩略图的像素尺寸，同CSS，如'12px'
  external JSString buttonSize;
}
