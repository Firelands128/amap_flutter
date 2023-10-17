@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

@JS()
class Overlay {}

/// 构造多边形对象，通过PolygonOptions指定多边形样式
@JS()
class Polygon extends Overlay {
  /// 构造函数
  external Polygon(PolygonOptions opts);

  /// 隐藏多边形
  external void hide();

  /// 显示多边形
  external void show();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 获取多边形的属性
  external Object getOptions();

  /// 修改多边形属性（样式风格，包括组成多边形轮廓线的节点、轮廓线样式等。属性详情参看PolygonOptions列表）
  external void setOptions(dynamic polygonOptions);

  /// 获取多边形轮廓线节点数组
  external List<LngLat> getPath();

  /// 设置多边形离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 设置立面体高度值
  external void setExtrusionHeight(num extrusionHeight);

  external num getExtrusionHeight();

  external Bounds getBounds();

  /// 销毁内存-多边形
  external void destroy();

  /// 获取多边形的面积（单位：平方米），若开启 terrain 则在地形基础上进行面积测量， 默认值为false
  external num getArea(bool isTerrain);

  /// 判断坐标是否在多边形内， true 包含，false 不包含
  external bool contains(LngLat originPoint);

  /// 多边形轮廓线的节点坐标数组。支持 单个普通多边形({Array})，单个带孔多边形({Array<Array>})，多个带孔多边形({Array<Array<Array>>})
  external void setPath(List<LngLat>? path);

  /// 获取离地多边形平面绝对海拔高度值 （此方法适用于 JSAPI v2.1Beta 及以上版本）
  external num getPlaneHeight();
}

@JS()
@anonymous
class PolygonOptions {
  /// 构造函数
  external PolygonOptions();

  /// 多边形轮廓线的节点坐标数组。 支持 单个普通多边形({Array })，单个带孔多边形({Array<Array >})，多个带孔多边形({Array<Array<Array >>})
  external List<LngLat> path;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external num strokeOpacity;

  /// 轮廓线宽度，默认为2
  external num strokeWeight;

  /// 多边形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external String fillColor;

  /// 多边形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num fillOpacity;

  /// 设置多边形是否可拖拽移动，默认为false
  external bool draggable;

  /// 设置 polygon 是否离地绘制，默认值为0 。大于0时离地绘制，此时平面高度等于 height 属性值加 polygon 质心点绝对海拔高度值，可以通过getPlaneHeight() 方法获取当前平面高度值（此属性适用于 JSAPI v2.1Beta及以上的版本）。
  external num height;

  /// 设置多边形是否拉伸为的立面体高度值，默认值为0
  external num extrusionHeight;

  /// polygon 立面体侧面颜色，支持 rgba、rgb、十六进制等。默认为#00D3FC
  external String wallColor;

  /// polygon 立面体顶面颜色，支持 rgba、rgb、十六进制等。默认为#00B2D5
  external String roofColor;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external Object? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external String strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external List<num>? strokeDasharray;
}

/// 构造折线对象，支持 lineString 和 MultiLineString
@JS()
class Polyline extends Overlay {
  /// 构造函数
  external Polyline(PolylineOptions opts);

  /// 隐藏折线
  external void hide();

  /// 显示折线
  external void show();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 获取线的属性
  external PolylineOptions getOptions();

  /// 获取折线路径的节点数组
  external List<LngLat> getPath();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 设置折线离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 销毁内存-折线
  external void destroy();

  /// 获取当前折线的矩形范围对象
  external Bounds? getBounds();

  /// 设置组成该折线的节点数组,支持单条折线(LngLat[]) 多条折线（LngLat[][]）
  external dynamic setPath(List<LngLat>? path);

  external void moveWithPos(dynamic dx, dynamic dy);

  /// 获取折线的总长度（单位：米），是否在地形基础上进行距离测量 默认为false
  external dynamic getLength(bool isTerrain);

  external void getEndDistance();

  external void generateBuffer(dynamic gl);

  /// 修改折线属性（包括路径的节点、线样式、是否绘制大地线等。属性详情参看PolylineOptions列表)
  external void setOptions(PolylineOptions optsArg);

  /// 判断坐标是否在折线内
  external bool contains(LngLat point);

  /// 获取当前Polyline海拔高度值 （此方法适用于 JSAPI 2.1Beta 及以上版本）
  external num getPolylineHeight();
}

@JS()
@anonymous
class PolylineOptions {
  /// 构造函数
  external PolylineOptions();

  /// polyline 路径，支持 lineString 和 MultiLineString
  external List<LngLat> path;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num strokeOpacity;

  /// 轮廓线宽度,默认为:2
  external num strokeWeight;

