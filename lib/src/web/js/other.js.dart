@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// 行政区查询服务，提供行政区信息的查询， 使用该服务可以获取到行政区域的区号、城市编码、中心点、边界、下辖区域等详细信息，为基于行政区域的地图功能提供支持。
extension type DistrictSearch._(JSObject _) implements JSObject {
  /// 构造函数
  external DistrictSearch(
    DistrictSearchOptions opts,
    String level,
    JSBoolean showbiz,
    String extensions,
    num subdistrict,
  );

  /// 设置关键字对应的行政区级别或商圈，可选值： country：国家 province：省/直辖市 city：市 district：区/县 biz_area：商圈
  external static void setLevel(String level);

  /// 设置下级行政区级数（行政区级别包括：国家、省/直辖市、市、区/县4个级别），商圈为区/县下一级，默认值：1 可选值：0、1、2、3 0：不返回下级行政区； 1：返回下一级行政区； 2：返回下两级行政区； 3：返回下三级行政区；
  external static void setSubdistrict(String subdistrict);

  /// 根据关键字查询行政区或商圈信息 关键字支持：行政区名、citycode、adcode、商圈名。默认值：“全国” 当status为complete时，result为DistrictSearchResult； 当status为error时，result为错误信息info； 当status为no_data时，代表检索返回0结果
  external static void search(
    JSAny keyword,
    DistrictSearchCallBack callBack,
    String keywords,
  );
}

extension type DistrictSearchOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DistrictSearchOptions() : this._(JSObject());

  /// 关键字对应的行政区级别或商圈，可选值：
  /// country：国家
  /// province：省/直辖市
  /// city：市
  /// district：区/县
  /// biz_area：商圈
  external JSString level;

  /// 是否显示商圈，为了能够精准的定位到街道，特别是在快递、物流、送餐等场景下，强烈建议将此设置为false，默认值true
  external JSBoolean showbiz;

  /// 是否返回行政区边界坐标点，base：不返回行政区边界坐标点，all：返回完整行政区边界坐标点，默认值：base
  external JSString extensions;

  /// 显示下级行政区级数（行政区级别包括：国家、省/直辖市、市、区/县4个级别），商圈为区/县下一级
  /// 0：不返回下级行政区
  /// 1：返回下一级行政区
  /// 2：返回下两级行政区
  /// 3：返回下三级行政区
  /// 默认值：1
  external JSNumber subdistrict;
}

/// 查询行政区回调函数扩展类型
extension type DistrictSearchCallBack(JSFunction _) implements JSFunction {
  external void call(String status, DistrictSearchResult result);
}

extension type DistrictSearchResult._(JSObject _) implements JSObject {
  /// 构造函数
  DistrictSearchResult() : this._(JSObject());

  /// 成功状态文字描述
  external JSString info;

  /// 根据查询条件返回行政区划列表
  external JSArray<District> districtList;
}

extension type District._(JSObject _) implements JSObject {
  /// 构造函数
  District() : this._(JSObject());

  /// 行政区名称
  external JSString name;

  /// 城市中心点经纬度坐标
  external LngLat center;

  /// 城市编码
  external JSString citycode;

  /// 区域编码
  external JSString adcode;

  /// 行政区划级别
  external JSString level;

  /// extensions为“all”时，返回行政区的边界坐标集合，为经纬度的二维数组
  /// 若行政区包含多个区面，则二维数组中包含多个经纬度路径的元素
  external JSArray<LngLat> boundaries;

  /// 下级行政区信息列表，subdistrict 为0时，不返回该对象
  external JSArray<District> districtList;
}

/// 天气查询服务，根据城市名称或区域编码返回城市天气预报信息，包括实时天气信息和四天天气预报。
extension type Weather._(JSObject _) implements JSObject {
  /// 构造函数
  external Weather();

  /// 查询实时天气信息
  external void getLive(String city, WeatherLiveResult callback);

  /// 查询四天预报天气，包括查询当天天气信息
  external void getForecast(String city, WeatherForecastResult callback);
}

/// 天气查询服务结果回调函数扩展类型
extension type WeatherLiveResult(JSFunction _) implements JSFunction {
  /// 构造函数
  external void call(JSObject err, LiveData liveData);
}

extension type LiveData._(JSObject _) implements JSObject {
  /// 构造函数
  LiveData() : this._(JSObject());

  /// 成功状态文字描述
  external JSString info;

  /// 省份名
  external JSString province;

  /// 城市名
  external JSString city;

  /// 区域编码
  external JSString adcode;

  /// 天气现象，详见天气现象列表
  external JSString weather;

