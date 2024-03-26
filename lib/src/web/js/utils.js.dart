@JS("AMap")
library amap_flutter;

import 'dart:html';

import 'package:js/js.dart';

import 'js.dart';

/// GeometryUtil为一组空间数据计算的函数库，v1.4.2新增。支持点线面的空间关系计算、长度、面积计算等等，
@JS()
class GeometryUtil {
  external GeometryUtil();

  /// 计算两个经纬度点之间的实际距离。单位：米
  external num distance(LngLat p1, LngLat p2);

  /// 计算一个经纬度路径围成区域的实际面积。单位：平米
  external num ringArea(List<LngLat> ring);

  /// 计算一个带有绝对海拔的经纬度高度路径围成区域的实际面积。单位：平米
  external num ringAreaByAltitude(num averageAltitude);

  /// 判断一个经纬度路径是否为顺时针
  external bool isClockwise(List<LngLat> ring);

  /// 判断一个经纬度路径面类型
  external bool typePolygon(List<LngLat> ring);

  /// 将一个路径变为顺时针
  external List<LngLat> makesureClockwise(List<LngLat> ring);

  /// 将一个路径变为逆时针
  external List<LngLat> makesureAntiClockwise(List<LngLat> ring);

  /// 计算一个经纬度路径的实际长度。单位：米
  external num distanceOfLine(List<LngLat> ring);

  /// 计算一个经纬度带绝对海报高度路径的实际长度。单位：米
  external num distanceOfLineByAltitude(List<LngLat> ring);

  /// 计算一个经纬度带绝对海报高度两点空间距离的实际长度。单位：米
  external num distanceLineByAltitude(List<num> pt1, List<num> pt2);

  /// 计算两个经纬度面的交叉区域。只适用于凸多边形
  external ringRingClip(List<LngLat> ring1, List<LngLat> ring2);

  /// 判断两个线段是否相交
  external bool doesSegmentsIntersect(
    LngLat p1,
    LngLat p2,
    LngLat p3,
    LngLat p4,
  );

  /// 判断线段和一个路径是否相交
  external bool doesSegmentLineIntersect(
    LngLat p1,
    LngLat p2,
    List<LngLat> line,
  );

  /// 判断线段和一个环是否相交
  external bool doesSegmentRingIntersect(
    LngLat p1,
    LngLat p2,
    List<LngLat> ring,
  );

  /// 判断线段和多个环是否相交
  external bool doesSegmentPolygonIntersect(LngLat p1, LngLat p2);

  /// 判断两个经纬度路径是否相交
  external bool doesLineLineIntersect(List<LngLat> line1, List<LngLat> line2);

  /// 判断经纬度路径和经纬度面是否交叉
  external bool doesLineRingIntersect(List<LngLat> line, List<LngLat> ring);

  /// 判断两个经纬度面是否交叉
  external bool doesRingRingIntersect(List<LngLat> ring1, List<LngLat> ring2);

  /// 判断点是否在环内，支持任意坐标系
  external bool pointInRing(LngLat p, List<LngLat> ring);

  /// 判断点是否在环内
  external bool isPointInRing(LngLat p, List<LngLat> ring);

  /// 判断点是否在环内
  external bool isPointInBbox(LngLat p, List<LngLat> bbox);

  /// 判断环是否在另一个环内
  external bool isRingInRing(List<LngLat> ring1, List<LngLat> ring2);

  /// 判断点是否在多个环组成区域内
  external bool isPointInPolygon(LngLat p, List<LngLat> rings);

  /// 判断点是否在带洞多多边型内
  external bool isPointInPolygons(LngLat p, List<LngLat> polygons);

  /// 判断P1是否在P2P3上，tolerance为误差范围
  external bool isPointOnSegment(
    LngLat p1,
    LngLat p2,
    LngLat p3,
    num tolerance,
  );

  /// 判断P是否在line上，tolerance为误差范围
  external bool isPointOnLine(LngLat p, List<LngLat> line, num tolerance);

  /// 判断P是否在ring的边上，tolerance为误差范围
  external bool isPointOnRing(LngLat p, List<LngLat> ring, num tolerance);

  /// 判断P是否在多个ring的边上，tolerance为误差范围
  external bool isPointOnPolygon(LngLat p, num tolerance);

  /// 计算P2P3上距离P1最近的点
  external bool closestOnSegment(LngLat p1, LngLat p2, LngLat p3);

  /// 计算line上距离P最近的点
  external bool closestOnLine(LngLat p, List<LngLat> line);

  /// 计算P2P3到P1的距离。单位：米
  external LngLat distanceToSegment(LngLat p1, LngLat p2, LngLat p3);

  /// 计算P到line的距离。单位：米
  external num distanceToLine(LngLat p, List<LngLat> line);
}

@JS()
class DomUtil {
  external DomUtil();

  /// 获取DOM元素的大小
  external Size getViewport(HtmlElement obj);

  /// 获取DOM元素距离窗口左上角的距离
  external Pixel getViewportOffset(HtmlElement element);

