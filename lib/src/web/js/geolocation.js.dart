@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// 定位服务插件。
/// 融合了浏览器定位、高精度IP定位、安卓定位sdk辅助定位等多种手段，提供了获取当前准确位置、获取当前城市信息、持续定位(浏览器定位)等功能。
/// 用户可以通过两种当时获得定位的成败和结果，一种是在 getCurrentPosition的时候传入回调函数来处理定位结果，一种是通过事件监听来取得定位结果。
extension type Geolocation._(JSObject _) implements Control {
  /// 构造函数
  external Geolocation(GeolocationOptions options);

  /// 获取用户的精确位置，有失败几率
  external void getCurrentPosition(GeolocationCallBack callback);

  /// 根据用户 IP 获取 用户所在城市信息
  external void getCityInfo(GeolocationCallBack callback);
}

extension type GeolocationOptions._(JSObject _) implements JSObject {
  /// 构造函数
  GeolocationOptions(): this._(JSObject());

  /// 悬停位置，默认为"RB"，即右下角
  external JSString position;

  /// 缩略图距离悬停位置的像素距离，如 [2,2]
  external Pixel offset;

  /// 按钮边框颜色值，同CSS，如'silver'
  external JSString borderColor;

  /// 按钮圆角边框值，同CSS，如'5px'
  external JSString borderRadius;

  /// 箭头按钮的像素尺寸，同CSS，如'12px'
  external JSString buttonSize;

  /// 是否将定位结果转换为高德坐标
  external JSBoolean convert;

  /// 进行浏览器原生定位的时候是否尝试获取较高精度，可能影响定位效率，默认为false
  external JSBoolean enableHighAccuracy;

  /// 定位的超时时间，毫秒
  external JSNumber timeout;

  /// 浏览器原生定位的缓存时间，毫秒
  external JSNumber maximumAge;

  /// 是否显示定位按钮，默认为true
  external JSBoolean showButton;

  /// 是否显示定位精度圆，默认为true
  external JSBoolean showCircle;

  /// 是否显示定位点，默认为true
  external JSBoolean showMarker;

  /// 定位点的样式
  external MarkerOptions markerOptions;

  /// 定位圆的样式
  external CircleOptions circleOptions;

  /// 定位成功后是否自动移动到响应位置
  external JSBoolean panToLocation;

  /// 定位成功后是否自动调整级别
  external JSBoolean zoomToAccuracy;

  /// 优先使用H5定位，默认移动端为true，PC端为false
  @JS("GeoLocationFirst")
  external JSBoolean geoLocationFirst;

  /// 是否禁用IP精确定位，默认为0，0:都用 1:手机上不用 2:PC上不用 3:都不用
  external JSNumber noIpLocate;

  /// 是否禁用浏览器原生定位，默认为0，0:都用 1:手机上不用 2:PC上不用 3:都不用
  external JSNumber noGeoLocation;

  /// 是否与高德定位SDK能力结合，需要同时使用安卓版高德定位sdk，否则无效
  external JSBoolean useNative;

  /// 定位失败之后是否返回基本城市定位信息
  external JSBoolean getCityWhenFail;

  /// 是否需要将定位结果进行逆地理编码操作
  external JSBoolean needAddress;

  /// 是否需要详细的逆地理编码信息，默认为'base'只返回基本信息，可选'all'
  external JSString extensions;
}

/// 定位服务回调函数扩展类型
extension type GeolocationCallBack(JSFunction _) implements JSFunction {
  external void call(String status, GeolocationResult result);
}

/// 浏览器定位的定位结果，定位的过程和失败信息可以从 message 字段中获取
extension type GeolocationResult._(JSObject _) implements JSObject {
  /// 构造函数
  GeolocationResult() : this._(JSObject());

  /// 定位到的经纬度位置
  external LngLat position;

  /// 定位精度，米
  external JSNumber accuracy;

  /// 定位的类型，ip/h5/sdk/ipcity
  @JS("location_type")
  external JSNumber locationType;

  /// 定位过程的信息，用于排查定位失败原因
  external JSNumber message;

  /// 是否已经转换为高德坐标
  external JSNumber isConverted;

  /// 'SUCCESS' 或者 'PERMISSION_DENIED' 或者 'TIME_OUT' 或者 'POSITION_UNAVAILABLE'
  external JSNumber info;

  /// needAddress的时候返回，结构化地址信息
  external JSNumber addressComponent;

  /// needAddress的时候返回，规范地址
  external JSNumber formattedAddress;

  /// needAddress的时候返回，定位点附近的POI信息
  external JSNumber pois;

  /// needAddress的时候返回，定位点附近的道路信息
  external JSNumber roads;

  /// needAddress的时候返回，定位点附近的交叉口信息
  external JSNumber crosses;
}

/// 根据IP返回对应城市信息，提供根据输入IP或自动获取IP获取对应城市信息功能。 用户可以通过自定义回调函数取回并显示查询结果。 若服务请求失败，系统将返回错误信息。
extension type CitySearch._(JSObject _) implements JSObject {
  /// 构造函数
  external CitySearch();

  /// 自动获取用户IP，回调返回当前用户所在城市 当status为complete时，result为CitySearchResult； 当status为error时，result为错误信息info； 当status为no_data时，代表检索返回0结果
  external void getLocalCity(CitySearchCallback cbk);

  /// 根据输入IP地址返回对应城市信息，status同上
  external void getCityByIp(String ip, CitySearchCallback callback);
}

/// 搜索城市信息回调函数扩展类型
extension type CitySearchCallback(JSFunction _) implements JSFunction {
  external void call(String status, CitySearchResult result);
}

extension type CitySearchResult._(JSObject _) implements JSObject {
  /// 构造函数
  CitySearchResult() : this._(JSObject());

  /// 城市名称
  external JSString city;

  /// 地图展示该城市时使用的矩形区域
  external Bounds bounds;
}