  /// 实时气温，单位：摄氏度
  external JSString temperature;

  /// 风向，风向编码对应描述
  external JSString windDirection;

  /// 风力，风力编码对应风力级别，单位：级
  external JSNumber windPower;

  /// 空气湿度（百分比）
  external JSString humidity;

  /// 数据发布的时间
  external JSString reportTime;
}

/// 天气查询结果回调函数扩展类型
extension type WeatherForecastResult(JSFunction _) implements JSFunction {
  external void call(JSObject err, ForecastData forecastData);
}

extension type ForecastData._(JSObject _) implements JSObject {
  /// 构造函数
  ForecastData() : this._(JSObject());

  /// 成功状态文字描述
  external JSString info;

  /// 省份名
  external JSString province;

  /// 城市名
  external JSString city;

  /// 区域编码
  external JSString adcode;

  /// 数据发布的时间
  external JSString reportTime;

  /// 天气预报数组，包括当天至第三天的预报数据
  external JSArray<Forecast> forecast;
}

extension type Forecast._(JSObject _) implements JSObject {
  /// 构造函数
  Forecast() : this._(JSObject());

  /// 日期，格式为“年-月-日”
  external JSString date;

  /// 星期
  external JSString week;

  /// 白天天气现象，详见天气现象列表
  external JSString dayWeather;

  /// 夜间天气现象，详见天气现象列表
  external JSString nightWeather;

  /// 白天温度
  external JSNumber dayTemp;

  /// 白天温度
  external JSNumber nightTemp;

  /// 白天风向
  external JSString dayWindDir;

  /// 白天风力
  external JSString dayWindPower;

  /// 夜间风力
  external JSString nightWindPower;
}

/// 公交站点查询服务，根据输入关键字、ID查询公交站点信息。
@JS()
extension type StationSearch._(JSObject _) implements JSObject {
  /// 构造函数
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

extension type StationSearchOptions._(JSObject _) implements JSObject {
  /// 构造函数
  StationSearchOptions() : this._(JSObject());

  /// 页码（如pageIndex为2，pageSize为10，那么显示的应是第11-20条返回结果） 默认值：1，取值范围：1-100，超过取值范围按默认，超出实际页数按最大值返回
  external JSNumber pageIndex;

  /// 单页显示结果条数，默认值：20，取值范围：1-100，超过取值范围按默认
  external JSNumber pageSize;

  /// 公交站点所在城市，默认值：“全国”，可选值：cityname（中文或中文全拼）、citycode、adcode
  external JSString city;
}

/// 搜索站点回调函数扩展类型
extension type StationSearchCallback(JSFunction _) implements JSFunction {
  external void call(String station);
}

/// 公交路线查询类，通过extensions属性控制返回信息详略
@JS()
extension type LineSearch._(JSObject _) implements JSObject {
  /// 构造函数
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

extension type LineSearchOptions._(JSObject _) implements JSObject {
  /// 构造函数
  LineSearchOptions() : this._(JSObject());

  /// 页码（如pageIndex为2，pageSize为10，那么显示的应是第11-20条返回结果） 默认值：1，取值范围：1-100，超过取值范围按默认，超出实际页数按最大值返回
  external JSNumber pageIndex;

  /// 单页显示结果条数，默认值：20，取值范围：1-100，超过取值范围按默认
  external JSNumber pageSize;

  /// 公交站点所在城市，默认值：“全国”，可选值：cityname（中文或中文全拼）、citycode、adcode
  external JSString city;
}

/// 搜索路线回调函数扩展类型
extension type LineSearchCallback(JSFunction _) implements JSFunction {
  external void call(String line);
}

/// AMap.RoadInfoSearch道路及道路交叉口查询服务，用与查询道路相关信息。
// AMap.RoadInfoSearch提供根据道路ID、道路名称查询道路信息，提供交叉路口ID以及交叉路口名称查询交叉口信息等功能。
@JS()
extension type RoadInfoSearch._(JSObject _) implements JSObject {
  /// 构造函数
  external RoadInfoSearch(RoadInfoSearchOptions opts);

  /// 根据给定的道路ID查询道路信息，ID是道路的唯一标识
  /// 当status为complete时，result为RoadInfoSearchResult；
  /// 当status为error时，result为错误信息info；
  /// 当status为no_data时，代表检索返回0结果
  external void roadInfoSearchByRoadId(
    String id,
    RoadInfoSearchCallBack callback,
  );

