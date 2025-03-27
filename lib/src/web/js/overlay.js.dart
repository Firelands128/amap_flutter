@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

extension type Overlay._(JSObject _) implements JSObject {}

/// 构造多边形对象，通过PolygonOptions指定多边形样式
extension type Polygon._(JSObject _) implements Overlay {
  /// 构造函数
  external Polygon(PolygonOptions opts);

  /// 隐藏多边形
  external void hide();

  /// 显示多边形
  external void show();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 获取多边形的属性
  external JSObject getOptions();

  /// 修改多边形属性（样式风格，包括组成多边形轮廓线的节点、轮廓线样式等。属性详情参看PolygonOptions列表）
  external void setOptions(JSAny polygonOptions);

  /// 获取多边形轮廓线节点数组
  external JSArray<LngLat> getPath();

  /// 设置多边形离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 设置立面体高度值
  external void setExtrusionHeight(num extrusionHeight);

  external JSNumber getExtrusionHeight();

  external Bounds getBounds();

  /// 销毁内存-多边形
  external void destroy();

  /// 获取多边形的面积（单位：平方米），若开启 terrain 则在地形基础上进行面积测量， 默认值为false
  external JSNumber getArea(JSBoolean isTerrain);

  /// 判断坐标是否在多边形内， true 包含，false 不包含
  external JSBoolean contains(LngLat originPoint);

  /// 多边形轮廓线的节点坐标数组。支持 单个普通多边形({Array})，单个带孔多边形({Array<Array>})，多个带孔多边形({Array<Array<Array>>})
  external void setPath(JSArray<LngLat>? path);

  /// 获取离地多边形平面绝对海拔高度值 （此方法适用于 JSAPI v2.1Beta 及以上版本）
  external JSNumber getPlaneHeight();
}

extension type PolygonOptions._(JSObject _) implements JSObject {
  /// 构造函数
  PolygonOptions() : this._(JSObject());

  /// 多边形轮廓线的节点坐标数组。 支持 单个普通多边形({Array })，单个带孔多边形({Array<Array >})，多个带孔多边形({Array<Array<Array >>})
  external JSArray<LngLat> path;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external JSNumber strokeOpacity;

  /// 轮廓线宽度，默认为2
  external JSNumber strokeWeight;

  /// 多边形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external JSString fillColor;

  /// 多边形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber fillOpacity;

  /// 设置多边形是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 设置 polygon 是否离地绘制，默认值为0 。大于0时离地绘制，此时平面高度等于 height 属性值加 polygon 质心点绝对海拔高度值，可以通过getPlaneHeight() 方法获取当前平面高度值（此属性适用于 JSAPI v2.1Beta及以上的版本）。
  external JSNumber height;

  /// 设置多边形是否拉伸为的立面体高度值，默认值为0
  external JSNumber extrusionHeight;

  /// polygon 立面体侧面颜色，支持 rgba、rgb、十六进制等。默认为#00D3FC
  external JSString wallColor;

  /// polygon 立面体顶面颜色，支持 rgba、rgb、十六进制等。默认为#00B2D5
  external JSString roofColor;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external JSObject? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external JSString strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external JSArray<JSNumber>? strokeDasharray;
}

/// 构造折线对象，支持 lineString 和 MultiLineString
extension type Polyline._(JSObject _) implements Overlay {
  /// 构造函数
  external Polyline(PolylineOptions opts);

  /// 隐藏折线
  external void hide();

  /// 显示折线
  external void show();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 获取线的属性
  external PolylineOptions getOptions();

  /// 获取折线路径的节点数组
  external JSArray<LngLat> getPath();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 设置折线离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 销毁内存-折线
  external void destroy();

  /// 获取当前折线的矩形范围对象
  external Bounds? getBounds();

  /// 设置组成该折线的节点数组,支持单条折线(LngLat[]) 多条折线（LngLat[][]）
  external JSAny setPath(JSArray<LngLat>? path);

  external void moveWithPos(JSAny dx, JSAny dy);

  /// 获取折线的总长度（单位：米），是否在地形基础上进行距离测量 默认为false
  external JSAny getLength(JSBoolean isTerrain);

  external void getEndDistance();

