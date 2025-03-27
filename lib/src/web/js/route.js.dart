@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'package:web/web.dart' show HTMLElement;
import 'js.dart';

/// 驾车路线规划服务，提供起、终点坐标的驾车导航路线查询功能
extension type Driving._(JSObject _) implements JSObject {
  /// 构造函数
  external Driving(DrivingOptions opts);

  /// 根据起点、终点和途经点（可选）坐标或名称，实现驾车路线规划，途经点通过opts设定
  external void search(
    LngLat origin,
    LngLat destination,
    DrivingSearchOptions opts,
    DrivingCallback callback,
  );

  /// 根据起点、终点和途经点（可选）坐标或名称，实现驾车路线规划，途经点通过opts设定
  @JS("search")
  external void searchWithPoints(
    JSArray<DrivingSearchPoint> points,
    DrivingCallback callback,
  );

  /// 清除搜索结果
  external void clear();

  /// 设置避让区域，最大支持三个避让区域，参数为LngLat的二维数组
  external void setAvoidPolygons(JSArray<JSArray<LngLat>> areas);

  /// 清除避让区域
  external void clearAvoidPolygons();

  /// 获取避让区域，返回LngLat的二维数组
  external JSArray<JSArray<LngLat>> getAvoidPolygons();

  /// 设置避让道路名称，只支持一条避让道路 注：避让道路和避让区域不能同时使用
  external void setAvoidRoad(String value);

  /// 清除避让道路
  external void clearAvoidRoad();

  /// 获取避让道路
  external JSString getAvoidRoad();

  /// 设置车牌的汉字首字符和首字后的号码，设置后路线规划的结果将考虑该车牌在当前时间的限行路段
  external void setProvinceAndNumber(String province, String number);

  /// 设置驾车路线规划策略
  external void setPolicy(JSObject policy);
}

extension type DrivingOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DrivingOptions() : this._(JSObject());

  /// AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
  external AMap map;

  /// 驾车路线规划策略
  external JSNumber? policy;

  /// 返回基本地址信息，当取值为：all，返回DriveStep基本信息+DriveStep详细信息，默认值：base
  external JSString extensions;

  /// 表示可以使用轮渡，为1的时候表示不可以使用轮渡，默认为0
  external JSNumber ferry;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标，默认值为：false
  external JSBoolean hideMarkers;

  /// 设置是否显示实时路况信息，默认设置为true。 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息。
  external JSBoolean showTraffic;

  /// 车牌省份的汉字缩写，用于判断是否限行，与number属性组合使用，可选。例如：京
  external JSString? province;

  /// 除省份之外车牌的字母和数字，用于判断限行相关，与province属性组合使用，可选。例如:NH1N11
  external JSString? number;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;
}

extension type DrivingSearchOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DrivingSearchOptions() : this._(JSObject());

  /// 途径点
  external JSArray<LngLat> waypoints;
}

extension type DrivingSearchPoint._(JSObject _) implements JSObject {
  /// 构造函数
  DrivingSearchPoint() : this._(JSObject());

  /// 关键词
  external JSString keyword;

  /// 城市
  external JSString city;
}

/// Driving.search 的回调函数扩展函数
extension type DrivingCallback(JSFunction _) implements JSFunction {
  external void call(String status, DrivingResult result);
}

/// DrivingResult 对象
extension type DrivingResult._(JSObject _) implements JSObject {
  /// 构造函数
  DrivingResult() : this._(JSObject());

  /// 成功状态说明
  external JSString info;

  /// 驾车规划起点坐标
  external LngLat origin;

  /// 驾车规划终点坐标
  external LngLat destination;

  /// 驾车规划起点
  external Poi start;

  /// 驾车规划终点
  external Poi end;

  /// 驾车规划途经点
  external Poi waypoints;

  /// 打车费用，仅extensions为“all”时返回. 单位: 元
  @JS("taxi_cost")
  external JSNumber taxiCost;

  /// 驾车规划路线列表
  external JSArray<DriveRoute> routes;

  /// 子路段DriveStep集合
  external JSArray<DriveStep> steps;
}

extension type DriveRoute._(JSObject _) implements JSObject {
  /// 构造函数
  DriveRoute() : this._(JSObject());

  /// 起点到终点的驾车距离，单位：米
  external JSNumber distance;

  /// 时间预计，单位：秒
  external JSNumber time;

  /// 驾车规划策略
  external JSString policy;

  /// 此驾车路线收费金额，单位：元
  external JSNumber tolls;

  /// 收费路段长度，单位：米
  @JS("tolls_distance")
  external JSNumber tollsDistance;

  /// 限行结果,0 代表限行已规避或未限行，即该路线没有限行路段,1 代表限行无法规避，即该线路有限行路段
  external JSNumber restriction;
}

extension type DriveStep._(JSObject _) implements JSObject {}

/// DriveStep 对象(基本信息)
extension type DriveStepBasic._(JSObject _) implements DriveStep {
  /// 构造函数
  DriveStepBasic() : this._(JSObject());