  /// 是否显示描边,默认false
  external bool isOutline;

  /// 描边的宽度，默认为1
  external num borderWeight;

  /// 线条描边颜色，此项仅在isOutline为true时有效，默认：#00B2D5
  external String outlineColor;

  /// 设置多边形是否可拖拽移动，默认为false
  external bool draggable;

  /// 设置polyline是否离地绘制，默认值为0，大于0时离地绘制，此时polyline高度等于height属性值加polyine起点绝对高程值。可以通过getPolylineHeight()获取当前折线高度值（此属性适用于 JSAPI v2.1及以上版本）。
  external num height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external Object? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed
  external String strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external List<num>? strokeDasharray;

  /// 折线拐点的绘制样式，默认值为'miter'尖角，其他可选值：'round'圆角、'bevel'斜角
  external String lineJoin;

  /// 折线两端线帽的绘制样式，默认值为'butt'无头，其他可选值：'round'圆头、'square'方头
  external String lineCap;

  /// 是否绘制成大地线，默认false
  external bool geodesic;

  /// 是否延路径显示白色方向箭头,默认false。建议折线宽度大于6时使用
  external bool showDir;
}

/// 贝塞尔曲线
@JS()
class BezierCurve extends Overlay {
  /// 构造函数
  external BezierCurve(BezierCurveOptions opts);

  /// 修改折线属性（包括路径的节点、线样式、是否绘制大地线等。属性详情参看 BezierCurveOptions 列表）
  external void setOptions(BezierCurveOptions optsArg);

  external void generateBuffer(dynamic gl);

  /// 获取贝塞尔曲线路径的节点数组
  external List<List<num>> getPath();

  /// 设置组成该折线的节点数组
  external void setPath(List<List<num>> path);

  /// 获取当前折线的矩形范围对象
  external Bounds? getBounds();

  /// 隐藏贝塞尔线
  external void hide();

  /// 显示贝塞尔曲线
  external void show();

  /// 设置贝塞尔曲线离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 获取当前贝塞尔曲线离地高度值 （此方法适用于 JSAPI 2.1Beta 及以上版本）
  external num getPolylineHeight();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 销毁内存-贝塞尔曲线
  external void destroy();

  /// 获取线的属性
  external BezierCurveOptions getOptions();

  /// 判断坐标是否在曲线内
  external bool contains(LngLat point);

  /// 获取曲线的总长度（单位：米）
  external num getLength();
}

@JS()
@anonymous
class BezierCurveOptions {
  /// 构造函数
  external BezierCurveOptions();

  /// 贝瑟尔曲线的路径。描述为一个二维数组规则如下：第一个元素是起点， 之后的元素同时描述控制点和途经点，之后每个元素可以有0个到2个控制点 控制点在前，途经点在最后 [ [lng,lat] ,//起点0 [lng,lat,lng,lat,lng,lat] ,//控制点、控制点、途经点2 [lng,lat,lng,lat] //控制点、途经点3 ] 或者 [ [ [lng,lat] ],//起点0 [ [lng,lat] , [lng,lat] ],//控制点、途经点1 [ [lng,lat] , [lng,lat] , [lng,lat] ],//控制点、控制点、途经点2 [ [lng,lat] , [lng,lat] ]//控制点、途经点3 ]
  external List<LngLat> path;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num strokeOpacity;

  /// 轮廓线宽度
  external num strokeWeight;

  /// 描边线宽度，默认为1
  external num borderWeight;

  /// 是否显示描边,默认false
  external bool isOutline;

  /// 线条描边颜色，此项仅在isOutline为true时有效，默认：#00B2D5
  external String outlineColor;

  /// 设置贝瑟尔曲线是否离地绘制，默认值为0；大于0时离地绘制，此时曲线高度等于height值加曲线起点高程值，可以通过getPolylineHeight获取当前折线高度值（此属性只适用于JSAPI v2.1Beta 及以上版本）。
  external num height;

  /// 设置多边形是否可拖拽移动，默认为false
  external bool draggable;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external Object? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external String strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external List<num>? strokeDasharray;

  /// 折线拐点的绘制样式，默认值为'miter'尖角，其他可选值：'round'圆角、'bevel'斜角
  external String lineJoin;

  /// 折线两端线帽的绘制样式，默认值为'butt'无头，其他可选值：'round'圆头、'square'方头
  external String lineCap;

  /// 是否绘制成大地线，默认false
  external bool geodesic;

  /// 是否延路径显示白色方向箭头,默认false。建议折线宽度大于6时使用
  external bool showDir;
}

