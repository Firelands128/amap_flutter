@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'package:web/web.dart' show HTMLCanvasElement;
import 'js.dart';

/// 热力图，基于第三方heatmap.js实现，以特殊高亮的形式显示数据密集程度。根据密集程度的不同，图上会呈现不同的颜色，以直观的形式展现数据密度。
@JS()
extension type HeatMap._(JSObject _) implements JSObject {
  /// 构造函数
  external HeatMap(AMap map, HeatMapOptions opts);

  /// 获取热力图叠加地图对象
  external AMap getMap();

  /// 设置热力图要叠加的地图实例，也可以在Map中的layers属性中设置为默认显示的图层
  external void setMap(AMap map);

  /// 获取热力图的属性信息
  external HeatMapOptions getOptions();

  /// 设置热力图属性，请参考 HeatMapOptions 列表中的说明
  external void setOptions(HeatMapOptions options);

  /// 输出热力图的数据集，数据结构同setDataSet中的数据集
  external JSObject getDataSet();

  /// 设置热力图展现的数据集，dataset数据集格式为： { max: Number 权重的最大值, data: Array 坐标数据集 }， 其中max不填则取数据集count最大值 例： { max: 100, data: [{lng: 116.405285, lat: 39.904989, count: 65},{}, …] } 也可以通过url来加载数据，格式为 { data：jsonp格式数据的服务地址URL, dataParser: 数据格式转换function //当jsonp返回结果和官方结构不一致的时候，用户可以传递一个函数用来进行数据格式转换； } 例： { data:'http://abc.com/jsonp.js', dataParser:function(data){ return doSomthing(data);//返回的对象结果应该与上面例子的data字段结构相同 } }
  external void setDataSet(JSObject dataset);

  /// 向热力图数据集中添加坐标点，count不填写时默认：1
  external void addDataPoint(String longitude, String latitude, num count);

  /// 获得热力图层叠加层级
  external JSNumber getzIndex();

  /// 设置热力图层叠加层级
  external void setzIndex(num zIndex);

  /// 显示热力图
  external void show();

  /// 隐藏热力图
  external void hide();
}

extension type HeatMapOptions._(JSObject _) implements JSObject {
  /// 构造函数
  HeatMapOptions() : this._(JSObject());

  /// 热力图中单个点的半径，默认：30，单位：pixel
  external JSNumber radius;

  /// 热力图的渐变区间，热力图按照设置的颜色及间隔显示热力图，例{0.4:'rgb(0, 255, 255)',0.85:'rgb(100, 0, 255)',},其中 key 表示间隔位置，取值范围： [0,1] ，value 为颜色值。默认：heatmap.js标准配色方案
  external JSObject gradient;

  /// 热力图透明度区间数组，取值范围 [0,1] ，0表示完全透明，1表示不透明，默认： [0,1]
  external JSArray opacity;

  /// 支持的缩放级别范围，取值范围 [3-20] ，默认： [3,20]
  external JSArray zooms;

  /// 是否可见
  external JSBoolean visible;

  /// 热力图层在地图上的叠加顺序，默认 130
  external JSNumber zIndex;

  /// 3D热力图属性
  @JS("3d")
  external HeatMap3DOptions heatMap3DOptions;
}

extension type HeatMap3DOptions._(JSObject _) implements JSObject {
  /// 构造函数
  HeatMap3DOptions() : this._(JSObject());

  /// 高度缩放因子，表示在单位高度上的缩放比例， 默认为 1
  external JSNumber heightScale;

  /// 影响高度平滑度的贝塞尔曲线因子，默认 [0.5, 0, 1, 0.5]
  external JSArray heightBezier;

  /// 取样精度，越小越平滑，越大性能越高
  external JSNumber gridSize;
}

@JS()
extension type VectorLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external VectorLayer(VectorLayerOptions opts);

  /// 添加矢量覆盖物到集合中，不支持添加重复的覆盖物
  external void add(JSArray<Overlay> vectors);

  /// 删除矢量覆盖物
  external void remove(JSArray<Overlay> vectors);

  /// 显示图层
  external void show();

  /// 隐藏图层
  external void hide();

  /// 判断传入的矢量覆盖物实例是否在VectorLayer这中
  external JSBoolean has(Overlay vector);

  /// 清空 VectorLayer
  external void clear();

  /// 批量修改矢量覆盖物属性(包括线样式、样色等等)
  external void setOptions(JSObject opt);

  /// 根据经纬度查询矢量覆盖物信息
  external Overlay? query(LngLat geometry);

  /// 获取 Overlay 所有覆盖物显示的范围
  external Bounds? getBounds();
}