  /// 此路段起点
  @JS("start_location")
  external LngLat startLocation;

  /// 此路段终点
  @JS("end_location")
  external LngLat endLocation;

  /// 此路段说明，如“沿北京南站路行驶565米右转”
  external JSString instruction;

  /// 本驾车子路段完成后动作
  external JSString action;

  /// 驾车子路段完成后辅助动作，一般为到达某个目的地时返回
  @JS("assist_action")
  external JSString assistAction;

  /// 驾车方向
  external JSString orientation;

  /// 驾车方向
  external JSString road;

  /// 此路段距离，单位：米
  external JSNumber distance;

  /// 此段收费，单位：元
  external JSNumber tolls;

  /// 收费路段长度，单位：米
  @JS("tolls_distance")
  external JSNumber tollsDistance;

  /// 主要收费道路
  @JS("toll_road")
  external JSString tollRoad;

  /// 此路段预计使用时间，单位：秒
  external JSNumber time;

  /// 此路段坐标集合
  external JSArray<LngLat> path;
}

/// DriveStep 对象(详细信息)
extension type DriveStepDetail._(JSObject _) implements DriveStep {
  /// 构造函数
  DriveStepDetail() : this._(JSObject());

  /// 途径城市列表
  external JSArray<ViaCity> cities;

  /// 实时交通信息列表
  external JSArray<DrivingTMC> tmcs;
}

extension type ViaCity._(JSObject _) implements JSObject {
  /// 构造函数
  ViaCity() : this._(JSObject());

  /// 途径名称
  external JSString name;

  /// 城市编码
  external JSString citycode;

  /// 区域编码
  external JSString adcode;

  /// 途径行政区列表
  external JSArray<DriveStepDistrict> districts;
}

extension type DriveStepDistrict._(JSObject _) implements JSObject {
  /// 构造函数
  DriveStepDistrict() : this._(JSObject());

  /// 区域名称
  external JSString name;

  /// 区域编码
  external JSString adcode;
}

extension type DrivingTMC._(JSObject _) implements JSObject {
  /// 构造函数
  DrivingTMC() : this._(JSObject());

  /// 路况信息对应的编码 如果direction是正向 lcode返回值大于0；否则lcode，返回值小于0； 如果返回0则说明此路段无lcode
  external JSString lcode;

  /// 此lcode对应的路段长度，单位: 米
  external JSNumber distance;

  /// 路况状态，可能的值有：未知，畅通，缓行，拥堵
  external JSString status;
}

/// 驾车路线规划服务，提供起、终点坐标的驾车导航路线查询功能
extension type TruckDriving._(JSObject _) implements JSObject {
  /// 构造函数
  external TruckDriving(TruckDrivingOptions opts);

  /// 清除搜索结果
  external void clear();

  /// 根据起点、终点和途经点（可选）坐标或名称，实现驾车路线规划，途经点通过opts设定
  @JS("search")
  external void searchByLocations(
    JSArray<TruckLocation> locations,
    DrivingCallback callback,
  );

  /// 根据起点、终点和途经点（可选）坐标或名称，实现驾车路线规划，途经点通过opts设定
  @JS("search")
  external void searchByPoints(
    JSArray<TruckPath> points,
    DrivingCallback callback,
  );

  /// 修改车牌号
  external void setProvinceAndNumber(String province, num number);

  /// 设置驾车路线规划策略,参考opts.policy
  external void setPolicy(JSObject policy);
}

extension type TruckDrivingOptions._(JSObject _) implements JSObject {
  /// 构造函数
  TruckDrivingOptions() : this._(JSObject());

  /// AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
  external AMap map;

  /// 货车路线规划策略strategy
  external JSNumber? policy;

  /// 车型大小，必填，1-4分别对应小型至大型
  external JSNumber size;

  /// 宽度，缺省2.5米
  external JSNumber? width;

  /// 高度,缺省1.6米
  external JSNumber? height;

  /// 载重,缺省0.9t
  external JSNumber? load;

  /// 自重，缺省10t
  external JSNumber? weight;

  /// 轴数，缺省2轴
  external JSNumber? axlesNum;

  /// 返回基本地址信息，当取值为：all，返回DriveStep基本信息+DriveStep详细信息，默认值：base
  external JSString extensions;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标，默认值为：false
  external JSBoolean hideMarkers;

  /// 设置是否显示实时路况信息，默认设置为true。 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息。
  external JSBoolean showTraffic;

  /// 车牌省份的汉字缩写，用于判断是否限行，与number属性组合使用，可选。例如：京
  external JSString? province;

  /// 除省份之外车牌的字母和数字，用于判断限行相关，与province属性组合使用，可选。例如:NH1N11
  external JSString number;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;
}

/// 途经点
extension type TruckLocation._(JSObject _) implements JSObject {
  /// 构造函数
  TruckLocation() : this._(JSObject());

  /// 经纬度
  external LngLat lnglat;

  /// POI ID,可缺省
  external JSString? pid;

  /// POI类型，可缺省
  external JSString? type;
}