  external void generateBuffer(JSAny gl);

  /// 修改折线属性（包括路径的节点、线样式、是否绘制大地线等。属性详情参看PolylineOptions列表)
  external void setOptions(PolylineOptions optsArg);

  /// 判断坐标是否在折线内
  external JSBoolean contains(LngLat point);

  /// 获取当前Polyline海拔高度值 （此方法适用于 JSAPI 2.1Beta 及以上版本）
  external JSNumber getPolylineHeight();
}

extension type PolylineOptions._(JSObject _) implements JSObject {
  /// 构造函数
  PolylineOptions() : this._(JSObject());

  /// polyline 路径，支持 lineString 和 MultiLineString
  external JSArray<LngLat> path;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber strokeOpacity;

  /// 轮廓线宽度,默认为:2
  external JSNumber strokeWeight;

  /// 是否显示描边,默认false
  external JSBoolean isOutline;

  /// 描边的宽度，默认为1
  external JSNumber borderWeight;

  /// 线条描边颜色，此项仅在isOutline为true时有效，默认：#00B2D5
  external JSString outlineColor;

  /// 设置多边形是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 设置polyline是否离地绘制，默认值为0，大于0时离地绘制，此时polyline高度等于height属性值加polyine起点绝对高程值。可以通过getPolylineHeight()获取当前折线高度值（此属性适用于 JSAPI v2.1及以上版本）。
  external JSNumber height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external JSObject? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed
  external JSString strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external JSArray<JSNumber>? strokeDasharray;

  /// 折线拐点的绘制样式，默认值为'miter'尖角，其他可选值：'round'圆角、'bevel'斜角
  external JSString lineJoin;

  /// 折线两端线帽的绘制样式，默认值为'butt'无头，其他可选值：'round'圆头、'square'方头
  external JSString lineCap;

  /// 是否绘制成大地线，默认false
  external JSBoolean geodesic;

  /// 是否延路径显示白色方向箭头,默认false。建议折线宽度大于6时使用
  external JSBoolean showDir;
}

/// 贝塞尔曲线
extension type BezierCurve._(JSObject _) implements Overlay {
  /// 构造函数
  external BezierCurve(BezierCurveOptions opts);

  /// 修改折线属性（包括路径的节点、线样式、是否绘制大地线等。属性详情参看 BezierCurveOptions 列表）
  external void setOptions(BezierCurveOptions optsArg);

  external void generateBuffer(JSAny gl);

  /// 获取贝塞尔曲线路径的节点数组
  external JSArray<JSArray<JSNumber>> getPath();

  /// 设置组成该折线的节点数组
  external void setPath(JSArray<JSArray<JSNumber>> path);

  /// 获取当前折线的矩形范围对象
  external Bounds? getBounds();

  /// 隐藏贝塞尔线
  external void hide();

  /// 显示贝塞尔曲线
  external void show();

  /// 设置贝塞尔曲线离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 获取当前贝塞尔曲线离地高度值 （此方法适用于 JSAPI 2.1Beta 及以上版本）
  external JSNumber getPolylineHeight();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 销毁内存-贝塞尔曲线
  external void destroy();

  /// 获取线的属性
  external BezierCurveOptions getOptions();

  /// 判断坐标是否在曲线内
  external JSBoolean contains(LngLat point);

  /// 获取曲线的总长度（单位：米）
  external JSNumber getLength();
}

extension type BezierCurveOptions._(JSObject _) implements JSObject {
  /// 构造函数
  BezierCurveOptions() : this._(JSObject());

  /// 贝瑟尔曲线的路径。描述为一个二维数组规则如下：第一个元素是起点， 之后的元素同时描述控制点和途经点，之后每个元素可以有0个到2个控制点 控制点在前，途经点在最后 [ [lng,lat] ,//起点0 [lng,lat,lng,lat,lng,lat] ,//控制点、控制点、途经点2 [lng,lat,lng,lat] //控制点、途经点3 ] 或者 [ [ [lng,lat] ],//起点0 [ [lng,lat] , [lng,lat] ],//控制点、途经点1 [ [lng,lat] , [lng,lat] , [lng,lat] ],//控制点、控制点、途经点2 [ [lng,lat] , [lng,lat] ]//控制点、途经点3 ]
  external JSArray<LngLat> path;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber strokeOpacity;

