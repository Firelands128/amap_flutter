@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

/// 切片图层类，该类为基础类。
@JS()
class TileLayer extends Layer {
  external TileLayer(TileLayerOptions opts);

  /// 设置图层的取图地址
  external void setTileUrl(String url);

  /// 重新加载图层资源，重新渲染
  external void reload();

  /// 获取图层参数信息
  external Object getOptions();

  /// 获取图层层级
  external num getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(num zIndex);

  /// 获取图层透明度
  external num getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(num opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-30]
  external List<num> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(List<num> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();
}

@JS()
@anonymous
class TileLayerOptions {
  /// 构造函数
  external TileLayerOptions();

  /// 切片取图地址 如：' https://abc{0,1,2,3}.amap.com/tile?x=[x]&y=[y]&z=[z] ' [x] 、 [y] 、 [z] 分别替代切片的xyz。
  external String tileUrl;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external List<num> zooms;

  /// 数据支持的缩放级别范围，默认范围 [2-30]
  external List<num> dataZooms;

  /// 透明度，默认 1
  external num opacity;

  /// 是否显示，默认 true
  external bool visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external num zIndex;

  /// 切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
  external num tileSize;
}

/// 实时交通图层类，继承自TileLayer
@JS("TileLayer.Traffic")
class Traffic extends TileLayer {
  external Traffic(TrafficLayerOptions opts);

  /// 停止自动更新数据
  external void stopFresh();
}

@JS()
@anonymous
class TrafficLayerOptions {
  /// 构造函数
  external TrafficLayerOptions();

  /// 是否自动更新数据，默认开启
  external bool autoRefresh;

  /// 自动更新数据的间隔毫秒数，默认 180ms
  external num interval;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external List<num> zooms;

  /// 透明度，默认 1
  external num opacity;

  /// 是否显示，默认 true
  external bool visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external num zIndex;

  /// 切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
  external num tileSize;
}

/// 卫星图层类，继承自 TileLayer
@JS("TileLayer.Satellite")
class Satellite extends TileLayer {
  external Satellite(SatelliteLayerOptions opts);

  /// 销毁图层
  external void destroy();
}

@JS()
@anonymous
class SatelliteLayerOptions {
  /// 构造函数
  external SatelliteLayerOptions();

  /// 支持的缩放级别范围，默认范围 [2-30]
  external List<num> zooms;

  /// 透明度，默认 1
  external num opacity;

  /// 是否显示，默认 true
  external bool visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external num zIndex;

  /// 切片大小，取值：256，表示切片大小为256 256，128，表示切片大小为128 128，64，表示切片大小为64*64。默认值为256
  external num tileSize;
}

/// 路网图层，展示道路信息
@JS("TileLayer.RoadNet")
class RoadNet extends TileLayer {
  external RoadNet(RoadnetLayerOptions opts);

  /// 销毁图层
  external void destroy();
}

@JS()
@anonymous
class RoadnetLayerOptions {
  /// 构造函数
  external RoadnetLayerOptions();

  /// 支持的缩放级别范围，默认范围 [2-30]
  external List<num> zooms;

  /// 透明度，默认 1
  external num opacity;

  /// 是否显示，默认 true
  external bool visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external num zIndex;

  /// 切片大小，取值：256，表示切片大小为256 256，128，表示切片大小为128 128，64，表示切片大小为64*64。默认值为256
  external num tileSize;
}

/// 建筑楼块 3D 图层
@JS()
class Buildings extends TileLayer {
  external Buildings(BuildingLayerOptions opts);

  /// 设置楼块图层样式
  external setStyle(BuildingStyleOptions styleOpts);

  /// 销毁图层
  external void destroy();
}

@JS()
@anonymous
class BuildingLayerOptions {
  /// 构造函数
  external BuildingLayerOptions();

  /// 楼块侧面颜色，支持 rgba、rgb、十六进制等
  external String wallColor;

  /// 楼块顶面颜色，支持 rgba、rgb、十六进制等
  external String roofColor;

  /// 楼块的高度系数因子，默认为 1，也就是正常高度
  external num heightFactor;

  /// 楼块的围栏和样式设置
  external BuildingStyleOptions styleOpts;

  /// 图层缩放等级范围，默认 [2, 20]
  external List<num> zooms;

  /// 图层透明度，默认为 1
  external num opacity;

  /// 图层是否可见，默认为 true
  external bool visible;

  /// 图层的层级，默认为 11
  external num zIndex;
}

@JS()
@anonymous
class BuildingStyleOptions {
  /// 构造函数
  external BuildingStyleOptions();