/// 某个途经点
extension type TruckPath._(JSObject _) implements JSObject {
  /// 构造函数
  TruckPath() : this._(JSObject());

  /// 关键字
  external JSString keyword;

  /// 城市code
  external JSString city;
}

/// 步行路线规划服务，提供起、终点坐标的驾车导航路线查询功能
extension type Walking._(JSObject _) implements JSObject {
  /// 构造函数
  Walking(WalkingOptions opts) : this._(JSObject());

  /// 清除搜索的结果
  external void clear();

  /// 根据起点、终点坐标，实现步行路线规划
  external void search(
    LngLat origin,
    LngLat destination,
    WalkingCallback callback,
  );

  /// 根据起点、终点名称，实现步行路线规划
  @JS("search")
  external void searchWithPoints(
      JSArray<JSObject> points, WalkingCallback callback);
}

extension type WalkingOptions._(JSObject _) implements JSObject {
  /// 构造函数
  WalkingOptions() : this._(JSObject());

  /// AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
  external AMap map;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标\n默认值为：false 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息。
  external JSBoolean hideMarkers;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;
}

/// Walking.search 的回调函数扩展函数
extension type WalkingCallback(JSFunction _) implements JSFunction {
  external void call(String status, WalkingResult result);
}

/// WalkingResult 对象
extension type WalkingResult._(JSObject _) implements JSObject {
  /// 构造函数
  WalkingResult() : this._(JSObject());

  /// 成功状态说明
  external JSString info;

  /// 步行规划起点坐标
  external LngLat origin;

  /// 步行规划终点坐标
  external LngLat destination;

  /// 步行规划起点
  external Poi start;

  /// 步行规划终点
  external Poi end;

  /// 步行导航路段数目
  external JSNumber count;

  /// 步行规划路线列表
  external JSArray<WalkRoute> routes;
}

extension type WalkRoute._(JSObject _) implements JSObject {
  /// 构造函数
  WalkRoute() : this._(JSObject());

  /// 起点到终点总步行距离，单位：米
  external JSNumber distance;

  /// 步行时间预计，单位：秒
  external JSNumber time;

  /// 路段列表，以道路名称作为分段依据，将整个步行导航方案分隔成若干路段
  external JSArray<WalkStep> steps;
}

extension type WalkStep._(JSObject _) implements JSObject {
  /// 构造函数
  WalkStep() : this._(JSObject());

  /// 步行子路段描述,规则：沿 road步行 distance 米 action，例：”沿北京站街步行351米”
  external JSString instruction;

  /// 步行子路段距离，单位：米
  external JSNumber distance;

  /// 步行子路段预计使用时间，单位：秒
  external JSNumber time;

  /// 步行子路段坐标集合
  external JSArray<LngLat> path;

  /// 道路
  external JSString road;

  /// 本步行子路段完成后动作
  external JSString action;

  /// 步行子路段完成后辅助动作，一般为到达某个公交站点或目的地时返回
  @JS("assist_action")
  external JSString assistAction;
}

/// 公交换乘服务，提供起始点公交路线规划服务，目前公交换乘仅支持同一城市的公交路线规划，跨城市出行规划请参考驾车导航查询。公交换乘查询返回结果整合步行信息，若换乘路段（Segment）换乘类型为地铁 “SUBWAY”，则至少包含一条地铁口信息（SubwayEntrance）。用户可以通过自定义回调函数取回并显示查询结果。若服务请求失败，系统将返回错误信息。
extension type Transfer._(JSObject _) implements JSObject {
  external Transfer(TransferOptions opts);

  /// 根据起点和终点坐标，进行公交换乘查询
  external void search(
    LngLat origin,
    LngLat destination,
    TransferCallback callback,
  );

  /// 根据起点和终点坐标，进行公交换乘查询
  @JS("search")
  external void searchWithPoints(
    JSArray<JSObject> points,
    TransferCallback callback,
  );

  /// 设置公交路径规划出发时间
  external void leaveAt(String time, String date);

  /// 清除结果显示
  external void clear();

  /// 设置公交换乘策略
  external void setPolicy(TransferPolicy policy);

  /// 设置公交换乘查询的城市
  external void setCity(String city);

  /// 设置公交换乘查询的目的地城市
  external void setCityd(String cityd);
}

extension type TransferPolicy._(JSObject _) implements JSObject {
  /// 最快捷模式
  @JS("LEAST_TIME")
  external static TransferPolicy get leastTime;

  /// 最经济模式
  @JS("LEAST_FEE")
  external static TransferPolicy get leastFee;

  /// 最少换乘模式
  @JS("LEAST_TRANSFER")
  external static TransferPolicy get leastTransfer;

  /// 最少步行模式
  @JS("LEAST_WALK")
  external static TransferPolicy get leastWalk;

  /// 最舒适模式
  @JS("MOST_COMFORT")
  external static TransferPolicy get mostComfort;

  /// 不乘地铁模式
  @JS("NO_SUBWAY")
  external static TransferPolicy get noSubway;
}