extension type VectorLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  VectorLayerOptions() : this._(JSObject());

  /// 是否显示，默认为true
  external JSBoolean visible;

  /// 是否显示，默认为110
  external JSNumber zIndex;
}

/// 标注层
@JS()
extension type LabelsLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external LabelsLayer(LabelsLayerOptions opts);

  /// 获取标注层是否支持内部标注避让
  external JSAny getCollision();

  /// 设置标注层是否支持内部标注避让
  external void setCollision(JSBoolean collision);

  /// 获取标注层是否允许其它层标注避让
  external JSBoolean getAllowCollision();

  /// 设置标注层是否允许其它层标注避让，开启该功能可实现地图标注对 LabelMarker 的避让
  external void setAllowCollision(JSBoolean allowCollision);

  /// 获取标注层透明度
  external JSNumber getOpacity();

  /// 设置标注层透明度
  external void setOpacity(JSNumber opacity);

  /// 获取标注层显示层级范围
  external JSAny getZooms();

  /// 设置标注层显示层级范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 获取标注层叠加顺序
  external JSNumber getzIndex();

  /// 设置标注层叠加顺序
  external void setzIndex(JSNumber zIndex);

  /// 将 labelMarker 添加到标注层上
  external void add(JSArray<LabelMarker> labelMarkers);

  /// 将 labelMarker 从标注层上移除
  external void remove(JSArray<LabelMarker> labelMarkers);

  /// 清空标注层上的标注
  external void clear();

  /// 显示标注层
  external void show();

  /// 隐藏标注层
  external void hide();

  /// 获取标注层内的所有标注对象
  external JSArray getAllOverlays();
}

extension type LabelsLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  LabelsLayerOptions() : this._(JSObject());

  /// 标注层是否可见，默认值:true
  external JSBoolean visible;

  /// 标注层与其它图层的叠加顺序，默认值：120
  external JSNumber zIndex;

  /// 标注层透明度
  external JSNumber opacity;

  /// 标注层内的标注是否避让
  external JSBoolean collision;

  /// 标注层内的标注是否允许其它标注层对它避让
  external JSBoolean allowCollision;

  /// 标注层展示层级范围
  external JSArray<JSNumber> zooms;
}

/// 自定义图层是一种完全由开发者来指定绘制方法的图层
@JS()
extension type CustomLayer._(JSObject _) implements JSObject {
  external CustomLayer(HTMLCanvasElement canvas, CustomLayerOption opts);

  /// 获取图层参数信息
  external JSObject getOptions();

  /// 获取图层层级
  external JSNumber getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(JSNumber zIndex);

  /// 获取图层透明度
  external JSNumber getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(JSNumber opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-20]
  external JSArray<JSNumber> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();

  /// 添加到地图上
  external void setMap(AMap map);
}

/// 自定义图层配置类
extension type CustomLayerOption._(JSObject _) implements JSObject {
  /// 构造函数
  CustomLayerOption() : this._(JSObject());

  /// 绘制函数，初始化完成时候，开发者需要给该图层设定render方法，该方法需要实现图层的绘制，API会在合适的时机自动调用该方法
  external JSFunction render;

  /// 图层缩放等级范围，默认 [2, 20]
  external JSArray<JSNumber> zooms;

  /// 图层透明度，默认为 1
  external JSNumber opacity;

  /// 图层是否可见，默认为 true
  external JSBoolean visible;

  /// 图层的层级，默认为 120
  external JSNumber zIndex;

  /// 是否主动，默认为false
  external JSBoolean alwaysRender;
}

/// 灵活切片图层，继承自AMap.TileLayer，开发者可通过构造时传入给其传入createTile字段来指定每一个切片的内容
@JS("TileLayer.Flexible")
extension type Flexible._(JSObject _) implements TileLayer {
  /// 构造函数
  external Flexible(FlexibleLayerOptions opts);

  /// 销毁图层
  external void destroy();
}

extension type FlexibleLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  FlexibleLayerOptions() : this._(JSObject());

  /// 缓存瓦片数量
  external JSNumber cacheSize;

  /// 由开发者实现，由API自动调用，xyz分别为切片横向纵向编号和层级，切片大小 256。假设每次创建的贴片为A(支持img或者canvas)，当创建或者获取成功时请回调success(A)，不需要显示或者失败时请回调fail()
  external JSFunction createTile;

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

/// 图片图层类，用户可以将一张静态图片作为图层添加在地图上，图片图层会随缩放级别而自适应缩放。
@JS()
extension type ImageLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external ImageLayer(ImageLayerOptions opts);

  /// 获取图片的地址
  external JSString getImageUrl();

  /// 设置图片的地址
  external void setImageUrl(String url);

  /// 获取 ImageLayer显示的范围
  external Bounds getBounds();

  /// 设置 ImageLayer显示的范围
  external void setBounds();

  /// 获取图层参数信息
  external JSObject getOptions();

  /// 获取图层层级
  external JSNumber getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(JSNumber zIndex);

  /// 获取图层透明度
  external JSNumber getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(JSNumber opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-20]
  external JSArray<JSNumber> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();
}