  /// 轮廓线宽度
  external JSNumber strokeWeight;

  /// 描边线宽度，默认为1
  external JSNumber borderWeight;

  /// 是否显示描边,默认false
  external JSBoolean isOutline;

  /// 线条描边颜色，此项仅在isOutline为true时有效，默认：#00B2D5
  external JSString outlineColor;

  /// 设置贝瑟尔曲线是否离地绘制，默认值为0；大于0时离地绘制，此时曲线高度等于height值加曲线起点高程值，可以通过getPolylineHeight获取当前折线高度值（此属性只适用于JSAPI v2.1Beta 及以上版本）。
  external JSNumber height;

  /// 设置多边形是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external JSObject? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external JSString strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external JSArray<JSNumber>? strokeDasharray;

  /// 折线拐点的绘制样式，默认值为'miter'尖角，其他可选值：'round'圆角、'bevel'斜角
  external JSString lineJoin;

  /// 折线两端线帽的绘制样式，默认值为'butt'无头，其他可选值：'round'圆头、'square'方头
  external JSString lineCap;

  /// 是否绘制成大地线，默认false
  external JSBoolean geodesic;

  /// 是否延路径显示白色方向箭头,默认false。建议折线宽度大于6时使用
  external JSBoolean showDir;
}

/// 构造圆形对象，通过CircleOptions指定多边形样式
extension type Circle._(JSObject _) implements Overlay {
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
  external JSNumber getRadius();

  /// 判断指定点坐标是否在圆内
  external JSBoolean contains(LngLat point);

  /// 修改圆属性（样式风格，包括组成圆形轮廓线的节点、轮廓线样式等。属性详情参看CircleOptions列表）
  external void setOptions(CircleOptions optsArg);

  /// 隐藏圆形
  external void hide();

  /// 设置圆平面离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  external JSNumber getPlaneHeight();

  /// 显示圆形
  external void show();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 销毁内存-圆形
  external void destroy();

  /// 获取面积,平米
  external JSNumber getArea();

  /// 获取圆形的属性
  external CircleOptions getOptions();
}

extension type CircleOptions._(JSObject _) implements JSObject {
  /// 构造函数
  CircleOptions() : this._(JSObject());

  /// 圆心位置
  external LngLat center;

  /// 圆半径，单位:米
  external JSNumber radius;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 轮廓线颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external JSNumber strokeOpacity;

  /// 轮廓线宽度，默认为2
  external JSNumber strokeWeight;

  /// 多边形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external JSString fillColor;

  /// 多边形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber fillOpacity;

  /// 设置多边形是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 设置圆是否离地绘制，默认值为0；大于0时离地绘制，此时圆平面高度等于height值加Circle质心点高程值，可以通过getPlaneHeight方法获取当前圆平面高度值（此属性只适用于JSAPI v2.1Beta及以上版本）。
  external JSNumber height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external JSObject? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external JSString strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external JSArray<JSNumber>? strokeDasharray;
}

/// 构造圆形对象，通过CircleOptions指定多边形样式
extension type CircleMarker._(JSObject _) implements Overlay {
  /// 构造函数
  external CircleMarker(CircleMarkerOptions opts);

  /// 判断指定点坐标是否在圆内
  external JSBoolean contains(LngLat point);

  /// 隐藏圆点
  external void hide();

  /// 设置圆点的半径
  external void setRadius(num radius);

  external void generateBuffer();

  /// 获取圆点中心
  external LngLat getCenter();

  /// 获取圆点的半径
  external JSNumber getRadius();

  /// 显示CircleMarker
  external void show();

  /// 修改圆点标记的属性（样式风格，包括轮廓线、填充色等。属性详情参看CircleMarkerOptions列表）
  external void setOptions(CircleMarkerOptions optsArg);

  /// 获取圆点的属性
  external CircleMarkerOptions getOptions();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 获取当前CircleMarker 的绝对高度
  external JSNumber getCurAltitude();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 销毁内存-CircleMarker
  external void destroy();
}

