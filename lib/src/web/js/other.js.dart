@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

/// 行政区查询服务，提供行政区信息的查询， 使用该服务可以获取到行政区域的区号、城市编码、中心点、边界、下辖区域等详细信息，为基于行政区域的地图功能提供支持。
@JS()
class DistrictSearch {
  external DistrictSearch(DistrictSearchOptions opts, String level, bool showbiz, String extensions, num subdistrict);

  /// 设置关键字对应的行政区级别或商圈，可选值： country：国家 province：省/直辖市 city：市 district：区/县 biz_area：商圈
  external static void setLevel(String level);

  /// 设置下级行政区级数（行政区级别包括：国家、省/直辖市、市、区/县4个级别），商圈为区/县下一级，默认值：1 可选值：0、1、2、3 0：不返回下级行政区； 1：返回下一级行政区； 2：返回下两级行政区； 3：返回下三级行政区；
  external static void setSubdistrict(String subdistrict);

  /// 根据关键字查询行政区或商圈信息 关键字支持：行政区名、citycode、adcode、商圈名。默认值：“全国” 当status为complete时，result为DistrictSearchResult； 当status为error时，result为错误信息info； 当status为no_data时，代表检索返回0结果
  external static void search(dynamic keyword, DistrictSearchCallBack callBack, String keywords);
}

@JS()
@anonymous
class DistrictSearchOptions {
  /// 构造函数
  external DistrictSearchOptions();

  /// 关键字对应的行政区级别或商圈，可选值：
  /// country：国家
  /// province：省/直辖市
  /// city：市
  /// district：区/县
  /// biz_area：商圈
  external String level;

  /// 是否显示商圈，为了能够精准的定位到街道，特别是在快递、物流、送餐等场景下，强烈建议将此设置为false，默认值true
  external bool showbiz;

  /// 是否返回行政区边界坐标点，base：不返回行政区边界坐标点，all：返回完整行政区边界坐标点，默认值：base
  external String extensions;

  /// 显示下级行政区级数（行政区级别包括：国家、省/直辖市、市、区/县4个级别），商圈为区/县下一级
  /// 0：不返回下级行政区
  /// 1：返回下一级行政区
  /// 2：返回下两级行政区
  /// 3：返回下三级行政区
  /// 默认值：1
  external num subdistrict;
}

typedef DistrictSearchCallBack = void Function(String status, DistrictSearchResult result);

@JS()
@anonymous
class DistrictSearchResult {
  /// 构造函数
  external DistrictSearchResult();

  /// 成功状态文字描述
  external String info;

  /// 根据查询条件返回行政区划列表
  external List<District> districtList;
}

@JS()
@anonymous
class District {
  external District();

  /// 行政区名称
  external String name;

  /// 城市中心点经纬度坐标
  external LngLat center;

  /// 城市编码
  external String citycode;

  /// 区域编码
  external String adcode;

  /// 行政区划级别
  external String level;

  /// extensions为“all”时，返回行政区的边界坐标集合，为经纬度的二维数组
  /// 若行政区包含多个区面，则二维数组中包含多个经纬度路径的元素
  external List<LngLat> boundaries;

  /// 下级行政区信息列表，subdistrict 为0时，不返回该对象
  external List<District> districtList;
}

/// 天气查询服务，根据城市名称或区域编码返回城市天气预报信息，包括实时天气信息和四天天气预报。
@JS()
class Weather {
  external Weather();

  /// 查询实时天气信息
  external void getLive(String city, WeatherLiveResult callback);

  /// 查询四天预报天气，包括查询当天天气信息
  external void getForecast(String city, WeatherForecastResult callback);
}

typedef WeatherLiveResult = void Function(Object err, LiveData liveData);

@JS()
@anonymous
class LiveData {
  external LiveData();

  /// 成功状态文字描述
  external String info;

  /// 省份名
  external String province;

  /// 城市名
  external String city;

  /// 区域编码
  external String adcode;

  /// 天气现象，详见天气现象列表
  external String weather;

  /// 实时气温，单位：摄氏度
  external String temperature;

  /// 风向，风向编码对应描述
  external String windDirection;

  /// 风力，风力编码对应风力级别，单位：级
  external num windPower;

  /// 空气湿度（百分比）
  external String humidity;

  /// 数据发布的时间
  external String reportTime;
}

typedef WeatherForecastResult = void Function(Object err, ForecastData forecastData);

