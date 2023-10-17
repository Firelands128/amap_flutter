@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

/// 地理编码与逆地理编码类，用于地址描述与经纬度坐标之间的转换
@JS()
class Geocoder {
  external Geocoder(GeocoderOptions opts);

  /// 将地址信息转化为高德经纬度坐标信息
  external getLocation(String keyword, GeocoderCallback cbk);

  /// 地理编码时，设置地址描述所在城市
  external setCity(String city);

  /// 将高德经纬度坐标信息转化为结构化的地址信息
  external getAddress(LngLat location, ReGeocoderCallback cbk);
}

@JS()
@anonymous
class GeocoderOptions {
  external GeocoderOptions();

  /// 城市，地理编码时，设置地址描述所在城市，可选值：城市名（中文或中文全拼）、citycode、adcode，默认值：“全国”
  external String city;

  /// 逆地理编码时，以给定坐标为中心点，单位：米，取值范围：0 - 3000，默认值：1000
  external num radius;

  /// 设置语言类型，可选值：zh_cn（中文）、en(英文)，默认值：zh_cn（中文）
  external String lang;

  /// 是否批量查询，batch 设置为 false 时，只返回第一条记录
  external bool batch;

  /// 逆地理编码时，返回信息的详略，默认值：base，返回基本地址信息，取值为：all，返回地址信息及附近poi、道路、道路交叉口等信息
  external String extensions;
}

/// Geocoder getLocation 回调函数
typedef GeocoderCallback = void Function(String status, GeocodeResult result);

/// Geocoder getAddress 回调函数
typedef ReGeocoderCallback = void Function(String status, ReGeocoderResult result);

@JS()
@anonymous
class GeocodeResult {
  external GeocodeResult();

  /// 返回结果状态值，返回值为 0 或 1，0 表示请求失败；1 表示请求成功。
  external num status;

  /// 返回结果数目
  external num count;

  /// 返回状态说明，当 status 为 0 时，info 会返回具体错误原因，否则返回“OK”。详情可以参阅info状态表
  external String info;

  /// 地理编码信息列表
  external List<Geocode> geocodes;
}

@JS()
@anonymous
class Geocode {
  external Geocode();

  /// 国家，国内地址默认返回中国
  external String country;

  /// 地址所在的省份名，例如：北京市。此处需要注意的是，中国的四大直辖市也算作省级单位。
  external String province;

  /// 地址所在的城市名，例如：北京市
  external String city;

  /// 城市编码，例如：010
  external String citycode;

  /// 地址所在的区，例如：朝阳区
  external String district;

  /// 街道，例如：阜通东大街
  external String street;

  /// 门牌，例如：6号
  external String number;

  /// 区域编码，例如：110101
  external String adcode;

  /// 坐标点，经度，纬度
  external String location;

  /// 匹配级别，参见下方的地理编码匹配级别列表
  external String level;
}

@JS()
@anonymous
class ReGeocoderResult {
  external ReGeocoderResult();

  /// 返回结果状态值，返回值为 0 或 1，0 表示请求失败；1 表示请求成功。
  external num status;

  /// 返回状态说明，当 status 为 0 时，info 会返回具体错误原因，否则返回“OK”。
  external String info;

  /// 逆地理编码列表，返回 regeocode 对象
  external Regeocode regeocode;
}

@JS()
@anonymous
class Regeocode {
  external Regeocode();

  /// 地址元素列表
  external AddressComponent addressComponent;

  /// 道路信息列表
  external List<Road> roads;

  /// 道路交叉口列表
  external List<Roadinter> roadinters;

  /// poi信息列表
  external List<Poi> pois;

  /// aoi信息列表
  external List<Aoi> aois;
}

@JS()
@anonymous
class AddressComponent {
  external AddressComponent();

  /// 坐标点所在省名称，例如：北京市
  external String province;

  /// 坐标点所在城市名称，请注意：当城市是省直辖县时返回为空，以及城市为北京、上海、天津、重庆四个直辖市时，该字段返回为空；省直辖县列表
  external String city;

  /// 城市编码，例如：010
  external String citycode;

  /// 坐标点所在区，例如：海淀区
  external String district;

  /// 行政区编码，例如：110108
  external String adcode;

