@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'package:web/web.dart' show HTMLElement;
import 'js.dart';

/// GeometryUtil为一组空间数据计算的函数库，v1.4.2新增。支持点线面的空间关系计算、长度、面积计算等等，
extension type GeometryUtil._(JSObject _) implements JSObject {
  /// 构造函数
  external GeometryUtil();

  /// 计算两个经纬度点之间的实际距离。单位：米
  external JSNumber distance(LngLat p1, LngLat p2);

  /// 计算一个经纬度路径围成区域的实际面积。单位：平米
  external JSNumber ringArea(JSArray<LngLat> ring);

  /// 计算一个带有绝对海拔的经纬度高度路径围成区域的实际面积。单位：平米
  external JSNumber ringAreaByAltitude(JSNumber averageAltitude);

  /// 判断一个经纬度路径是否为顺时针
  external JSBoolean isClockwise(JSArray<LngLat> ring);

  /// 判断一个经纬度路径面类型
  external JSBoolean typePolygon(JSArray<LngLat> ring);

  /// 将一个路径变为顺时针
  external JSArray<LngLat> makesureClockwise(JSArray<LngLat> ring);

  /// 将一个路径变为逆时针
  external JSArray<LngLat> makesureAntiClockwise(JSArray<LngLat> ring);

  /// 计算一个经纬度路径的实际长度。单位：米
  external JSNumber distanceOfLine(JSArray<LngLat> ring);

  /// 计算一个经纬度带绝对海报高度路径的实际长度。单位：米
  external JSNumber distanceOfLineByAltitude(JSArray<LngLat> ring);

  /// 计算一个经纬度带绝对海报高度两点空间距离的实际长度。单位：米
  external JSNumber distanceLineByAltitude(
      JSArray<JSNumber> pt1, JSArray<JSNumber> pt2);

  /// 计算两个经纬度面的交叉区域。只适用于凸多边形
  external JSNumber ringRingClip(JSArray<LngLat> ring1, JSArray<LngLat> ring2);

  /// 判断两个线段是否相交
  external JSBoolean doesSegmentsIntersect(
    LngLat p1,
    LngLat p2,
    LngLat p3,
    LngLat p4,
  );

  /// 判断线段和一个路径是否相交
  external JSBoolean doesSegmentLineIntersect(
    LngLat p1,
    LngLat p2,
    JSArray<LngLat> line,
  );

  /// 判断线段和一个环是否相交
  external JSBoolean doesSegmentRingIntersect(
    LngLat p1,
    LngLat p2,
    JSArray<LngLat> ring,
  );

  /// 判断线段和多个环是否相交
  external JSBoolean doesSegmentPolygonIntersect(LngLat p1, LngLat p2);

  /// 判断两个经纬度路径是否相交
  external JSBoolean doesLineLineIntersect(
      JSArray<LngLat> line1, JSArray<LngLat> line2);

  /// 判断经纬度路径和经纬度面是否交叉
  external JSBoolean doesLineRingIntersect(
      JSArray<LngLat> line, JSArray<LngLat> ring);

  /// 判断两个经纬度面是否交叉
  external JSBoolean doesRingRingIntersect(
      JSArray<LngLat> ring1, JSArray<LngLat> ring2);

  /// 判断点是否在环内，支持任意坐标系
  external JSBoolean pointInRing(LngLat p, JSArray<LngLat> ring);

  /// 判断点是否在环内
  external JSBoolean isPointInRing(LngLat p, JSArray<LngLat> ring);

  /// 判断点是否在环内
  external JSBoolean isPointInBbox(LngLat p, JSArray<LngLat> bbox);

  /// 判断环是否在另一个环内
  external JSBoolean isRingInRing(JSArray<LngLat> ring1, JSArray<LngLat> ring2);

  /// 判断点是否在多个环组成区域内
  external JSBoolean isPointInPolygon(LngLat p, JSArray<LngLat> rings);

