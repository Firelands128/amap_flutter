@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// 切片图层类，该类为基础类。
extension type TileLayer._(JSObject _) implements Layer {
  /// 构造函数
  external TileLayer(TileLayerOptions opts);

  /// 设置图层的取图地址
  external void setTileUrl(String url);

  /// 重新加载图层资源，重新渲染
  external void reload();

  /// 获取图层参数信息
  external JSObject getOptions();

  /// 获取图层层级
  external JSNumber getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(num zIndex);

  /// 获取图层透明度
  external JSNumber getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(num opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-30]
  external JSArray<JSNumber> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();
}

extension type TileLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  TileLayerOptions() : this._(JSObject());

  /// 切片取图地址 如：' https://abc{0,1,2,3}.amap.com/tile?x=[x]&y=[y]&z=[z] ' [x] 、 [y] 、 [z] 分别替代切片的xyz。
  external JSString tileUrl;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> zooms;

  /// 数据支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> dataZooms;

  /// 透明度，默认 1
  external JSNumber opacity;

  /// 是否显示，默认 true
  external JSBoolean visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external JSNumber zIndex;

  /// 切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
  external JSNumber tileSize;
}

/// 实时交通图层类，继承自TileLayer
@JS("TileLayer.Traffic")
extension type Traffic._(JSObject _) implements TileLayer {
  /// 构造函数
  external Traffic(TrafficLayerOptions opts);

  /// 停止自动更新数据
  external void stopFresh();
}

extension type TrafficLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  TrafficLayerOptions() : this._(JSObject());

  /// 是否自动更新数据，默认开启
  external JSBoolean autoRefresh;

  /// 自动更新数据的间隔毫秒数，默认 180ms
  external JSNumber interval;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> zooms;

  /// 透明度，默认 1
  external JSNumber opacity;

  /// 是否显示，默认 true
  external JSBoolean visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external JSNumber zIndex;

  /// 切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
  external JSNumber tileSize;
}

/// 卫星图层类，继承自 TileLayer
@JS("TileLayer.Satellite")
extension type Satellite._(JSObject _) implements TileLayer {
  /// 构造函数
  external Satellite(SatelliteLayerOptions opts);

  /// 销毁图层
  external void destroy();
}

extension type SatelliteLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  SatelliteLayerOptions() : this._(JSObject());

  /// 支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> zooms;

  /// 透明度，默认 1
  external JSNumber opacity;

  /// 是否显示，默认 true
  external JSBoolean visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external JSNumber zIndex;

  /// 切片大小，取值：256，表示切片大小为256 256，128，表示切片大小为128 128，64，表示切片大小为64*64。默认值为256
  external JSNumber tileSize;
}

/// 路网图层，展示道路信息
@JS("TileLayer.RoadNet")
extension type RoadNet._(JSObject _) implements TileLayer {
  /// 构造函数
  external RoadNet(RoadnetLayerOptions opts);

  /// 销毁图层
  external void destroy();
}

extension type RoadnetLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  RoadnetLayerOptions() : this._(JSObject());

  /// 支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> zooms;

  /// 透明度，默认 1
  external JSNumber opacity;

  /// 是否显示，默认 true
  external JSBoolean visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external JSNumber zIndex;

  /// 切片大小，取值：256，表示切片大小为256 256，128，表示切片大小为128 128，64，表示切片大小为64*64。默认值为256
  external JSNumber tileSize;
}

/// 建筑楼块 3D 图层
extension type Buildings._(JSObject _) implements TileLayer {
  /// 构造函数
  external Buildings(BuildingLayerOptions opts);

  /// 设置楼块图层样式
  external void setStyle(BuildingStyleOptions styleOpts);

  /// 销毁图层
  external void destroy();
}

extension type BuildingLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  BuildingLayerOptions() : this._(JSObject());

  /// 楼块侧面颜色，支持 rgba、rgb、十六进制等
  external JSString wallColor;

  /// 楼块顶面颜色，支持 rgba、rgb、十六进制等
  external JSString roofColor;

  /// 楼块的高度系数因子，默认为 1，也就是正常高度
  external JSNumber heightFactor;

  /// 楼块的围栏和样式设置
  external BuildingStyleOptions styleOpts;

  /// 图层缩放等级范围，默认 [2, 20]
  external JSArray<JSNumber> zooms;

  /// 图层透明度，默认为 1
  external JSNumber opacity;

  /// 图层是否可见，默认为 true
  external JSBoolean visible;

  /// 图层的层级，默认为 11
  external JSNumber zIndex;
}

extension type BuildingStyleOptions._(JSObject _) implements JSObject {
  /// 构造函数
  BuildingStyleOptions() : this._(JSObject());

  /// 是否隐藏围栏之外的楼块
  external JSBoolean hideWithoutStyle;

  /// 围栏信息数组
  external JSArray<Area> areas;
}

extension type Area._(JSObject _) implements JSObject {
  /// 构造函数
  Area() : this._(JSObject());

  /// 是否隐藏围栏之外的楼块
  external JSBoolean rejectTexture;

  /// 围栏信息数组
  external JSBoolean visible;