  /// 坐标点所在乡镇/街道（此街道为社区街道，不是道路信息），例如：燕园街道
  external String township;

  /// 乡镇街道编码，例如：110101001000
  external String towncode;

  /// 社区信息列表
  external Neighborhood neighborhood;

  /// 楼信息列表
  external Building building;

  /// 门牌信息列表
  external StreetNumber streetNumber;

  /// 所属海域信息，例如：渤海
  external String seaArea;

  /// 经纬度所属商圈列表
  external List<BusinessArea> businessAreas;
}

@JS()
@anonymous
class Neighborhood {
  external Neighborhood();

  /// 社区名称，例如：北京大学
  external String name;

  /// POI类型，例如：科教文化服务;学校;高等院校
  external String type;
}

@JS()
@anonymous
class Building {
  external Building();

  /// 建筑名称，例如：万达广场
  external String name;

  /// 类型，例如：科教文化服务;学校;高等院校
  external String type;
}

@JS()
@anonymous
class StreetNumber {
  external StreetNumber();

  /// 街道名称，例如：中关村北二条
  external String street;

  /// 门牌号，例如：3号
  external String number;

  /// 坐标点，经纬度坐标点：经度，纬度
  external String location;

  /// 方向，坐标点所处街道方位
  external String direction;

  /// 门牌地址到请求坐标的距离，单位：米
  external String distance;
}

@JS()
@anonymous
class BusinessArea {
  external BusinessArea();

  /// 商圈中心点经纬度
  external String location;

  /// 商圈名称，例如：颐和园
  external String name;

  /// 商圈所在区域的adcode，例如：朝阳区/海淀区
  external String id;
}

@JS()
@anonymous
class Road {
  external Road();

  /// 道路id
  external String id;

  /// 道路名称
  external String name;

  /// 道路到请求坐标的距离，单位：米
  external String distance;

  /// 方位，输入点和此路的相对方位
  external String direction;

  /// 坐标点
  external String location;
}

@JS()
@anonymous
class Roadinter {
  external Roadinter();

  /// 交叉路口到请求坐标的距离，单位：米
  external String distance;

  /// 方位，输入点相对路口的方位
  external String direction;

  /// 路口经纬度
  external String location;

  /// 第一条道路id
  @JS("first_id")
  external String firstId;

  /// 第一条道路名称
  @JS("first_name")
  external String firstName;

  /// 第二条道路id
  @JS("second_id")
  external String secondId;

  /// 第二条道路名称
  @JS("second_name")
  external String secondName;
}

@JS()
@anonymous
class Poi {
  external Poi();

  /// poi的id
  external String id;

  /// poi点名称
  external String name;

  /// poi类型
  external String type;

  /// 电话
  external String tel;

  /// 该POI的中心点到请求坐标的距离，单位：米
  external String distance;

  /// 方向，为输入点相对建筑物的方位
  external String direction;

  /// poi地址信息
  external String address;

  /// 坐标点
  external String location;

  /// poi所在商圈名称
  external String businessarea;
}

@JS()
@anonymous
class Aoi {
  external Aoi();

  /// 所属 aoi的id
  external String id;

  /// 所属 aoi 名称
  external String name;

  /// 所属 aoi 所在区域编码
  external String adcode;

  /// 所属 aoi 中心点坐标
  external String location;

  /// 所属aoi点面积，单位：平方米
  external String area;

  /// 输入经纬度是否在aoi面之中，0，代表在aoi内，其余整数代表距离AOI的距离
  external String distance;

  /// 所属 aoi 类型
  external String type;
}

/// 地球上同一个地理位置的经纬度，在不同的坐标系中，会有少于偏移，国内目前常见的坐标系主要分为三种：
// 1. 地球坐标系——WGS84：常见于 GPS 设备，Google 地图等国际标准的坐标体系。
// 2. 火星坐标系——GCJ-02：中国国内使用的被强制加密后的坐标体系，高德坐标就属于该种坐标体系。
// 3. 百度坐标系——BD-09：百度地图所使用的坐标体系，是在火星坐标系的基础上又进行了一次加密处理。
// 因此在使用不同坐标系前，我们需要使用 AMap.convertFrom() 方法将这些非高德坐标系进行转换。
@JS("convertFrom")
typedef ConvertFrom = void Function(LngLat lngLat, String type, Function? cbk);