extension type TransferOptions._(JSObject _) implements JSObject {
  /// 构造函数
  TransferOptions() : this._(JSObject());

  /// AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
  external AMap map;

  /// 公交换乘的城市，支持城市名称、城市区号、电话区号，此项为必填
  external JSString city;

  /// 公交换乘策略strategy
  external JSNumber policy;

  /// 是否计算夜班车，true：计算，false：不计算，默认为false
  external JSBoolean nightflag;

  /// 返回基本地址信息，当取值为：all，返回DriveStep基本信息+DriveStep详细信息，默认值：base
  external JSString extensions;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标，默认值为：false
  external JSBoolean hideMarkers;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;
}

/// Transfer.search 的回调函数扩展类型
extension type TransferCallback(JSFunction _) implements JSFunction {
  external void call(String status, TransferResult result);
}

/// 公交规划结果
extension type TransferResult._(JSObject _) implements JSObject {
  /// 构造函数
  TransferResult() : this._(JSObject());

  /// 返回状态，值为0或1，1：成功；0：失败
  external JSNumber status;

  /// 返回的状态信息，status为0时，info返回错误原；否则返回“OK”
  external JSString info;

  /// 公交换乘方案数目
  external JSNumber count;

  /// 公交换乘信息列表
  external JSArray<TransferRoute> route;
}

/// 公交换乘信息
extension type TransferRoute._(JSObject _) implements JSObject {
  /// 构造函数
  TransferRoute() : this._(JSObject());

  /// 起点坐标
  external LngLat origin;

  /// 终点坐标
  external LngLat destination;

  /// 起点和终点的步行距离，单位：米
  external JSNumber distance;

  /// 出租车费用，单位：元
  @JS("taxi_cost")
  external JSNumber taxiCost;

  /// 公交换乘方案列表
  external JSArray<Transit> transits;
}

extension type Transit._(JSObject _) implements JSObject {
  /// 构造函数
  Transit() : this._(JSObject());

  /// 此换乘方案价格，单位：元
  external JSNumber cost;

  /// 此换乘方案预期时间，单位：秒
  external JSNumber duration;

  /// 是否是夜班车，0：非夜班车；1：夜班车
  external JSNumber nightflag;

  /// 此方案总步行距离，单位：米
  @JS("walking_distance")
  external JSNumber walkingDistance;

  /// 换乘路段列表
  external JSArray<TransitSegment> segments;
}

extension type TransitSegment._(JSObject _) implements JSObject {
  /// 构造函数
  TransitSegment() : this._(JSObject());

  /// 此路段步行导航信息，详见步行方案信息列表
  external TransitWalking walking;

  /// 此路段公交导航信息，详见公交方案信息列表
  external TransitBus bus;

  /// 地铁入口，只在地铁路段有值，详见出入口信息列表
  external TransitEntranceExit entrance;

  /// 地铁出口，只在地铁路段有值，详见出入口信息列表
  external TransitEntranceExit exit;

  /// 乘坐火车的信息，详情见只在地铁路段有值，详见火车换乘信息列表
  external TransitRailway railway;
}

extension type TransitWalking._(JSObject _) implements JSObject {
  /// 构造函数
  TransitWalking() : this._(JSObject());

  /// 起点坐标
  external LngLat origin;

  /// 终点坐标
  external LngLat destination;

  /// 每段线路步行距离，单位：米
  external JSNumber distance;

  /// 步行预计时间，单位：秒
  external JSNumber duration;

  /// 步行路段列表
  external JSArray<TransitWalkingStep> steps;
}

extension type TransitWalkingStep._(JSObject _) implements JSObject {
  /// 构造函数
  TransitWalkingStep() : this._(JSObject());

  /// 此段路的行走介绍
  external JSString instruction;

  /// 路的名字
  external JSString road;

  /// 此段路的距离
  external JSNumber distance;

  /// 此段路预计消耗时间，单位：秒
  external JSNumber duration;

  /// 此段路的坐标
  external JSString polyline;

  /// 步行主要动作
  external JSString action;

  /// 步行辅助动作
  @JS("assistant_action")
  external JSString assistantAction;
}

extension type TransitBus._(JSObject _) implements JSObject {
  /// 构造函数
  TransitBus() : this._(JSObject());

  /// 此段起乘站信息，格式如：中关村
  @JS("departure_stop")
  external BusStop departureStop;

  /// 此段下车站，格式如：中关村
  @JS("arrival_stop")
  external BusStop arrivalStop;

  /// 公交路线名称，格式如：445路(南十里居--地铁望京西站)
  external JSString name;

  /// 公交路线id
  external JSString id;

  /// 公交类型，格式如：地铁线路
  external JSString type;

  /// 公交行驶距离，单位：米
  external JSNumber distance;

  /// 公交预计行驶时间，单位：秒
  external JSNumber duration;

  /// 此路段坐标集，格式为坐标串，如：116.481247,39.990704;116.481270,39.990726
  external Polyline polyline;

  /// 首班车时间，格式如：0600，代表06：00
  @JS("start_time")
  external JSString startTime;

