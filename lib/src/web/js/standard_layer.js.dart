@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

/// 用于加载OGC标准的WMS地图服务的一种图层类，仅支持EPSG3857坐标系统的WMS图层。
@JS("TileLayer.WMS")
class WMS {
  /// 构造函数
  external WMS(WMSLayerOptions opts);

  /// 设置OGC标准的WMS getMap接口的参数，包括VERSION、LAYERS、STYLES、FORMAT、TRANSPARENT等
  external void setParams(Object params);

  /// 获取 OGC 标准的 WMS getMap 接口的参数
  external Object getParams();

  /// 设置 WMS 服务地址
  external void setUrl(String url);

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
class WMSLayerOptions {
  /// 构造函数
  external WMSLayerOptions();

  /// wmts服务的url地址，如：' https://services.arcgisonline.com/arcgis/rest/services/'+ 'Demographics/USA_Population_Density/MapServer/WMTS/'
  external String url;

  /// 地图级别切换时，不同级别的图片是否进行混合，如图层的图像内容为部分透明请设置为false
  external bool blend;

  /// OGC标准的WMS地图服务的GetMap接口的参数，包括VERSION、LAYERS、STYLES、FORMAT、TRANSPARENT等，CRS、BBOX、REQUEST、WIDTH、HEIGHT等参数请勿添加
  external Object params;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external List<num> zooms;

  /// 透明度，默认 1
  external num opacity;

  /// 是否显示，默认 true
  external bool visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external num zIndex;
}

/// 用于加载 OGC 标准的 WMTS 地图服务的一种图层类，仅支持 EPSG3857 坐标系统的 WMTS 图层
@JS("TileLayer.WMTS")
class WMTS {
  external WMTS(WMTSLayerOptions opts);

  /// 设置 OGC 标准的 WMTS getTile接口的参数，包括Version、Layer、Style、Format、Service等
  external void setParams(Object params);

  /// 获取 OGC 标准的 WMTS getMap 接口的参数
  external Object getParams();

  /// 获取 WMTS 服务地址
  external String getUrl();

  /// 设置 WMTS 服务地址
  external void setUrl(String url);

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
class WMTSLayerOptions {
  /// 构造函数
  external WMTSLayerOptions();

  /// wms服务的url地址，如' https://ahocevar.com/geoserver/wms '
  external String url;

  /// 地图级别切换时，不同级别的图片是否进行混合，如图层的图像内容为部分透明请设置为false
  external bool blend;

  /// OGC标准的WMTS地图服务的GetTile接口的参数，包括Version、Layer、 Style、Format、Service等，TileMatrixSet、TileRow、TileCol、Request等参数请勿添加
  external Object params;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external List<num> zooms;

  /// 透明度，默认 1
  external num opacity;

  /// 是否显示，默认 true
  external bool visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external num zIndex;
}

/// 简易矢量瓦片图层
@JS()
class MapboxVectorTileLayer {
  external MapboxVectorTileLayer(MapboxVTLayerOptions opts);
}

@JS()
@anonymous
class MapboxVTLayerOptions {
  /// 构造函数
  external MapboxVTLayerOptions();

  /// 图层的层级，默认为80
  external num zIndex;

  /// 图层透明度，默认为1
  external num opacity;

  /// MVT 数据的链接地址
  external String? url;

  /// 图层是否可见，默认为true
  external bool visible;

  /// 图层缩放等级范围，默认为[2,22]
  external List<num> zooms;

  /// 瓦片数据等级范围，超过范围会使用最大/最小等级的数据，默认为[2,18]
  external List<num> dataZooms;

  external MapboxVTLayerStyle styles;
}

@JS()
@anonymous
class MapboxVTLayerStyle {
  /// 构造函数
  external MapboxVTLayerStyle();

  /// 面类型的样式
  external PolygonStyle? polygon;

  /// 线类型数据的样式
  external LineStyle? line;

  /// 点类型数据的样式
  external PointStyle? point;

  /// 多面体类型的样式
  external PolyhedronStyle? polyhedron;
}

@JS()
@anonymous
class PolygonStyle {
  /// 构造函数
  external PolygonStyle();

  /// 使用数据中的哪个图层，默认使用 default 图层
  external String sourceLayer;

  /// 面填充颜色
  external String? color;

  /// 描边宽度
  external num? borderWidth;

  /// 描边线的虚线配置，例如： [10,5,8,5]
  external List<num>? dash;

  /// 描边颜色
  external String? borderColor;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external List? injection;

  /// 是否显示
  external bool? visible;
}

@JS()
@anonymous
class LineStyle {
  /// 构造函数
  external LineStyle();

  /// 使用数据中的哪个图层，默认使用 default 图层
  external String sourceLayer;

  /// 线填充颜色
  external String? color;

  /// 宽度
  external num? lineWidth;

  /// 虚线配置，例如： [10,5,8,5]
  external String? dash;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external List? injection;

  /// 是否显示
  external bool? visible;
}

@JS()
@anonymous
class PointStyle {
  /// 构造函数
  external PointStyle();

  /// 使用数据中的哪个图层，默认使用 default 图层
  external String sourceLayer;

  /// 圆点的半径，单位像素
  external String? radius;

  /// 圆的填充颜色
  external num? color;

  /// 描边的宽度
  external String? borderWidth;

  /// 描边的颜色
  external String? borderColor;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external List? injection;

  /// 是否显示
  external bool? visible;
}

@JS()
@anonymous
class PolyhedronStyle {
  /// 构造函数
  external PolyhedronStyle();

  /// 使用数据中的哪个图层，默认使用 default 图层
  external String sourceLayer;

  /// 顶面颜色
  external String? topColor;

  /// 侧面颜色
  external String? sideColor;

  /// 侧面纹理，优先级高于侧面颜色
  external String? texture;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external List? injection;

  /// 是否显示
  external bool? visible;
}
