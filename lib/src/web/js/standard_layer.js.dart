@JS("AMap")
library amap_flutter;

import 'dart:js_interop';

/// 用于加载OGC标准的WMS地图服务的一种图层类，仅支持EPSG3857坐标系统的WMS图层。
@JS("TileLayer.WMS")
extension type WMS._(JSObject _) implements JSObject {
  /// 构造函数
  external WMS(WMSLayerOptions opts);

  /// 设置OGC标准的WMS getMap接口的参数，包括VERSION、LAYERS、STYLES、FORMAT、TRANSPARENT等
  external void setParams(JSObject params);

  /// 获取 OGC 标准的 WMS getMap 接口的参数
  external JSObject getParams();

  /// 设置 WMS 服务地址
  external void setUrl(String url);

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

extension type WMSLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  WMSLayerOptions() : this._(JSObject());

  /// wmts服务的url地址，如：' https://services.arcgisonline.com/arcgis/rest/services/'+ 'Demographics/USA_Population_Density/MapServer/WMTS/'
  external JSString url;

  /// 地图级别切换时，不同级别的图片是否进行混合，如图层的图像内容为部分透明请设置为false
  external JSBoolean blend;

  /// OGC标准的WMS地图服务的GetMap接口的参数，包括VERSION、LAYERS、STYLES、FORMAT、TRANSPARENT等，CRS、BBOX、REQUEST、WIDTH、HEIGHT等参数请勿添加
  external JSObject params;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> zooms;

  /// 透明度，默认 1
  external JSNumber opacity;

  /// 是否显示，默认 true
  external JSBoolean visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external JSNumber zIndex;
}

/// 用于加载 OGC 标准的 WMTS 地图服务的一种图层类，仅支持 EPSG3857 坐标系统的 WMTS 图层
@JS("TileLayer.WMTS")
extension type WMTS._(JSObject _) implements JSObject {
  /// 构造函数
  external WMTS(WMTSLayerOptions opts);

  /// 设置 OGC 标准的 WMTS getTile接口的参数，包括Version、Layer、Style、Format、Service等
  external void setParams(JSObject params);

  /// 获取 OGC 标准的 WMTS getMap 接口的参数
  external JSObject getParams();

  /// 获取 WMTS 服务地址
  external JSString getUrl();

  /// 设置 WMTS 服务地址
  external void setUrl(String url);

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

extension type WMTSLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  WMTSLayerOptions() : this._(JSObject());

  /// wms服务的url地址，如' https://ahocevar.com/geoserver/wms '
  external JSString url;

  /// 地图级别切换时，不同级别的图片是否进行混合，如图层的图像内容为部分透明请设置为false
  external JSBoolean blend;

  /// OGC标准的WMTS地图服务的GetTile接口的参数，包括Version、Layer、 Style、Format、Service等，TileMatrixSet、TileRow、TileCol、Request等参数请勿添加
  external JSObject params;

  /// 支持的缩放级别范围，默认范围 [2-30]
  external JSArray<JSNumber> zooms;

  /// 透明度，默认 1
  external JSNumber opacity;

  /// 是否显示，默认 true
  external JSBoolean visible;

  /// 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
  external JSNumber zIndex;
}

/// 简易矢量瓦片图层
extension type MapboxVectorTileLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external MapboxVectorTileLayer(MapboxVTLayerOptions opts);
}

extension type MapboxVTLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MapboxVTLayerOptions() : this._(JSObject());

  /// 图层的层级，默认为80
  external JSNumber zIndex;

  /// 图层透明度，默认为1
  external JSNumber opacity;

  /// MVT 数据的链接地址
  external JSString? url;

  /// 图层是否可见，默认为true
  external JSBoolean visible;

  /// 图层缩放等级范围，默认为[2,22]
  external JSArray<JSNumber> zooms;

  /// 瓦片数据等级范围，超过范围会使用最大/最小等级的数据，默认为[2,18]
  external JSArray<JSNumber> dataZooms;

  external MapboxVTLayerStyle styles;
}

extension type MapboxVTLayerStyle._(JSObject _) implements JSObject {
  /// 构造函数
  MapboxVTLayerStyle() : this._(JSObject());

  /// 面类型的样式
  external PolygonStyle? polygon;

  /// 线类型数据的样式
  external LineStyle? line;

  /// 点类型数据的样式
  external PointStyle? point;

  /// 多面体类型的样式
  external PolyhedronStyle? polyhedron;
}

extension type PolygonStyle._(JSObject _) implements JSObject {
  /// 构造函数
  PolygonStyle() : this._(JSObject());

  /// 使用数据中的哪个图层，默认使用 default 图层
  external JSString sourceLayer;

  /// 面填充颜色
  external JSString? color;

  /// 描边宽度
  external JSNumber? borderWidth;

  /// 描边线的虚线配置，例如： [10,5,8,5]
  external JSArray<JSNumber>? dash;

  /// 描边颜色
  external JSString? borderColor;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external JSArray? injection;

  /// 是否显示
  external JSBoolean? visible;
}

extension type LineStyle._(JSObject _) implements JSObject {
  /// 构造函数
  LineStyle() : this._(JSObject());

  /// 使用数据中的哪个图层，默认使用 default 图层
  external JSString sourceLayer;

  /// 线填充颜色
  external JSString? color;

  /// 宽度
  external JSNumber? lineWidth;

  /// 虚线配置，例如： [10,5,8,5]
  external JSString? dash;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external JSArray? injection;

  /// 是否显示
  external JSBoolean? visible;
}

extension type PointStyle._(JSObject _) implements JSObject {
  /// 构造函数
  PointStyle() : this._(JSObject());

  /// 使用数据中的哪个图层，默认使用 default 图层
  external JSString sourceLayer;

  /// 圆点的半径，单位像素
  external JSString? radius;

  /// 圆的填充颜色
  external JSNumber? color;

  /// 描边的宽度
  external JSString? borderWidth;

  /// 描边的颜色
  external JSString? borderColor;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external JSArray? injection;

  /// 是否显示
  external JSBoolean? visible;
}

extension type PolyhedronStyle._(JSObject _) implements JSObject {
  /// 构造函数
  PolyhedronStyle() : this._(JSObject());

  /// 使用数据中的哪个图层，默认使用 default 图层
  external JSString sourceLayer;

  /// 顶面颜色
  external JSString? topColor;

  /// 侧面颜色
  external JSString? sideColor;

  /// 侧面纹理，优先级高于侧面颜色
  external JSString? texture;

  /// 其他属性值中对于函数形式的值，假如需要获取外部变量，要使用数组的形式传入，便于在函数内部访问外部变量。请看下面的示例。
  external JSArray? injection;

  /// 是否显示
  external JSBoolean? visible;
}