  /// 末班车时间，格式如：2300，代表23：00
  @JS("end_time")
  external JSString endTime;

  /// 此段途经公交站数
  @JS("via_num")
  external JSNumber viaNum;

  /// 此段途经公交站点列表
  @JS("via_stops")
  external BusStop viaStops;
}

extension type BusStop._(JSObject _) implements JSObject {
  /// 构造函数
  BusStop() : this._(JSObject());

  /// 站点名字
  external JSString name;

  /// 站点id
  external JSString id;

  /// 站点经纬度
  external LngLat location;
}

extension type TransitEntranceExit._(JSObject _) implements JSObject {
  /// 构造函数
  TransitEntranceExit() : this._(JSObject());

  /// 入口经纬度
  external LngLat location;
}

extension type TransitRailway._(JSObject _) implements JSObject {
  /// 构造函数
  TransitRailway() : this._(JSObject());

  ///线路id编号
  external JSString id;

  /// 该线路车段耗时
  external JSNumber time;

  /// 线路名称
  external JSString name;

  /// 线路车次号
  external JSString trip;

  /// 该item换乘段的行车总距离
  external JSNumber distance;

  /// 线路车次类型
  /// 2010:普客火车
  /// 2015:T字头的特快火车
  /// 2011:G字头的高铁火车
  /// 2016:K字头的快车火车
  /// 2012:D字头的动车火车
  /// 2017:L字头，Y字头的临时火车
  /// 2013:C字头的城际火车
  /// 2018:S字头的郊区线火车
  /// 2014:Z字头的直达特快火车
  external JSString type;

  /// 火车始发站信息
  @JS("departure_stop")
  external RailwayStop departureStop;

  /// 火车到站信息
  @JS("arrival_stop")
  external RailwayStop arrivalStop;

  /// 途径站点信息，extensions=all时返回
  @JS("via_stop")
  external RailwayStop viaStop;

  /// 聚合的备选方案，extensions=all时返回
  external RailwayStop alters;

  /// 仓位及价格信息
  external RailwaySpace spaces;
}

/// 火车站信息
extension type RailwayStop._(JSObject _) implements JSObject {
  /// 构造函数
  RailwayStop() : this._(JSObject());

  /// 火车站点ID
  external JSString id;

  /// 火车站点名称
  external JSString name;

  /// 火车站点经纬度
  external LngLat location;

  /// 火车站点所在城市的adcode
  external JSString adcode;

  /// 火车点发车时间
  external JSString time;

  /// 是否始发站，1表示为始发站，0表示非始发站
  external JSNumber start;

  /// 是否为终点站，1表示为终点站，0表示非终点站
  external JSNumber end;

  /// 途径站点的停靠时间，单位：分钟
  external JSNumber wait;
}

extension type RailwaySpace._(JSObject _) implements JSObject {
  /// 构造函数
  RailwaySpace() : this._(JSObject());

  /// 仓位编码
  /// 0:不分仓位级别
  /// 20:火车高级软卧下铺
  /// 9:特等座
  /// 21:火车商务座
  /// 10:火车硬座
  /// 22:长途汽车座席
  /// 11:火车软座
  /// 23:长途汽车卧席上铺
  /// 12:火车软座1等座
  /// 24:长途汽车卧席中铺
  /// 13:火车软座2等座
  /// 25:长途汽车卧席下铺
  /// 14:火车硬卧上铺
  /// 30:飞机经济舱
  /// 15:火车硬卧中铺
  /// 31:飞机商务舱
  /// 16:火车硬卧下铺
  /// 40:客轮经济舱
  /// 17:火车软卧上铺
  /// 41:客轮3等舱
  /// 18:火车软卧下铺
  /// 42:客轮2等舱
  /// 19:火车高级软卧上铺
  /// 43:客轮豪华舱
  external JSString code;

  /// 仓位费用
  external JSNumber cost;
}

/// 骑行路线规划服务，提供起、终点坐标的驾车导航路线查询功能
extension type Riding._(JSObject _) implements JSObject {
  /// 构造函数
  external Riding(RidingOptions opts);

  /// 清除搜索的结果
  external void clear();

  /// 骑行路线规划策略，可选值为： 0：推荐路线及最快路线综合 1：推荐路线 2：最快路线
  external void setPolicy(num policy);

  /// 根据起点、终点坐标，实现骑行路线规划
  external void search(
    LngLat origin,
    LngLat destination,
    RidingCallback callback,
  );

  /// 根据起点、终点名称，实现骑行路线规划
  @JS("search")
  external void searchWithPoints(
    JSArray<JSObject> points,
    RidingCallback callback,
  );
}

extension type RidingOptions._(JSObject _) implements JSObject {
  /// 构造函数
  RidingOptions() : this._(JSObject());

  /// AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
  external AMap map;

  /// 骑行路线规划策略；可选值为： 0：推荐路线及最快路线综合 1：推荐路线 2：最快路线，默认值：0
  external JSNumber policy;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标，默认值为：false 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息。
  external JSBoolean hideMarkers;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;
}