extension type CircleMarkerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  CircleMarkerOptions() : this._(JSObject());

  /// 圆心位置
  external LngLat center;

  /// 圆半径，单位:px 最大值64
  external JSNumber radius;

  /// 多边形覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 轮廓线颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external JSNumber strokeOpacity;

  /// 轮廓线宽度，默认为2
  external JSNumber strokeWeight;

  /// 多边形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external JSString fillColor;

  /// 多边形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber fillOpacity;

  /// 设置多边形是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external JSObject? extData;
}

/// 构造多边形对象，通过EllipseOptions指定多边形样式
@JS()
extension type Ellipse._(JSObject _) implements Overlay {
  /// 构造函数
  external Ellipse(EllipseOptions opts);

  /// 设置椭圆的中心点
  external void setCenter(LngLat center);

  /// 设置椭圆的半径
  external void setRadius(JSArray<JSNumber> radius);

  /// 设置椭圆离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 获取椭圆的圆心
  external LngLat getCenter();

  /// 获取椭圆的半径
  external JSNumber getRadius();

  external void generateBuffer(JSAny gl);

  /// 隐藏椭圆
  external void hide();

  /// 修改椭圆属性（样式风格，包括组成椭圆轮廓线的节点、轮廓线样式等。属性详情参看Ellipse
  external void setOptions(EllipseOptions optsArg);

  /// 获取当前平面高度值 （此方法适用于 JSAPI v2.1Beta 及以上版本）
  external JSNumber getPlaneHeight();

  /// 显示椭圆
  external void show();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 销毁内存-椭圆
  external void destroy();

  /// 获取面积,平米
  external JSNumber getArea();

  /// 判断指定点坐标是否在椭圆内
  external void contains(LngLat point);

  /// 获取椭圆的属性
  external EllipseOptions getOptions();
}

extension type EllipseOptions._(JSObject _) implements JSObject {
  /// 构造函数
  EllipseOptions() : this._(JSObject());

  /// 椭圆圆心
  external LngLat center;

  /// 椭圆的半径，用2个元素的数组表示，单位：米 如： radius: [1000, 2000] 表示横向半径是1000，纵向的半径是2000 默认值： [1000, 1000]
  external JSArray<JSNumber> radius;

  /// 椭圆覆盖物的叠加顺序。地图上存在多个多边形覆盖物叠加时，通过该属性使级别较高的多边形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上，默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external JSNumber strokeOpacity;

  /// 轮廓线宽度，默认为2
  external JSNumber strokeWeight;

  /// 椭圆填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external JSString fillColor;

  /// 椭圆填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber fillOpacity;

  /// 设置椭圆是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 设置椭圆是否离地绘制，默认值为0.0；大于0时离地绘制，此时椭圆平面高度等于height值加Ellipse质心点高程值，可以通过getPlaneHeight方法获取当前椭圆平面高度值（此属性适用于v2.1JSAPI 及以上版本）。
  external JSNumber height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如 id 等
  external JSObject? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external JSString strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external JSArray<JSNumber>? strokeDasharray;
}

/// 构造矩形对象，通过RectangleOptions指定多边形样式
@JS()
extension type Rectangle._(JSObject _) implements Overlay {
  /// 构造函数
  external Rectangle(RectangleOptions opts);

  /// 判断坐标是否在矩形上
  external JSBoolean contains(LngLat point);

  /// 设置矩形的范围
  external void setBounds(Bounds bounds);

  external void generateBuffer(JSAny gl);

  /// 修改矩形属性（样式风格，包括组成矩形轮廓线的节点、轮廓线样式等。属性详情参看RectangleOptions列表）
  external void setOptions(RectangleOptions optsArg);

  /// 获取当前矩形平面高度值 （此方法适用于 JSAPI 2.1Beta 及以上版本）
  external JSNumber getPlaneHeight();

  /// 隐藏矩形
  external void hide();

  /// 设置矩形离地高度 （此方法和相关属性 height 适用于 JSAPI v2.1Beta 及以上版本）
  external void setHeight(num height);

  /// 获取矩形的中心点
  external LngLat getCenter();

  /// 显示矩形
  external void show();

  /// 获取用户自定义属性
  external JSObject getExtData();