  /// 判断点是否在带洞多多边型内
  external JSBoolean isPointInPolygons(LngLat p, JSArray<LngLat> polygons);

  /// 判断P1是否在P2P3上，tolerance为误差范围
  external JSBoolean isPointOnSegment(
    LngLat p1,
    LngLat p2,
    LngLat p3,
    JSNumber tolerance,
  );

  /// 判断P是否在line上，tolerance为误差范围
  external JSBoolean isPointOnLine(
      LngLat p, JSArray<LngLat> line, JSNumber tolerance);

  /// 判断P是否在ring的边上，tolerance为误差范围
  external JSBoolean isPointOnRing(
      LngLat p, JSArray<LngLat> ring, JSNumber tolerance);

  /// 判断P是否在多个ring的边上，tolerance为误差范围
  external JSBoolean isPointOnPolygon(LngLat p, JSNumber tolerance);

  /// 计算P2P3上距离P1最近的点
  external JSBoolean closestOnSegment(LngLat p1, LngLat p2, LngLat p3);

  /// 计算line上距离P最近的点
  external JSBoolean closestOnLine(LngLat p, JSArray<LngLat> line);

  /// 计算P2P3到P1的距离。单位：米
  external LngLat distanceToSegment(LngLat p1, LngLat p2, LngLat p3);

  /// 计算P到line的距离。单位：米
  external JSNumber distanceToLine(LngLat p, JSArray<LngLat> line);
}

extension type DomUtil._(JSObject _) implements JSObject {
  /// 构造函数
  external DomUtil();

  /// 获取DOM元素的大小
  external Size getViewport(HTMLElement obj);

  /// 获取DOM元素距离窗口左上角的距离
  external Pixel getViewportOffset(HTMLElement element);

  /// 在parentNode内部创建一个className类名的tagName元素
  external HTMLElement create(
    String tagName,
    HTMLElement container,
    String className,
    String position,
  );

  /// DOM元素是否包含className
  external JSBoolean hasClass(HTMLElement el, String name);

  /// 给DOM元素添加一个className
  external void addClass(HTMLElement el, String name);

  /// 给DOM元素设置为className样式
  external void setClass(HTMLElement el, String name);

  /// 给DOM元素删除一个className
  external void removeClass(HTMLElement el, String name);

  /// 将DOM元素从父节点删除
  external void remove(HTMLElement el);

  /// 清空DOM元素
  external void empty(HTMLElement el);

  /// 给DOM元素旋转一个角度，以center为中心，center以元素左上角为坐标原点
  external void rotate(HTMLElement target, JSNumber angle, Pixel center);

  ///给DOM元素删除一组样式，Object同样式表
  external void setCss(HTMLElement obj, JSObject css);

  /// 给DOM元素设定一个透明度
  external void setOpacity(HTMLElement el, JSNumber value);
}

extension type Browser._(JSObject _) implements JSObject {
  /// 构造函数
  external Browser();

  /// 当前浏览器userAgent
  external JSString get us;

  /// 是否移动设备
  external JSBoolean get mobile;

  /// 平台类型，如：'windows'、'mac'、'ios'、'android'、'other'
  external JSString get plat;

  /// 是否windows设备
  external JSBoolean get windows;

  /// 是否iOS设备
  external JSBoolean get ios;

  /// 是否iPad
  external JSBoolean get iPad;

  /// 是否iPhone
  @JS("Phone")
  external JSBoolean get iPhone;

  /// 是否安卓设备
  external JSBoolean get android;

  /// 是否安卓4以下系统
  external JSBoolean get android23;

  /// 是否Chrome浏览器
  external JSBoolean get chrome;

  /// 是否火狐浏览器
  external JSBoolean get firefox;

  /// 是否Safari浏览器
  external JSBoolean get safari;

  /// 是否微信
  external JSBoolean get wechat;