  /// 在parentNode内部创建一个className类名的tagName元素
  external HtmlElement create(
    String tagName,
    HtmlElement container,
    String className,
    String position,
  );

  /// DOM元素是否包含className
  external bool hasClass(HtmlElement el, String name);

  /// 给DOM元素添加一个className
  external void addClass(HtmlElement el, String name);

  /// 给DOM元素设置为className样式
  external void setClass(HtmlElement el, String name);

  /// 给DOM元素删除一个className
  external void removeClass(HtmlElement el, String name);

  /// 将DOM元素从父节点删除
  external void remove(HtmlElement el);

  /// 清空DOM元素
  external void empty(HtmlElement el);

  /// 给DOM元素旋转一个角度，以center为中心，center以元素左上角为坐标原点
  external void rotate(HtmlElement target, num angle, Pixel center);

  ///给DOM元素删除一组样式，Object同样式表
  external void setCss(HtmlElement obj, Object css);

  /// 给DOM元素设定一个透明度
  external void setOpacity(HtmlElement el, num value);
}

@JS()
class Browser {
  external Browser();

  /// 当前浏览器userAgent
  external String us;

  /// 是否移动设备
  external bool mobile;

  /// 平台类型，如：'windows'、'mac'、'ios'、'android'、'other'
  external String plat;

  /// 是否windows设备
  external bool windows;

  /// 是否iOS设备
  external bool ios;

  /// 是否iPad
  external bool iPad;

  /// 是否iPhone
  @JS("Phone")
  external bool iPhone;

  /// 是否安卓设备
  external bool android;

  /// 是否安卓4以下系统
  external bool android23;

  /// 是否Chrome浏览器
  external bool chrome;

  /// 是否火狐浏览器
  external bool firefox;

  /// 是否Safari浏览器
  external bool safari;

  /// 是否微信
  external bool wechat;

  /// 是否UC浏览器
  external bool uc;

  /// 是否QQ或者QQ浏览器
  external bool qq;

  /// 是否IE
  external bool ie;

  /// 是否IE6
  external bool ie6;

  /// 是否IE7
  external bool ie7;

  /// 是否IE8
  external bool ie8;

  /// 是否IE9
  external bool ie9;

  /// 是否IE10
  external bool ie10;

  /// 是否IE11
  external bool ie11;

  ///是否IE9以下
  external bool ielt9;

  /// 是否Edge浏览器
  external bool edge;

  /// 是否支持LocaStorage
  external bool isLocalStorage;

  /// 是否支持Geolocation
  external bool isGeolocation;

  /// 是否Webkit移动浏览器
  external bool mobileWebkit;

  /// 是否支持Css3D的Webkit移动端浏览器
  external bool mobileWebkit3d;

  /// 是否高清屏幕，devicePixelRatio>1
  external bool retina;

  /// 是否触屏
  external bool touch;

  /// 是否msPointer设备
  external bool msPointer;

  /// 是否pointer设备
  external bool pointer;

  /// 是否webkit浏览器
  external bool webkit;

  /// 是否支持Css3D的Webkit浏览器
  external bool webkit3d;

  /// 是否支持Css3D的gecko浏览器
  external bool gecko3d;

  /// 是否支持Css3D的ie浏览器
  external bool ie3d;

  /// 是否支持Css3D的浏览器
  external bool any3d;

  /// 是否支持Css3D的opera浏览器
  external bool opera3d;

  /// 是否支持canvas
  external bool isCanvas;

  /// 是否支持svg
  external bool isSvg;

  /// 是否支持vml
  external bool isVML;

  /// 是否支持WebWorker
  external bool isWorker;

  /// 是否支持WebSocket
  external bool isWebsocket;

  /// 是否支持webgl
  external bool isWebGL;
}

@JS()
class Util {
  external Util();

  /// 判断参数是否为DOM元素
  external bool isDOM(dynamic obj);

  external String colorNameToHex(String colorName);

  /// 将16进制RGB转为rgba(R,G,B,A)
  external String rgbHex2Rgba(String hex);

  /// 将16进制RGBA转为rgba(R,G,B,A)
  external String argbHex2Rgba(String hex);

  /// 判断一个对象是否为空
  external bool isEmpty(dynamic obj);

  /// 从数组删除元素
  external void deleteItemFromArray(dynamic array, dynamic item);

  /// 按索引删除数组元素
  external void deleteItemFromArrayByIndex(dynamic array, num index);

  /// 返回元素索引
  external num indexOf(dynamic array, dynamic item);

  /// 保留小数点后digits位
  external num format(num num, num digits);

  /// 判断是否数组
  external bool isArray(dynamic obj);

  /// 判断数组是否包含某个元素
  external bool includes(List<dynamic> array, dynamic item);

  /// 同原生requestIdleCallback
  external num requestIdleCallback(Function func);

  /// 同原生 cancelIdleCallback
  external void cancelIdleCallback(num id);

  /// 同原生 Util.requestAnimFrame
  external num requestAnimFrame(Function func);

  /// 同原生 Util.cancelAnimFrame
  external void cancelAnimFrame(num id);
}