  /// 围栏经纬度列表
  external JSArray<JSNumber> path;

  /// 围栏区域内楼块顶面颜色，支持 rgba、rgb、十六进制等
  external JSString color1;

  /// 围栏区域内楼块侧面颜色，支持 rgba、rgb、十六进制等
  external JSString color2;
}

extension type DistrictLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external DistrictLayer(DistrictLayerOptions opts);

  /// 世界级行政区
  @JS("World")
  external static DistrictLayer world(DistrictLayerOptions opts);

  /// 国家级行政区
  @JS("Country")
  external static DistrictLayer country(DistrictLayerOptions opts);

  /// 省份级行政区,只支持中国区域
  @JS("Province")
  external static DistrictLayer province(DistrictLayerOptions opts);

  /// 设定显示的国家 SOC
  external void setSOC(@JS("SOC") String soc);

  /// 设置 adcodes 值
  external void setDistricts(String adcodes);

  /// 获取 adcodes
  external JSString getDistricts();

  /// 获取 adcodes
  external void setStyles(DistrictLayerStyle styles);

  /// 获取样式信息
  external DistrictLayerStyle getStyles();

  /// 设置 adcodes 值
  external void setAdcode(String adcodes);

  /// 获取图层参数信息
  external JSObject getOptions();

  /// 获取图层层级
  external JSNumber getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(num zIndex);

  /// 获取图层透明度
  external JSNumber getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(num opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-20]
  external JSArray<JSNumber> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();
}

extension type DistrictLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DistrictLayerOptions() : this._(JSObject());

  /// 行政区的编码 adcode与省市行政区对照表
  external JSString adcode;

  /// 设定显示的国家 SOC 国家代码、名称、Bounds对照表下载，默认为'CHN'
  @JS("SOC")
  external JSString soc;

  /// 设定数据的层级深度，depth为0的时候只显示国家面，depth为1的时候显示省级， 当国家为中国时设置depth为2的可以显示市一级，默认为0
  external JSNumber depth;

  /// 图层的层级，默认为 80
  external JSNumber zIndex;

  /// 图层透明度，默认为 1
  external JSNumber opacity;

  /// 图层是否可见，默认为 true
  external JSBoolean visible;

  /// 图层缩放等级范围，默认 [2, 20]
  external JSArray<JSNumber> zooms;

  /// 为简易行政区图设定各面的填充颜色和描边颜色
  external DistrictLayerStyle styles;
}

extension type DistrictLayerStyle._(JSObject _) implements JSObject {
  /// 构造函数
  DistrictLayerStyle() : this._(JSObject());

  /// 描边线宽，默认1
  @JS("stroke-width")
  external JSNumber strokeWidth;

  /// 图层中每个区域层级，数值越大，层级越高，默认为0
  external JSNumber zIndex;

  /// 海岸线颜色，默认为[0.18,0.63,0.94,1]
  @JS("coastline-stroke")
  external JSArray<JSString> coastlineStroke;

  /// 国境线颜色，默认为[0.35,0.35,0.35,1]
  @JS("nation-stroke")
  external JSArray<JSString> nationStroke;

  /// 省界颜色，默认为[0.5,0.5,0.5,1]
  @JS("province-stroke")
  external JSArray<JSString> provinceStroke;

  /// 城市界颜色，默认为[0.7,0.7,0.7,1]
  @JS("city-stroke")
  external JSArray<JSString> cityStroke;

  /// 区/县界颜色，默认为[0.85,0.85,0.85,1]
  @JS("county-stroke")
  external JSArray<JSString> countyStroke;

  /// 填充色，默认为[1,1,1,1]
  external JSArray<JSString> fill;
}

/// 室内图层，用于在适当级别展示室内地图，并提供显示商铺tip、切换楼层等功能。
extension type IndoorMap._(JSObject _) implements TileLayer {
  external IndoorMap(IndoorMapOptions opts);

  /// 显示指定 POI 的室内地图
  external void showIndoorMap(String indoorid, num floor, String shopid);

  /// 显示指定的楼层
  external void showFloor(num floor);

  /// 设置显示室内图层的地图对象
  external void setMap(AMap map);

  /// 显示楼层切换控件
  external void showFloorBar();

  /// 隐藏楼层切换控件
  external void hideFloorBar();

  /// 显示室内图层上的标注
  external void showLabels();

  /// 隐藏室内图层上的标注
  external void hideLabels();

  /// 获取被选中室内的POIID
  external JSString getSelectedBuildingId();

  /// 获取被选中的室内地图的一些基本信息，包含名称、当前楼层、所有楼层信息、POIID等
  external JSObject getSelectedBuilding();
}

extension type IndoorMapOptions._(JSObject _) implements JSObject {
  /// 构造函数
  IndoorMapOptions() : this._(JSObject());

  /// 室内图层叠加的顺序值
  external JSNumber zIndex;

  /// 图层的透明度，取值范围 [0,1]
  external JSNumber opacity;

  /// 指定鼠标悬停到店铺面时的鼠标样式
  external JSString cursor;

  /// 是否隐藏楼层切换控件，默认值：false
  external JSBoolean hideFloorBar;
}