  /// 根据给定的关键字查询道路信息，多个关键字用“|”分割，支持中文|中文全拼，status说明同上
  external void roadInfoSearchByRoadName(
    String keyword,
    RoadInfoSearchCallBack callback,
  );

  /// 根据交叉路口ID查询交叉口信息，ID是交叉口的唯一标识，status说明同上
  external void crossInfoSearchByCrossId(
    String id,
    CrossInfoSearchCallBack callback,
  );

  /// 根据道路名称查询交叉口信息，status说明同上
  external void crossInfoSearchByRoadName(
    String keyword,
    CrossInfoSearchCallBack callback,
  );

  /// 设置单页显示结果条数，取值范围为[1-100]，超出取值范围按默认值返回
  external void setPageSize(num pageSize);

  /// 设置查询结果页码，取值范围为[1-100]，超出取值范围按默认值返回
  external void setPageIndex(num pageIndex);

  /// 设置查询城市，多个城市用"|"分割，可选值：cityname（中文|中文全拼）、citycode、adcode，默认值：“全国”
  external void setCity(String city);
}

/// 查询道路信息回调函数扩展类型
extension type RoadInfoSearchCallBack(JSFunction _) implements JSFunction {
  external void call(String status, RoadInfoSearchResult result);
}

/// 查询交叉口信息回调函数扩展类型
extension type CrossInfoSearchCallBack(JSFunction _) implements JSFunction {
  external void call(String status, CrossInfoSearchResult result);
}

extension type RoadInfoSearchOptions._(JSObject _) implements JSObject {
  /// 构造函数
  RoadInfoSearchOptions() : this._(JSObject());

  /// 页码（如pageIndex为2，pageSize为10，那么显示的应是第11-20条返回结果）
  /// 取值范围为[1-100]，超出取值范围按默认值返回，默认值：1
  external JSNumber pageIndex;

  /// 单页显示结果条数，取值范围为[1-100]，超出取值范围按 默认值返回，默认值：1
  external JSNumber pageSize;

  /// 多个城市用"|"分割
  /// 可选值：cityname（中文|中文全拼）、citycode、adcode
  /// 默认值：“全国”
  external JSString city;
}

extension type RoadInfoSearchResult._(JSObject _) implements JSObject {
  /// 构造函数
  RoadInfoSearchResult() : this._(JSObject());

  /// 成功状态文字描述
  external JSString info;

  /// 根据查询条件返回道路信息
  external JSArray<RoadInfo> roadInfo;

  /// 查无此道路时，返回的建议关键字列表
  external JSArray<JSString> keywordList;

  /// 查该城市无此道路时，返回的建议城市列表
  external JSArray<CityInfo> cityList;
}

extension type CrossInfoSearchResult._(JSObject _) implements JSObject {
  /// 构造函数
  CrossInfoSearchResult() : this._(JSObject());

  /// 成功状态文字描述
  external JSString info;

  /// 根据查询条件返回交叉口信息
  external JSArray<CrossInfo> crossInfo;

  /// 查无此道路时，返回的建议关键字列表
  external JSArray<JSString> keywordList;

  /// 查该城市无此道路时，返回的建议城市列表
  external JSArray<CityInfo> cityList;
}

extension type RoadInfo._(JSObject _) implements JSObject {
  /// 构造函数
  RoadInfo() : this._(JSObject());

  /// 道路id，该id是唯一标识
  external JSString id;

  /// 道路名称
  external JSString name;

  /// 道路类型文字描述，详细参考道路类型列表
  external JSString type;

  /// 道路中心点坐标
  external LngLat center;

  /// 城市编码
  external JSString citycode;

  /// 道路路径坐标集合
  external JSArray<JSArray<LngLat>> path;
}

extension type CrossInfo._(JSObject _) implements JSObject {
  /// 构造函数
  CrossInfo() : this._(JSObject());

  /// 道路交叉口ID，ID是道路交叉口唯一标识
  external JSString id;

  /// 道路交叉口经纬度坐标
  external LngLat location;

  /// 交叉口第一条道路ID
  external JSString firstRoadId;

  /// 交叉口第一条道路名称
  external JSString firstRoadName;

  /// 交叉口第二条道路ID
  external JSString secondRoadId;

  /// 交叉口第二条道路名称
  external JSString secondRoadName;

  /// 城市编码
  external JSString citycode;
}

extension type CityInfo._(JSObject _) implements JSObject {
  /// 构造函数
  CityInfo() : this._(JSObject());

  /// 城市名称
  external JSString name;

  /// 城市编码
  external JSString citycode;

  /// 区域编码
  external JSNumber adcode;

  /// 该城市相关结果数目
  external JSString count;
}