extension type ImageLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  ImageLayerOptions() : this._(JSObject());

  /// 图片地址链接
  external JSString url;

  /// 图层缩放等级范围，默认 [2, 30]
  external JSArray<JSNumber> zooms;

  /// 图片的范围大小经纬度，如果传递数字数组类型: [minlng,minlat,maxlng,maxlat]
  external Bounds bounds;

  /// 图层透明度，默认为 1
  external JSNumber opacity;

  /// 图层是否可见，默认为 true
  external JSBoolean visible;

  /// 图层的层级，默认为 6
  external JSNumber zIndex;
}

/// Canvas图层类，用户可以将一个 Canvas 作为图层添加在地图上，Canvas图层会随缩放级别而自适应缩放。
@JS()
extension type CanvasLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external CanvasLayer(CanvasLayerOptions opts);

  /// 修改显示的Canvas
  external void setCanvas(HTMLCanvasElement canvas);

  /// 返回 Canvas 对象
  external HTMLCanvasElement getElement();

  /// 返回 canvas 范围的经纬度
  external Bounds getBounds();

  /// 设置 CanvasLayer 显示的范围
  external void setBounds();

  /// 当canvas的内容发生改变是用于刷新图层，3D视图下调用，2D视图不需要调用
  external void reFresh();

  /// 获取图层参数信息
  external JSObject getOptions();

  /// 获取图层层级
  external JSNumber getzIndex();

  /// 设置图层层级，数字越大图层层级越高
  external void setzIndex(JSNumber zIndex);

  /// 获取图层透明度
  external JSNumber getOpacity();

  /// 设置图层透明度，范围 [0 ~ 1]
  external void setOpacity(JSNumber opacity);

  /// 获取该图层可显示的级别范围，默认取值范围为[2-20]
  external JSArray<JSNumber> getZooms();

  /// 获取该图层可显示的级别范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 设置图层可见
  external void show();

  /// 设置图层隐藏
  external void hide();
}

extension type CanvasLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  CanvasLayerOptions() : this._(JSObject());

  /// Canvas DOM 对象
  external HTMLCanvasElement canvas;

  /// 图层缩放等级范围，默认 [2, 30]
  external JSArray<JSNumber> zooms;

  /// canvas 的范围大小经纬度, 如果传递数字数组类型: [minlng,minlat,maxlng,maxlat]
  external Bounds bounds;

  /// 图层透明度，默认为 1
  external JSNumber opacity;

  /// 图层是否可见，默认为 true
  external JSBoolean visible;

  /// 图层的层级，默认为 6
  external JSNumber zIndex;
}

/// 3d 自定义图层
@JS()
extension type GLCustomLayer._(JSObject _) implements JSObject {
  /// 构造函数
  external GLCustomLayer(GlCustomLayerOptions opts);

  /// 获取GLCustomLayer所属地图实例
  external AMap? getMap();

  /// 获取GLCustomLayer叠加顺序
  external JSNumber getzIndex();

  /// 设置GLCustomLayer叠加顺序
  external void setzIndex(JSNumber zIndex);

  /// 获取GLCustomLayer透明度
  external JSNumber getOpacity();

  /// 设置GLCustomLayer透明度
  external void setOpacity(JSNumber opacity);

  /// 获取GLCustomLayer显示层级范围
  external JSNumber getZooms();

  /// 设置GLCustomLayer显示层级范围显示层级范围，默认 [3, 20]
  external JSNumber setZooms(JSArray<JSNumber> zooms);

  /// 显示GLCustomLayer
  external void show();

  /// 隐藏GLCustomLayer
  external void hide();
}

extension type GlCustomLayerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  GlCustomLayerOptions() : this._(JSObject());

  /// 初始化的时候，开发者可以在这个函数参数里面获取 gl 上下文，进行一些初始化的操作。
  external JSFunction init;

  /// 绘制函数，初始化完成时候，开发者需要给该图层设定render方法，该方法需要实现图层的绘制，API会在合适的时机自动调用该方法
  external JSFunction render;

  /// 图层缩放等级范围，默认 [2, 20]
  external JSArray<JSNumber> zooms;

  /// 图层透明度，默认为 1
  external JSNumber opacity;

  /// 图层是否可见，默认为 true
  external JSBoolean visible;

  /// 图层的层级，默认为 120
  external JSNumber zIndex;
}
