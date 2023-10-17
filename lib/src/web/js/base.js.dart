@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

/// 经纬度坐标
@JS()
class LngLat {
  /// 构造函数
  /// lng：经度值
  /// lat：纬度值
  /// noWrap：是否自动将经度值修正到 [-180,180] 区间内，缺省时为false。
  external LngLat(num? lng, num? lat, [bool? noWrap]);

  /// 纬度
  external num get lat;

  /// 经度
  external num get lng;

  /// 设置经度值
  external setLng(num lng);

  /// 设置纬度值
  external setLat(num lat);

  /// 获取经度值
  external num getLng();

  /// 获取纬度值
  external num getLat();

  /// 判断经纬度坐标和另外一个经纬度坐标是否相等
  external bool equals(LngLat another);

  /// 与另外一个经纬度相加
  /// noWrap: 是否将相加的结果经度值修正到 [-180,180] 区间内
  external LngLat add(LngLat another, bool noWrap);

  /// 与另外一个经纬度相减
  /// noWrap: 是否将相减的结果经度值修正到 [-180,180] 区间内
  external LngLat subtract(LngLat another, bool noWrap);

  /// 获取从当前经纬度位置向东移动 E 米，向北移动 N 米的坐标位置
  external LngLat offset(num E, num N);

  /// LngLat对象以字符串的形式返回，格式如'lng值,lat值'的字符串
  @override
  external String toString();

  /// LngLat对象以字符串的形式返回，格式如'lng值,lat值'的字符串
  external String toArray();

  /// 计算当前经纬度距离另一个经纬度或者经纬度数组组成的路径的距离，单位为米
  external num distance();
}

/// 地物对象的经纬度矩形范围
@JS()
class Bounds {
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
  external bool contains(LngLat obj);

  /// 获取当前Bounds的中心点经纬度坐标
  external LngLat getCenter();

  /// 以字符串形式返回地图对象的矩形范围
  @override
  external String toString();
}

/// 像素坐标，确定地图上的一个像素点
@JS()
class Pixel {
  /// 构造函数
  external Pixel(num x, num y);

  /// 获取像素横坐标
  external num getX();

  /// 获取像素纵坐标
  external num getY();

  /// 以字符串形式返回像素坐标对象
  @override
  external String toString();

  /// 当前像素坐标与传入像素坐标是否相等
  external bool equals(Pixel point);
}

/// 地物对象的像素尺寸
@JS()
class Size {
  /// 构造函数: 宽度、高度
  external Size(num width, num height);

  /// 获取像素横坐标
  external num getWidth();

  /// 获取像素纵坐标
  external num getHeight();

  /// 以字符串形式返回尺寸大小对象
  @override
  external String toString();
}