/// 构造圆形对象，通过CircleOptions指定多边形样式
@JS()
class Circle extends Overlay {
  /// 构造函数
  external Circle(CircleOptions opts);

  external void svgDom();

  /// 设置圆中心点
  external void setCenter(LngLat center);

  /// 设置圆形的半径
  external void setRadius(num radius);

  /// 获取圆中心点
  external LngLat getCenter();

  /// 获取圆形的半径
  external num getRadius();

  /// 判断指定点坐标是否在圆内
  external bool contains(LngLat point);

  /// 修改圆属性（样式风格，包括组成圆形轮廓线的节点、轮廓线样式等。属性详情参看CircleOptions列表）
  external void setOptions(CircleOptions optsArg);

  /// 隐藏圆形
  external void hide();

  /// 设置圆平面离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  external num getPlaneHeight();

  /// 显示圆形
  external void show();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 销毁内存-圆形
  external void destroy();

  /// 获取面积,平米
  external num getArea();

  /// 获取圆形的属性
  external CircleOptions getOptions();
}

@JS()
@anonymous
class CircleOptions {
  /// 构造函数
  external CircleOptions();

  /// 圆心位置
  external LngLat center;

  /// 圆半径，单位:米
  external num radius;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 轮廓线颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external num strokeOpacity;

  /// 轮廓线宽度，默认为2
  external num strokeWeight;

  /// 多边形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external String fillColor;

  /// 多边形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num fillOpacity;

  /// 设置多边形是否可拖拽移动，默认为false
  external bool draggable;

  /// 设置圆是否离地绘制，默认值为0；大于0时离地绘制，此时圆平面高度等于height值加Circle质心点高程值，可以通过getPlaneHeight方法获取当前圆平面高度值（此属性只适用于JSAPI v2.1Beta及以上版本）。
  external num height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external Object? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external String strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external List<num>? strokeDasharray;
}

/// 构造圆形对象，通过CircleOptions指定多边形样式
@JS()
class CircleMarker extends Overlay {
  /// 构造函数
  external CircleMarker(CircleMarkerOptions opts);

  /// 判断指定点坐标是否在圆内
  external bool contains(LngLat point);

  /// 隐藏圆点
  external void hide();

  /// 设置圆点的半径
  external void setRadius(num radius);

  external void generateBuffer();

  /// 获取圆点中心
  external LngLat getCenter();

  /// 获取圆点的半径
  external num getRadius();

  /// 显示CircleMarker
  external void show();

  /// 修改圆点标记的属性（样式风格，包括轮廓线、填充色等。属性详情参看CircleMarkerOptions列表）
  external void setOptions(CircleMarkerOptions optsArg);

  /// 获取圆点的属性
  external CircleMarkerOptions getOptions();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 获取当前CircleMarker 的绝对高度
  external num getCurAltitude();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 销毁内存-CircleMarker
  external void destroy();
}

@JS()
@anonymous
class CircleMarkerOptions {
  /// 构造函数
  external CircleMarkerOptions();

  /// 圆心位置
  external LngLat center;

  /// 圆半径，单位:px 最大值64
  external num radius;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 轮廓线颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external num strokeOpacity;

  /// 轮廓线宽度，默认为2
  external num strokeWeight;

  /// 多边形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external String fillColor;

  /// 多边形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num fillOpacity;

  /// 设置多边形是否可拖拽移动，默认为false
  external bool draggable;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external Object? extData;
}

/// 构造多边形对象，通过EllipseOptions指定多边形样式
@JS()
class Ellipse extends Overlay {
  /// 构造函数
  external Ellipse(EllipseOptions opts);

  external get path;

  external get svgDom;

  external get centroid;

  /// 设置椭圆的中心点
  external void setCenter(LngLat center);

  /// 设置椭圆的半径
  external void setRadius(List<num> radius);

  /// 设置椭圆离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 获取椭圆的圆心
  external LngLat getCenter();

  /// 获取椭圆的半径
  external num getRadius();

  external void generateBuffer(dynamic gl);

  /// 隐藏椭圆
  external void hide();

  /// 修改椭圆属性（样式风格，包括组成椭圆轮廓线的节点、轮廓线样式等。属性详情参看Ellipse
  external void setOptions(EllipseOptions optsArg);

  /// 获取当前平面高度值 （此方法适用于 JSAPI v2.1Beta 及以上版本）
  external num getPlaneHeight();

  /// 显示椭圆
  external void show();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 销毁内存-椭圆
  external void destroy();

  /// 获取面积,平米
  external num getArea();

  /// 判断指定点坐标是否在椭圆内
  external void contains(LngLat point);

  /// 获取椭圆的属性
  external EllipseOptions getOptions();
}