@JS()
@anonymous
class ForecastData {
  external ForecastData();

  /// 成功状态文字描述
  external String info;

  /// 省份名
  external String province;

  /// 城市名
  external String city;

  /// 区域编码
  external String adcode;

  /// 数据发布的时间
  external String reportTime;

  /// 天气预报数组，包括当天至第三天的预报数据
  external List<Forecast> forecast;
}

@JS()
@anonymous
class Forecast {
  external Forecast();

  /// 日期，格式为“年-月-日”
  external String date;

  /// 星期
  external String week;

  /// 白天天气现象，详见天气现象列表
  external String dayWeather;

  /// 夜间天气现象，详见天气现象列表
  external String nightWeather;

  /// 白天温度
  external num dayTemp;

  /// 白天温度
  external num nightTemp;

  /// 白天风向
  external String dayWindDir;

  /// 白天风力
  external String dayWindPower;

  /// 夜间风力
  external String nightWindPower;
}

/// 公交站点查询服务，根据输入关键字、ID查询公交站点信息。
@JS()
class StationSearch {
  external StationSearch(StationSearchOptions opts);

  external static StationSearchOptions stationSearchOptions();

  /// 设置查询结果页码，默认值：1 取值范围：1-100，超过取值范围按默认
  external void setPageIndex(num pageIndex);

  /// 设置单页显示结果条数，默认值：20 取值范围：1-100，超过取值范围按默认
  external void setPageSize(num pageSize);

  /// 设置查询城市，默认值：“全国” 可选值：cityname（中文或中文全拼）、citycode、adcode、cityid、citykeyword
  /// 根据给定的公交站点id进行公交站点详情检索，id是公交站点的唯一标识
  /// 根据给定的公交站点名称进行公交站点详情查询，多个关键字用"|"分割
  /// 当status为complete时，result为StationSearchResult； 当status为error时，result为错误信息info； 当status为no_data时，代表检索返回0结果
  external void setCity(String city);
}

@JS()
@anonymous
class StationSearchOptions {
  external StationSearchOptions();

  /// 页码（如pageIndex为2，pageSize为10，那么显示的应是第11-20条返回结果） 默认值：1，取值范围：1-100，超过取值范围按默认，超出实际页数按最大值返回
  external num pageIndex;

  /// 单页显示结果条数，默认值：20，取值范围：1-100，超过取值范围按默认
  external num pageSize;

  /// 公交站点所在城市，默认值：“全国”，可选值：cityname（中文或中文全拼）、citycode、adcode
  external String city;
}

typedef StationSearchCallback = void Function(String station);

/// 公交路线查询类，通过extensions属性控制返回信息详略
@JS()
class LineSearch {
  external LineSearch(LineSearchOptions opts, String extensions);

  external static LineSearchOptions lineSearchOptions();

  /// 设置查询结果页码，默认值：1 取值范围：1-100，超过取值范围按默认
  external void setPageIndex(num pageIndex);

  /// 设置单页显示结果条数，默认值：20 取值范围：1-100，超过取值范围按默认
  external void setPageSize(num pageSize);

  /// 设置查询城市，默认值：“全国” 可选值：cityname（中文或中文全拼）、citycode、adcode、cityid、citykeyword
  /// 根据给定的公交站点id进行公交站点详情检索，id是公交站点的唯一标识
  /// 根据给定公交站点名称进行公交站点详情查询，多个关键字用"|"分割
  /// 当status为complete时，result为LineSearchResult； 当status为error时，result为错误信息info； 当status为no_data时，代表检索返回0结果
  external void setCityWithId(String city);
}

@JS()
@anonymous
class LineSearchOptions {
  external LineSearchOptions();

  /// 页码（如pageIndex为2，pageSize为10，那么显示的应是第11-20条返回结果） 默认值：1，取值范围：1-100，超过取值范围按默认，超出实际页数按最大值返回
  external num pageIndex;

  /// 单页显示结果条数，默认值：20，取值范围：1-100，超过取值范围按默认
  external num pageSize;

  /// 公交站点所在城市，默认值：“全国”，可选值：cityname（中文或中文全拼）、citycode、adcode
  external String city;
}

typedef LineSearchCallback = void Function(String line);

/// AMap.RoadInfoSearch道路及道路交叉口查询服务，用与查询道路相关信息。
// AMap.RoadInfoSearch提供根据道路ID、道路名称查询道路信息，提供交叉路口ID以及交叉路口名称查询交叉口信息等功能。
@JS()
class RoadInfoSearch {
  /// 构造函数
  external RoadInfoSearch(RoadInfoSearchOptions opts);