  /// 是否隐藏围栏之外的楼块
  external bool hideWithoutStyle;

  /// 围栏信息数组
  external List<Area> areas;
}

@JS()
@anonymous
class Area {
  /// 构造函数
  external Area();

  /// 是否隐藏围栏之外的楼块
  external bool rejectTexture;

  /// 围栏信息数组
  external bool visible;

  /// 围栏经纬度列表
  external List<num> path;

  /// 围栏区域内楼块顶面颜色，支持 rgba、rgb、十六进制等
  external String color1;

  /// 围栏区域内楼块侧面颜色，支持 rgba、rgb、十六进制等
  external String color2;
}

@JS()
class DistrictLayer {
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
  external String getDistricts();

  /// 获取 adcodes
  external void setStyles(DistrictLayerStyle styles);

  /// 获取样式信息
  external DistrictLayerStyle getStyles();

  /// 设置 adcodes 值
  external void setAdcode(String adcodes);

  /// 获取图层参数信息
  external Object getOptions();

  /// 获取图层层级
  external num getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(num zIndex);

  /// 获取图层透明度
  external num getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(num opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-20]
  external List<num> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(List<num> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();
}

@JS()
@anonymous
class DistrictLayerOptions {
  /// 构造函数
  external DistrictLayerOptions();

  /// 行政区的编码 adcode与省市行政区对照表
  external String adcode;

  /// 设定显示的国家 SOC 国家代码、名称、Bounds对照表下载，默认为'CHN'
  @JS("SOC")
  external String soc;

  /// 设定数据的层级深度，depth为0的时候只显示国家面，depth为1的时候显示省级， 当国家为中国时设置depth为2的可以显示市一级，默认为0
  external num depth;

  /// 图层的层级，默认为 80
  external num zIndex;

  /// 图层透明度，默认为 1
  external num opacity;

  /// 图层是否可见，默认为 true
  external bool visible;

  /// 图层缩放等级范围，默认 [2, 20]
  external List<num> zooms;

  /// 为简易行政区图设定各面的填充颜色和描边颜色
  external DistrictLayerStyle styles;
}

@JS()
@anonymous
class DistrictLayerStyle {
  /// 构造函数
  external DistrictLayerStyle();

  /// 描边线宽，默认1
  @JS("stroke-width")
  external num strokeWidth;

  /// 图层中每个区域层级，数值越大，层级越高，默认为0
  external num zIndex;

  /// 海岸线颜色，默认为[0.18,0.63,0.94,1]
  @JS("coastline-stroke")
  external List<String> coastlineStroke;

  /// 国境线颜色，默认为[0.35,0.35,0.35,1]
  @JS("nation-stroke")
  external List<String> nationStroke;

  /// 省界颜色，默认为[0.5,0.5,0.5,1]
  @JS("province-stroke")
  external List<String> provinceStroke;

  /// 城市界颜色，默认为[0.7,0.7,0.7,1]
  @JS("city-stroke")
  external List<String> cityStroke;

  /// 区/县界颜色，默认为[0.85,0.85,0.85,1]
  @JS("county-stroke")
  external List<String> countyStroke;

  /// 填充色，默认为[1,1,1,1]
  external List<String> fill;
}

/// 室内图层，用于在适当级别展示室内地图，并提供显示商铺tip、切换楼层等功能。
@JS()
class IndoorMap extends TileLayer {
  external IndoorMap(IndoorMapOptions opts);

  /// 显示指定 POI 的室内地图
  external showIndoorMap(String indoorid, num floor, String shopid);

  /// 显示指定的楼层
  external showFloor(num floor);

  /// 设置显示室内图层的地图对象
  external setMap(AMap map);

  /// 显示楼层切换控件
  external showFloorBar();

  /// 隐藏楼层切换控件
  external hideFloorBar();

  /// 显示室内图层上的标注
  external showLabels();

  /// 隐藏室内图层上的标注
  external hideLabels();

  /// 隐藏室内图层上的标注
  external getSelectedBuildingId();

  /// 获取被选中的室内地图的一些基本信息，包含名称、当前楼层、所有楼层信息、POIID等
  external getSelectedBuilding();
}

@JS()
@anonymous
class IndoorMapOptions {
  /// 构造函数
  external IndoorMapOptions();

  /// 室内图层叠加的顺序值
  external num zIndex;

  /// 图层的透明度，取值范围 [0,1]
  external num opacity;

  /// 指定鼠标悬停到店铺面时的鼠标样式
  external String cursor;

  /// 是否隐藏楼层切换控件，默认值：false
  external bool hideFloorBar;
}