@JS()
@anonymous
class EllipseOptions {
  /// 构造函数
  external EllipseOptions();

  /// 椭圆圆心
  external LngLat center;

  /// 椭圆的半径，用2个元素的数组表示，单位：米 如： radius: [1000, 2000] 表示横向半径是1000，纵向的半径是2000 默认值： [1000, 1000]
  external List<num> radius;

  /// 椭圆覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上，默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external num strokeOpacity;

  /// 轮廓线宽度，默认为2
  external num strokeWeight;

  /// 椭圆填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external String fillColor;

  /// 椭圆填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num fillOpacity;

  /// 设置椭圆是否可拖拽移动，默认为false
  external bool draggable;

  /// 设置椭圆是否离地绘制，默认值为0.0；大于0时离地绘制，此时椭圆平面高度等于height值加Ellipse质心点高程值，可以通过getPlaneHeight方法获取当前椭圆平面高度值（此属性适用于v2.1JSAPI 及以上版本）。
  external num height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如 id 等
  external Object? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external String strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external List<num>? strokeDasharray;
}

/// 构造矩形对象，通过RectangleOptions指定多边形样式
@JS()
class Rectangle extends Overlay {
  /// 构造函数
  external Rectangle(RectangleOptions opts);

  /// 判断坐标是否在矩形上
  external bool contains(LngLat point);

  /// 设置矩形的范围
  external void setBounds(Bounds bounds);

  external void generateBuffer(dynamic gl);

  /// 修改矩形属性（样式风格，包括组成矩形轮廓线的节点、轮廓线样式等。属性详情参看RectangleOptions列表）
  external void setOptions(RectangleOptions optsArg);

  /// 获取当前矩形平面高度值 （此方法适用于 JSAPI 2.1Beta 及以上版本）
  external num getPlaneHeight();

  /// 隐藏矩形
  external void hide();

  /// 设置矩形离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 获取矩形的中心点
  external LngLat getCenter();

  /// 显示矩形
  external void show();

  /// 获取用户自定义属性
  external Object getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(Object extData);

  /// 销毁内存-矩形
  external void destroy();

  /// 获取面积,平米
  external num getArea();

  /// 获取矩形的属性
  external RectangleOptions getOptions();
}

@JS()
@anonymous
class RectangleOptions {
  /// 构造函数
  external RectangleOptions();

  /// 要显示该覆盖物的地图对象
  external AMap map;

  /// 矩形的范围
  external Bounds bounds;

  /// 矩形覆盖物的叠加顺序。地图上存在多个矩形覆盖物叠加时，通过该属性使级别较高的矩形覆盖物在上层显示，默认为10
  external num zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external bool bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external String? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external String strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external num strokeOpacity;

  /// 轮廓线宽度，默认为2
  external num strokeWeight;

  /// 矩形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external String fillColor;

  /// 矩形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external num fillOpacity;

  /// 设置矩形是否可拖拽移动，默认为false
  external bool draggable;

  /// 设置矩形平面是否离地绘制，默认值为0；大于0时离地绘制，此时矩形平面高度等于height值加Rectangle质心点高程值，可以通过getPlaneHeight方法获取当前平面高度值。（此属性适用于 JSAPI 2.1Beta 及以上版本）
  external num height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external Object? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external String strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external List<num>? strokeDasharray;
}

/// GeoJSON类，继承自OverLayGroup，可实现GeoJSON对象与OverlayGroup的相互转换
@JS()
class GeoJSON extends OverlayGroup {
  external GeoJSON(GeoJSONOptions opts);

  /// 加载新的GeoJSON对象，转化为覆盖物，旧的覆盖物将移除
  external void importData(dynamic geoJSON);

  /// 将当前对象包含的覆盖物转换为GeoJSON对象
  external Object toGeoJSON();
}

@JS()
@anonymous
class GeoJSONOptions {
  /// 要加载的标准GeoJSON对象
  external Object geoJSON;

  /// 指定点要素的绘制方式，缺省时为Marker的默认样式。geojson为当前要素对应的GeoJSON对象，lnglats为对应的线的路径
  external Function(Object geojson, LngLat lnglat) getMarker;

  /// 指定线要素的绘制方式，缺省时为Polyline的默认样式。geojson为当前要素对应的GeoJSON对象，lnglats为对应的线的路径
  external Function(Object geojson, LngLat lnglat) getPolyline;

  /// 指定面要素的绘制方式，缺省时为Polygon的默认样式。geojson为当前要素对应的GeoJSON对象，lnglats为对应的线的路径
  external Function(Object geojson, LngLat lnglat) getPolygon;
}