/// Riding.search回调函数的扩展类型
extension type RidingCallback(JSFunction _) implements JSFunction {
  external void call(String status, RidingResult result);
}

extension type RidingResult._(JSObject _) implements JSObject {
  /// 构造函数
  RidingResult() : this._(JSObject());

  /// 返回状态编码，0表示成功
  external JSNumber errcode;

  /// 返回状态说明。成功时返回OK，其他错误返回错误信息。
  external JSString errmsg;

  /// 返回错误详细原因
  external JSString errdetail;

  /// 返回结果数据
  external RidingResultData data;
}

extension type RidingResultData._(JSObject _) implements JSObject {
  /// 构造函数
  RidingResultData() : this._(JSObject());

  /// 路径规划方案，列表
  external JSArray<RidingResultPath> paths;

  /// 不同时间的规划以及信息列表
  @JS("time_infos")
  external JSArray<RidingResultTimeInfo> timeInfos;
}

extension type RidingResultPath._(JSObject _) implements JSObject {
  /// 构造函数
  RidingResultPath() : this._(JSObject());

  /// 行驶距离，单位：米
  external JSNumber distance;

  /// 红绿灯个数
  @JS("traffic_lights")
  external JSNumber trafficLights;

  /// 导航路段，列表
  external JSArray<RidingResultPathStep> steps;
}

extension type RidingResultPathStep._(JSObject _) implements JSObject {
  /// 构造函数
  RidingResultPathStep() : this._(JSObject());

  /// 途径区域的区域代码
  external JSString adcode;

  /// 道路名称
  external JSString road;

  /// 路段距离
  external JSNumber distance;

  /// 道路属性字段，是否收费，0：不收费，1：收费。
  external JSNumber toll;

  /// 路段坐标点串
  external JSArray<LngLat> polyline;
}

extension type RidingResultTimeInfo._(JSObject _) implements JSObject {
  /// 构造函数
  RidingResultTimeInfo() : this._(JSObject());

  /// 出发时间，Unix时间戳精确到毫秒
  external JSString starttime;

  /// 路线列表
  external JSArray<RidingResultTimeInfoElement> elements;
}

extension type RidingResultTimeInfoElement._(JSObject _) implements JSObject {
  /// 构造函数
  RidingResultTimeInfoElement() : this._(JSObject());

  /// 对应的路线
  external JSNumber pathindex;

  /// 总时长，单位：分钟
  external JSNumber duration;

  /// 总收费，单位：元
  external JSNumber tolls;

  /// 0：代表限行已规避或未限行，即该路线没有限行路段，1：代表限行无法规避，即该线路有限行路段
  external JSNumber restriction;

  /// 路况信息
  external JSArray<RidingTMC> tmcs;
}

extension type RidingTMC._(JSObject _) implements JSObject {
  /// 构造函数
  RidingTMC() : this._(JSObject());

  /// 路况状态
  external JSNumber status;

  /// 路段坐标点
  external JSArray<LngLat> polyline;
}

extension type DragRoute._(JSObject _) implements JSObject {
  /// 构造函数
  external DragRoute(
    AMap map,
    JSArray<LngLat> path,
    String policy,
    DragRouteOptions opts,
  );

  /// 开始路径导航。支持鼠标拖拽导航路径节点，更改途经点时，系统实时重新计算并显示导航路径
  external void search();

  /// 返回除了起点和终点之外的所有点返回导航的所有途经点，即所有途径点的坐标数组
  external JSArray<LngLat> getWays();

  /// 返回当前导航路径，即导航路径的经纬度坐标数组
  external JSArray<LngLat> getRoute();

  /// 销毁拖拽导航插件。
  external void destroy();
}

extension type DragRouteOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DragRouteOptions() : this._(JSObject());

  /// 设置拖拽路线插件的路线属性对象，包括线样式、宽度、颜色等，参考 PolylineOptions 列表
  external PolylineOptions? polyOption;

  /// 设置拖拽路线插件起点点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions 列表
  external MarkerOptions? startMarkerOptions;

  /// 设置拖拽路线插件途经点点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions 列表
  external MarkerOptions? midMarkerOptions;

  /// 设置拖拽路线插件终点点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions 列表
  external MarkerOptions? endMarkerOptions;

  /// 设置显示实时路况信息，true：路线中显示实时路况信息，false：关闭实时路况信息。 默认值：true
  external JSBoolean showTraffic;
}

/// 可拖拽货车路径规划
extension type DragRouteTruck._(JSObject _) implements JSObject {
  /// 构造函数
  external DragRouteTruck(AMap map, DragRouteTruckOptions opts);

  /// 设置避让区域，最大支持三个避让区域，参数为LngLat的二维数组
  external void setAvoidPolygons(JSArray<JSArray<LngLat>> areas);

  /// 清除避让区域
  external void clearAvoidPolygons();

  /// 获取避让区域，返回LngLat的二维数组
  external JSArray<JSArray<LngLat>> getAvoidPolygons();