  /// 是否UC浏览器
  external JSBoolean get uc;

  /// 是否QQ或者QQ浏览器
  external JSBoolean get qq;

  /// 是否IE
  external JSBoolean get ie;

  /// 是否IE6
  external JSBoolean get ie6;

  /// 是否IE7
  external JSBoolean get ie7;

  /// 是否IE8
  external JSBoolean get ie8;

  /// 是否IE9
  external JSBoolean get ie9;

  /// 是否IE10
  external JSBoolean get ie10;

  /// 是否IE11
  external JSBoolean get ie11;

  ///是否IE9以下
  external JSBoolean get ielt9;

  /// 是否Edge浏览器
  external JSBoolean get edge;

  /// 是否支持LocaStorage
  external JSBoolean get isLocalStorage;

  /// 是否支持Geolocation
  external JSBoolean get isGeolocation;

  /// 是否Webkit移动浏览器
  external JSBoolean get mobileWebkit;

  /// 是否支持Css3D的Webkit移动端浏览器
  external JSBoolean get mobileWebkit3d;

  /// 是否高清屏幕，devicePixelRatio>1
  external JSBoolean get retina;

  /// 是否触屏
  external JSBoolean get touch;

  /// 是否msPointer设备
  external JSBoolean get msPointer;

  /// 是否pointer设备
  external JSBoolean get pointer;

  /// 是否webkit浏览器
  external JSBoolean get webkit;

  /// 是否支持Css3D的Webkit浏览器
  external JSBoolean get webkit3d;

  /// 是否支持Css3D的gecko浏览器
  external JSBoolean get gecko3d;

  /// 是否支持Css3D的ie浏览器
  external JSBoolean get ie3d;

  /// 是否支持Css3D的浏览器
  external JSBoolean get any3d;

  /// 是否支持Css3D的opera浏览器
  external JSBoolean get opera3d;

  /// 是否支持canvas
  external JSBoolean get isCanvas;

  /// 是否支持svg
  external JSBoolean get isSvg;

  /// 是否支持vml
  external JSBoolean get isVML;

  /// 是否支持WebWorker
  external JSBoolean get isWorker;

  /// 是否支持WebSocket
  external JSBoolean get isWebsocket;

  /// 是否支持webgl
  external JSBoolean get isWebGL;
}

extension type Util._(JSObject _) implements JSObject {
  /// 构造函数
  external Util();

  /// 判断参数是否为DOM元素
  external JSBoolean isDOM(JSObject obj);

  external JSString colorNameToHex(String colorName);

  /// 将16进制RGB转为rgba(R,G,B,A)
  external JSString rgbHex2Rgba(String hex);

  /// 将16进制RGBA转为rgba(R,G,B,A)
  external JSString argbHex2Rgba(String hex);

  /// 判断一个对象是否为空
  external JSBoolean isEmpty(JSObject obj);

  /// 从数组删除元素
  external void deleteItemFromArray(JSObject array, JSObject item);

  /// 按索引删除数组元素
  external void deleteItemFromArrayByIndex(JSObject array, JSNumber index);

  /// 返回元素索引
  external JSNumber indexOf(JSObject array, JSObject item);

  /// 保留小数点后digits位
  external JSNumber format(JSNumber num, JSNumber digits);

  /// 判断是否数组
  external JSBoolean isArray(JSObject obj);

  /// 判断数组是否包含某个元素
  external JSBoolean includes(JSArray<JSObject> array, JSObject item);

  /// 同原生requestIdleCallback
  external JSNumber requestIdleCallback(JSExportedDartFunction func);

  /// 同原生 cancelIdleCallback
  external void cancelIdleCallback(JSNumber id);

  /// 同原生 Util.requestAnimFrame
  external JSNumber requestAnimFrame(JSExportedDartFunction func);

  /// 同原生 Util.cancelAnimFrame
  external void cancelAnimFrame(JSNumber id);
}