  /// 根据给定的道路ID查询道路信息，ID是道路的唯一标识
  /// 当status为complete时，result为RoadInfoSearchResult；
  /// 当status为error时，result为错误信息info；
  /// 当status为no_data时，代表检索返回0结果
  external void roadInfoSearchByRoadId(String id, Function(String status, RoadInfoSearchResult result) callback);

  /// 根据给定的关键字查询道路信息，多个关键字用“|”分割，支持中文|中文全拼，status说明同上
  external void roadInfoSearchByRoadName(String keyword, Function(String status, RoadInfoSearchResult result) callback);

  /// 根据交叉路口ID查询交叉口信息，ID是交叉口的唯一标识，status说明同上
  external void crossInfoSearchByCrossId(String id, Function(String status, CrossInfoSearchResult result) callback);

  /// 根据道路名称查询交叉口信息，status说明同上
  external void crossInfoSearchByRoadName(
      String keyword, Function(String status, CrossInfoSearchResult result) callback);

  /// 设置单页显示结果条数，取值范围为[1-100]，超出取值范围按默认值返回
  external void setPageSize(num pageSize);

  /// 设置查询结果页码，取值范围为[1-100]，超出取值范围按默认值返回
  external void setPageIndex(num pageIndex);

  /// 设置查询城市，多个城市用"|"分割，可选值：cityname（中文|中文全拼）、citycode、adcode，默认值：“全国”
  external void setCity(String city);
}

@JS()
@anonymous
class RoadInfoSearchOptions {
  /// 构造函数
  external RoadInfoSearchOptions();

  /// 页码（如pageIndex为2，pageSize为10，那么显示的应是第11-20条返回结果）
  /// 取值范围为[1-100]，超出取值范围按默认值返回，默认值：1
  external num pageIndex;

  /// 单页显示结果条数，取值范围为[1-100]，超出取值范围按 默认值返回，默认值：1
  external num pageSize;

  /// 多个城市用"|"分割
  /// 可选值：cityname（中文|中文全拼）、citycode、adcode
  /// 默认值：“全国”
  external String city;
}

@JS()
@anonymous
class RoadInfoSearchResult {
  /// 构造函数
  external RoadInfoSearchResult();

  /// 成功状态文字描述
  external String info;

  /// 根据查询条件返回道路信息
  external List<RoadInfo> roadInfo;

  /// 查无此道路时，返回的建议关键字列表
  external List<String> keywordList;

  /// 查该城市无此道路时，返回的建议城市列表
  external List<CityInfo> cityList;
}

@JS()
@anonymous
class CrossInfoSearchResult {
  /// 构造函数
  external CrossInfoSearchResult();

  /// 成功状态文字描述
  external String info;

  /// 根据查询条件返回交叉口信息
  external List<CrossInfo> crossInfo;

  /// 查无此道路时，返回的建议关键字列表
  external List<String> keywordList;

  /// 查该城市无此道路时，返回的建议城市列表
  external List<CityInfo> cityList;
}

@JS()
@anonymous
class RoadInfo {
  /// 构造函数
  external RoadInfo();

  /// 道路id，该id是唯一标识
  external String id;

  /// 道路名称
  external String name;

  /// 道路类型文字描述，详细参考道路类型列表
  external String type;

  /// 道路中心点坐标
  external LngLat center;

  /// 城市编码
  external String citycode;

  /// 道路路径坐标集合
  external List<List<LngLat>> path;
}

@JS()
@anonymous
class CrossInfo {
  /// 构造函数
  external CrossInfo();

  /// 道路交叉口ID，ID是道路交叉口唯一标识
  external String id;

  /// 道路交叉口经纬度坐标
  external LngLat location;

  /// 交叉口第一条道路ID
  external String firstRoadId;

  /// 交叉口第一条道路名称
  external String firstRoadName;

  /// 交叉口第二条道路ID
  external String secondRoadId;

  /// 交叉口第二条道路名称
  external String secondRoadName;

  /// 城市编码
  external String citycode;
}

@JS()
@anonymous
class CityInfo {
  /// 构造函数
  external CityInfo();

  /// 城市名称
  external String name;

  /// 城市编码
  external String citycode;

  /// 区域编码
  external num adcode;

  /// 该城市相关结果数目
  external String count;
}
