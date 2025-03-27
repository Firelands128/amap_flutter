@JS("AMap")
library amap_flutter;

import 'dart:js_interop';

/// 经纬度坐标
extension type LngLat._(JSObject _) implements JSObject {
  /// 构造函数
  /// lng：经度值
  /// lat：纬度值
  /// noWrap：是否自动将经度值修正到 [-180,180] 区间内，缺省时为false。
  external LngLat(num? lng, num? lat, [JSBoolean? noWrap]);

  /// 纬度
  external JSNumber get lat;

  /// 经度
  external JSNumber get lng;

  /// 设置经度值
  external void setLng(JSNumber lng);

  /// 设置纬度值
  external void setLat(JSNumber lat);

  /// 获取经度值
  external JSNumber getLng();

  /// 获取纬度值
  external JSNumber getLat();

  /// 判断经纬度坐标和另外一个经纬度坐标是否相等
  external JSBoolean equals(LngLat another);

  /// 与另外一个经纬度相加
  /// noWrap: 是否将相加的结果经度值修正到 [-180,180] 区间内
  external LngLat add(LngLat another, JSBoolean noWrap);

  /// 与另外一个经纬度相减
  /// noWrap: 是否将相减的结果经度值修正到 [-180,180] 区间内
  external LngLat subtract(LngLat another, JSBoolean noWrap);

  /// 获取从当前经纬度位置向东移动 E 米，向北移动 N 米的坐标位置
  external LngLat offset(num E, num N);

  /// LngLat对象以字符串的形式返回，格式如'lng值,lat值'的字符串
  // @override
  // external JSString toString();

  /// LngLat对象以字符串的形式返回，格式如'lng值,lat值'的字符串
  external JSString toArray();

  /// 计算当前经纬度距离另一个经纬度或者经纬度数组组成的路径的距离，单位为米
  external JSNumber distance();
}

/// 地物对象的经纬度矩形范围
extension type Bounds._(JSObject _) implements JSObject {
  /// 构造函数
  /// southWest：西南角经纬度
  /// northEast：东北角经纬度值
  external Bounds(LngLat southWest, LngLat northEast);

  /// 获取西南角坐标
  external LngLat getSouthWest();

  /// 获取东北角坐标
  external LngLat getNorthEast();

  /// 获取西北角坐标
  external LngLat getNorthWest();

  /// 获取东南角坐标
  external LngLat getSouthEast();

  /// 指定点坐标是否在矩形范围内
  external JSBoolean contains(LngLat obj);

  /// 获取当前Bounds的中心点经纬度坐标
  external LngLat getCenter();

  /// 以字符串形式返回地图对象的矩形范围
  // @override
  // external JSString toString();
}

/// 像素坐标，确定地图上的一个像素点
extension type Pixel._(JSObject _) implements JSObject {
  /// 构造函数
  external Pixel(num x, num y);

  /// 获取像素横坐标
  external JSNumber getX();

  /// 获取像素纵坐标
  external JSNumber getY();

  /// 以字符串形式返回像素坐标对象
  // @override
  // external JSString toString();

  /// 当前像素坐标与传入像素坐标是否相等
  external JSBoolean equals(Pixel point);
}

/// 地物对象的像素尺寸
extension type Size._(JSObject _) implements JSObject {
  /// 构造函数: 宽度、高度
  external Size(num width, num height);

  /// 获取像素横坐标
  external JSNumber getWidth();

  /// 获取像素纵坐标
  external JSNumber getHeight();

  /// 以字符串形式返回尺寸大小对象
  // @override
  // external JSString toString();
}
