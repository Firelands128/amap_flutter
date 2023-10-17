@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

/// 地图控件基类，可扩展做自定义地图控件
@JS()
class Control {
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
@JS()
@anonymous
class ControlConfig {
  /// 构造函数
  external ControlConfig();

  /// 控件停靠位置 { top: 5; left: 5; right: 5; bottom: 5 } 或者 'LT': 左上角, 'RT': 右上角, 'LB': 左下角, 'RB': 右下角
  external ControlPosition position;

  /// 相对于地图容器左上角的偏移量，正数代表向右下偏移，默认为AMap.Pixel(10,10)
  external Pixel offset;

  /// 是否显示倾斜、旋转按钮。默认为 true
  external bool showControlButton;
}

/// 地图控件停靠位置
@JS()
@anonymous
class ControlPosition {
  /// 构造函数
  external ControlPosition();

  /// 距顶端距离
  external String top;

  /// 距左侧距离
  external String left;

  /// 距底端距离
  external String bottom;

  /// 距右侧距离
  external String right;
}

/// 比例尺插件。位于地图右下角，用户可控制其显示与隐藏。继承自 AMap.Control
@JS()
class Scale extends Control {
  external Scale(ControlConfig opts);
}

/// 地图操作工具条插件。可支持方向导航、位置定位、视野级别缩放、视野级别选择等操作。继承自 AMap.Control
@JS()
class ToolBar extends Control {
  external ToolBar(ControlConfig opts);
}

/// 组合了旋转、倾斜、复位在内的地图控件
@JS()
class ControlBar extends Control {
  external ControlBar(ControlConfig opts);
}

/// 地图类型切换插件。用户通过该插件进行地图切换。
@JS("MapType")
class MapTypeControl extends Control {
  external MapTypeControl(MapTypeControlOptions opts);

  /// 添加一个图层
  external void addLayer(LayerInfo layerInfo);

  /// 移除一个图层
  external void removeLayer(String id);
}

/// 地图类型配置类
@JS()
@anonymous
class MapTypeControlOptions {
  /// 构造函数
  external MapTypeControlOptions();

  /// 初始化默认图层类型。取值为0：默认底图，取值为1：卫星图，默认值为0。
  external num defaultType;

  /// 叠加实时交通图层，默认值为false
  external bool showTraffic;

  /// 叠加路网图层，默认值为false
  external bool showRoad;
}

/// 图层信息类
@JS()
@anonymous
class LayerInfo {
  /// 构造函数
  external LayerInfo();

  /// 图层id
  external String id;

  /// 图层是否可用
  external String enable;

  /// 图层暂时名称
  external String name;

  /// ("base" | "overlay")	图层类型，base 是属于底图图层，overlay 属于叠加图层。
  external String type;

  /// 图层对象
  external Layer layer;

  /// 图层是否显示
  external bool show;
}

/// 鹰眼控件，用于显示缩略地图，显示于地图右下角，可以随主图的视口变化而变化，也可以配置成固定位置实现类似于南海附图的效果。
@JS()
class HawkEye extends Control {
  external HawkEye(HawkEyeOptions options);
}

/// 鹰眼控件配置类
@JS()
@anonymous
class HawkEyeOptions {
  /// 是否随主图视口变化移动
  external bool autoMove;

  /// 是否显示视口矩形
  external bool showRectangle;

  /// 是否显示打开关闭的按钮
  external bool showButton;

  /// 默认是否展开
  external bool opened;

  /// 缩略图要显示的地图自定义样式，如'amap://styles/dark'
  external String mapStyle;

  /// 缩略图要显示的图层类型，默认为普通矢量地图
  external List layers;

  /// 缩略图的宽度，同CSS，如'200px'
  external String width;

  /// 缩略图的高度，同CSS，如'200px'
  external String height;

  /// 缩略图距离地图右下角的像素距离，如 [2,2]
  external Pixel offset;

  /// 缩略图的边框样式，同CSS，如"double solid solid double"
  external String borderStyle;

  /// 缩略图的边框颜色，同CSS，如'silver'
  external String borderColor;

  /// 缩略图的圆角半径，同CSS，如'5px'
  external String borderRadius;

  /// 缩略图的边框宽度，同CSS，如'2px'
  external String borderWidth;

  /// 缩略图的像素尺寸，同CSS，如'12px'
  external String buttonSize;
}