  /// 开始路径导航。支持鼠标拖拽导航路径节点，更改途经点时，系统实时重新计算并显示导航路径
  external void search(JSArray<LngLat> locations);

  /// 手动更新路径。设置 autoRefresh 为 false 之后，通过调用这个方法来手动更新路径规划
  external void updatePath();

  /// 返回除了起点和终点之外的所有点返回导航的所有途经点，即所有途径点的坐标数组
  external JSArray<LngLat> getWays();

  /// 返回当前导航路径，即导航路径的经纬度坐标数组
  external JSArray<LngLat> getRoute();

  /// 销毁拖拽导航插件
  external void destroy();

  /// 修改配置项
  external void setOption(DragRouteTruckUpdateOptions opts);
}

extension type DragRouteTruckOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DragRouteTruckOptions() : this._(JSObject());

  /// 设置拖拽路线插件的路线属性对象，包括线样式、宽度、颜色等，参考 PolylineOptions 列表
  external PolylineOptions? polyOption;

  /// 设置拖拽路线插件起点点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions 列表
  external MarkerOptions? startMarkerOptions;

  /// 设置拖拽路线插件途经点点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions 列表
  external MarkerOptions? midMarkerOptions;

  /// 设置拖拽路线插件终点点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions 列表
  external MarkerOptions? endMarkerOptions;

  /// 设置显示实时路况信息，true：路线中显示实时路况信息，false：关闭实时路况信息。 默认值：true
  external JSBoolean showTraffic;

  /// 驾车路线规划策略 1躲避拥堵 2不走高速 3避免收费 4躲避拥堵且不走高速 5避免收费且不走高速 6躲避拥堵且避免收费 7躲避拥堵且避免收费且不走高速 8高速优先 9躲避拥堵且高速优先
  external JSNumber? policy;

  /// 车型大小，必填，1-4分别对应小型至大型
  external JSNumber size;

  /// 宽度，缺省2.5米
  external JSNumber? width;

  /// 高度,缺省1.6米
  external JSNumber? height;

  /// 载重,缺省0.9t
  external JSNumber? load;

  /// 自重，缺省10t
  external JSNumber? weight;

  /// 轴数，缺省2轴
  external JSNumber? axlesNum;

  /// 返回基本地址信息，当取值为：all，返回DriveStep基本信息+DriveStep详细信息，默认值：base
  external JSString extensions;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标，默认值为：false
  external JSBoolean hideMarkers;

  /// 车牌省份的汉字缩写，用于判断是否限行，与number属性组合使用，可选。例如：京
  external JSString? province;

  /// 除省份之外车牌的字母和数字，用于判断限行相关，与province属性组合使用，可选。例如:NH1N11
  external JSString? number;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;

  /// 车辆类型 0：普通货车（默认值）1：纯电动货车 2：插电混动货车
  external JSNumber cartype;

  /// 是否返回路线数据 当取值为1时，steps与tmcs下的polyline数据会正常返回；当取值为0时，steps与tmcs下的polyline数据为空。
  external JSNumber showpolyline;

  /// 是否返回steps字段内容 当取值为0时，steps字段内容正常返回；当取值为1时，steps字段内容为空，默认为1
  external JSNumber nosteps;

  /// 是否拖拽后自动更新驾车轨迹，默认为true
  external JSBoolean autoRefresh;

  /// 拖拽后自动更新的延迟时间，默认为300
  external JSNumber refreshTime;

  /// 货车接口版本支持 'v4','v5'，默认为‘v4’
  external JSNumber apiVersion;

  /// 仅 v5货车接口版本支持
  /// 1、具体可指定返回的字段类请见下方返回结果说明中的“show_fields”内字段类型；
  /// 2、多个字段间采用“,”进行分割；
  /// 3、show_fields未设置时，只返回基础信息类内字段；
  /// 4、目前取值支持以下四种："toll_gate"，"cameras"，"general"，"incident"； "toll_gate"：收费站信息 "cameras"：电子眼信息 "general"：交通设施信息 "incident"：交通事件信息
  external JSString? showFields;
}

extension type DragRouteTruckUpdateOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DragRouteTruckUpdateOptions() : this._(JSObject());

  /// 驾车路线规划策略 1躲避拥堵 2不走高速 3避免收费 4躲避拥堵且不走高速 5避免收费且不走高速 6躲避拥堵且避免收费 7躲避拥堵且避免收费且不走高速 8高速优先 9躲避拥堵且高速优先
  external JSNumber? policy;

  /// 车型大小，必填，1-4分别对应小型至大型
  external JSNumber size;

  /// 宽度，缺省2.5米
  external JSNumber? width;

  /// 高度,缺省1.6米
  external JSNumber? height;

  /// 载重,缺省0.9t
  external JSNumber? load;

  /// 自重，缺省10t
  external JSNumber? weight;

  /// 轴数，缺省2轴
  external JSNumber? axlesNum;

  /// 返回基本地址信息\n当取值为：all，返回DriveStep基本信息+DriveStep详细信息，默认值：base
  external JSString extensions;

  /// 结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
  external HTMLElement? panel;

  /// 设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标，默认值为：false
  external JSBoolean hideMarkers;

  /// 设置是否显示实时路况信息，默认设置为true。 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息
  external JSBoolean? showTraffic;

  /// 车牌省份的汉字缩写，用于判断是否限行，与number属性组合使用，可选。例如：京
  external JSString? province;

  /// 除省份之外车牌的字母和数字，用于判断限行相关，与province属性组合使用，可选。例如:NH1N11
  external JSString? number;

  /// 使用map属性时，绘制的规划线路是否显示描边。缺省为true
  external JSBoolean? isOutline;

  /// 使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
  external JSString? outlineColor;

  /// 用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
  external JSBoolean? autoFitView;

  /// 车辆类型 0：普通货车（默认值）1：纯电动货车 2：插电混动货车
  external JSNumber cartype;

  /// 是否返回路线数据 当取值为1时，steps与tmcs下的polyline数据会正常返回；当取值为0时，steps与tmcs下的polyline数据为空。默认为1
  external JSNumber showpolyline;

  /// 是否返回steps字段内容 当取值为0时，steps字段内容正常返回；当取值为1时，steps字段内容为空。默认为1
  external JSNumber nosteps;
}

/// 轨迹纠偏服务插件。用于将一组带方向的、可能偏离道路的经纬度轨迹，纠正为准确沿着道路的一条经纬度路径。
extension type GraspRoad._(JSObject _) implements JSObject {
  /// 构造函数
  external GraspRoad();

  /// 用于驾车轨迹的纠偏
  external void driving(
    JSArray<OriginPath> originPath,
    GraspRoadCallback callback,
  );
}

extension type OriginPath._(JSObject _) implements JSObject {
  /// 构造函数
  OriginPath() : this._(JSObject());

  /// 经度
  external JSNumber x;

  /// 纬度
  external JSNumber y;

  /// 与正北方向的顺时针夹角， [ 0, 360 ]
  external JSNumber ag;

  /// 轨迹点采集的时间，以s为单位 OriginPath数组第一个元素的tm值为从1970年开始的unix的时间戳，精确到秒。 其余元素的tm值为当前采集点的时间减去第一个元素的采集时间的差值
  external JSNumber tm;

  /// 轨迹点的速度，单位 km/h，小数、整数均可
  external JSNumber sp;
}

/// 轨迹纠偏回调函数扩展类型
extension type GraspRoadCallback(JSFunction _) implements JSFunction {
  external void call(JSObject err, GraspedPath graspedPath);
}

extension type GraspedPath._(JSObject _) implements JSObject {
  /// 构造函数
  GraspedPath() : this._(JSObject());

  /// 30001错误表示抓路失败。当传入点数较少或较稀疏时，可能会导致抓路失败。
  external JSNumber errcode;

  external JSString errdetail;

  external JSString errmsg;

  external GraspedPathData data;
}

extension type GraspedPathData._(JSObject _) implements JSObject {
  /// 构造函数
  GraspedPathData() : this._(JSObject());

  /// 总距离
  external JSNumber distance;

  /// 返回坐标合集
  external JSArray<LngLat> points;
}

/// ArrivalRange根据输入的起点坐标和设定的时间范围，可以计算出用户在你设定的时间段内按公交出行方式，可以到达的距离范围。
/// 用户可以通过自定义回调函数取回并显示查询结果。若服务请求失败，系统将返回错误信息。
extension type ArrivalRange._(JSObject _) implements JSObject {
  /// 构造函数
  ArrivalRange(ArrivalRangeOptions opts) : this._(opts);

  /// 计算某个时间段内用户通过公交出行可到达的距离范围
  external void search(
    LngLat origin,
    num time,
    ArrivalSearchCallBack callback,
    ArrivalRangeOptions opts,
  );
}

/// 搜索可到达的距离范围回调函数扩展类型
extension type ArrivalSearchCallBack(JSFunction _) implements JSFunction {
  external void call(String status, ArrivalRangeResult result);
}

extension type ArrivalRangeOptions._(JSObject _) implements JSObject {
  /// 构造函数
  ArrivalRangeOptions() : this._(JSObject());

  /// 公交出行策略,可选为：只坐地铁：SUBWAY, 只坐公交：BUS，缺省时为公交+地铁,BUS,SUBWAY
  external JSString policy;

  /// 结果返回样式：polygon：返回多边形边界值，coverage：判断设定的终点坐标是否在到达圈范围内
  external JSString resultType;

  /// 选择一个想到达的目的地坐标，最多支持5个目的地坐标
  external JSArray<LngLat> destination;
}

extension type ArrivalRangeResult._(JSObject _) implements JSObject {
  /// 构造函数
  ArrivalRangeResult() : this._(JSObject());

  /// 查询状态说明
  external JSString info;

  /// 输出方式选择polygon时，返回到达圈边界坐标点
  external JSArray bounds;

  /// 输出方式选择coverage时，返回提供的终点坐标是否在到达圈内
  external JSBoolean inRange;
}