  /// 设置用户自定义属性，支持JavaScript API任意数据类型
  external void setExtData(JSObject extData);

  /// 销毁内存-矩形
  external void destroy();

  /// 获取面积,平米
  external JSNumber getArea();

  /// 获取矩形的属性
  external RectangleOptions getOptions();
}

extension type RectangleOptions._(JSObject _) implements JSObject {
  /// 构造函数
  RectangleOptions() : this._(JSObject());

  /// 要显示该覆盖物的地图对象
  external AMap map;

  /// 矩形的范围
  external Bounds bounds;

  /// 矩形覆盖物的叠加顺序。地图上存在多个矩形覆盖物叠加时，通过该属性使级别较高的矩形覆盖物在上层显示，默认为10
  external JSNumber zIndex;

  /// 是否将覆盖物的鼠标或touch等事件冒泡到地图上（自v1.3 新增），默认为false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString? cursor;

  /// 线条颜色，使用16进制颜色代码赋值。默认值为#00D3FC
  external JSString strokeColor;

  /// 轮廓线透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.9
  external JSNumber strokeOpacity;

  /// 轮廓线宽度，默认为2
  external JSNumber strokeWeight;

  /// 矩形填充颜色，使用16进制颜色代码赋值，如：#00B2D5
  external JSString fillColor;

  /// 矩形填充透明度，取值范围 [0,1] ，0表示完全透明，1表示不透明。默认为0.5
  external JSNumber fillOpacity;

  /// 设置矩形是否可拖拽移动，默认为false
  external JSBoolean draggable;

  /// 设置矩形平面是否离地绘制，默认值为0；大于0时离地绘制，此时矩形平面高度等于height值加Rectangle质心点高程值，可以通过getPlaneHeight方法获取当前平面高度值。（此属性适用于 JSAPI 2.1Beta 及以上版本）
  external JSNumber height;

  /// 用户自定义属性，支持JavaScript API任意数据类型，如Polygon的id等
  external JSObject? extData;

  /// 轮廓线样式，实线:solid，虚线:dashed，默认为solid
  external JSString strokeStyle;

  /// 勾勒形状轮廓的虚线和间隙的样式，此属性在strokeStyle 为dashed 时有效， 此属性在ie9+浏览器有效 取值： 实线： [0,0,0] 虚线： [10,10] ， [10,10] 表示10个像素的实线和10个像素的空白（如此反复）组成的虚线 点画线： [10,2,10] ， [10,2,10] 表示10个像素的实线和2个像素的空白 + 10个像素的实线和10个像素的空白 （如此反复）组成的虚线
  external JSArray<JSNumber>? strokeDasharray;
}

/// GeoJSON类，继承自OverLayGroup，可实现GeoJSON对象与OverlayGroup的相互转换
@JS()
extension type GeoJSON._(JSObject _) implements OverlayGroup {
  external GeoJSON(GeoJSONOptions opts);

  /// 加载新的GeoJSON对象，转化为覆盖物，旧的覆盖物将移除
  external void importData(JSAny geoJSON);

  /// 将当前对象包含的覆盖物转换为GeoJSON对象
  external JSObject toGeoJSON();
}

extension type GeoJSONOptions._(JSObject _) implements JSObject {
  /// 构造函数
  GeoJSONOptions() : this._(JSObject());

  /// 要加载的标准GeoJSON对象
  external JSObject geoJSON;

  /// 指定点要素的绘制方式，缺省时为Marker的默认样式。geojson为当前要素对应的GeoJSON对象，lnglats为对应的线的路径
  external GeoJsonHandler getMarker;

  /// 指定线要素的绘制方式，缺省时为Polyline的默认样式。geojson为当前要素对应的GeoJSON对象，lnglats为对应的线的路径
  external GeoJsonHandler getPolyline;

  /// 指定面要素的绘制方式，缺省时为Polygon的默认样式。geojson为当前要素对应的GeoJSON对象，lnglats为对应的线的路径
  external GeoJsonHandler getPolygon;
}

/// 绘制方式函数扩展类型
extension type GeoJsonHandler(JSFunction _) implements JSFunction {
  external void call(JSObject geojson, LngLat lnglat);
}
