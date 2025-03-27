@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// 构造一个距离量测插件对象
extension type RangingTool._(JSObject _) implements JSObject {
  /// 构造函数
  external RangingTool(AMap map, RangingToolOptions opts);

  /// 启动测距工具
  external void turnOn();

  /// 关闭测距工具，removeOverlays：是否删除测距过程产生的覆盖物
  external void turnOff(JSBoolean removeOverlays);
}

extension type RangingToolOptions._(JSObject _) implements JSObject {
  /// 构造函数
  RangingToolOptions() : this._(JSObject());

  /// 设置量测起始点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions
  external JSObject startMarkerOptions;

  /// 设置量测中间点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions
  external JSObject midMarkerOptions;

  /// 设置量测结束点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions
  external JSObject endMarkerOptions;

  /// 设置距离量测线的属性对象，包括线样式、颜色等，参考 PolylineOptions
  external JSObject lineOptions;

  /// 设置距离量测过程中临时量测线的属性对象，包括线样式、颜色，参考 PolylineOptions
  external JSObject tmpLineOptions;

  /// 设置量测起始点标签的文字内容，默认为“起点”
  external JSString startLabelText;

  /// 设置量测中间点处标签的文字内容，默认为当前量测结果值
  external JSString midLabelText;

  /// 设置量测结束点处标签的文字内容，默认为当前量测结果值
  external JSString endLabelText;

  /// 设置量测起始点标签的偏移量。默认值：Pixel(-6, 6)
  external Pixel startLabelOffset;

  /// 设置量测中间点标签的偏移量。默认值：Pixel(-6, 6)
  external Pixel midLabelOffset;

  /// 设置量测结束点标签的偏移量。默认值：Pixel(-6, 6)
  external Pixel endLabelOffset;
}

/// 鼠标工具插件
@JS()
extension type MouseTool._(JSObject _) implements JSObject {
  /// 构造函数
  external MouseTool(AMap map);

  /// 开启鼠标画点标注模式。鼠标在地图上单击绘制点标注，标注样式参考MarkerOptions设置
  external void marker(MarkerOptions opts);

  /// 开启鼠标画圆模式。鼠标在地图上拖动绘制相应的圆形。圆形样式参考CircleOptions设置
  external void circle(CircleOptions opts);

  /// 开启鼠标画矩形模式。鼠标在地图上拉框即可绘制相应的矩形。矩形样式参考PolygonOptions设置
  external void rectangle(PolygonOptions opts);

  /// 开启鼠标画折线模式。鼠标在地图上点击绘制折线，鼠标左键双击或右键单击结束绘制，折线样式参考PolylineOptions设置
  external void polyline(PolylineOptions opts);

  /// 开启鼠标画多边形模式。鼠标在地图上单击开始绘制多边形，鼠标左键双击或右键单击结束当前多边形的绘制，多边形样式参考PolygonOptions设置
  external void polygon(PolygonOptions opts);

  /// 开启面积量测模式。鼠标在地图上单击绘制量测区域，鼠标左键双击或右键单击结束当前量测操作，并显示本次量测结果。量测面样式参考PolygonOptions设置
  external void measureArea(PolygonOptions opts);

  /// 开启距离量测模式。鼠标在地图上单击绘制量测节点，并计算显示两两节点之间的距离，鼠标左键双击或右键单击结束当前量测操作。量测线样式参考 PolylineOptions 设置 注：不能同时使用rule方法和RangTool插件进行距离量测
  external void rule(PolylineOptions opts);

  /// 开启鼠标拉框放大模式。鼠标可在地图上拉框放大地图。矩形框样式参考PolygonOptions设置
  external void rectZoomIn(PolygonOptions opts);

  /// 开启鼠标拉框缩小模式。鼠标可在地图上拉框缩小地图。矩形框样式参考PolygonOptions设置
  external void rectZoomOut(PolygonOptions opts);

  /// 关闭当前鼠标操作。参数arg设为true时，鼠标操作关闭的同时清除地图上绘制的所有覆盖物对象；设为false时，保留所绘制的覆盖物对象。默认为false
  external void close(JSBoolean ifClear);
}

/// Polygon 编辑器
@JS()
extension type PolygonEditor._(JSObject _) implements JSObject {
  /// 构造函数
  external PolygonEditor(
    AMap map,
    Polygon? polygon,
    PolygonEditorOptions? opts,
  );

  /// 开始编辑对象
  external void open();

  /// 设置编辑对象
  external void setTarget(JSAny tar, Polygon overlay);

  /// 获取编辑对象
  external Polygon? getTarget();

  /// 设置吸附多边形
  external void setAdsorbPolygons(JSArray<Polygon> list);

  /// 清空所有的吸附多边形
  external void clearAdsorbPolygons();

  /// 添加吸附多边形
  external void addAdsorbPolygons(JSArray<Polygon> list);

  /// 删除吸附多边形
  external void removeAdsorbPolygons(JSArray<Polygon> list);

  /// 停止编辑对象
  external void close();
}

extension type PolygonEditorOptions._(JSObject _) implements JSObject {
  /// 构造函数
  PolygonEditorOptions() : this._(JSObject());

  /// 新创建的对象样式
  external JSObject? createOptions;

  /// 编辑样式
  external JSObject? editOptions;

  /// 顶点样式 CircleMarkerOptions
  external JSObject? controlPoint;

  /// 中间点样式 CircleMarkerOptions
  external JSObject? midControlPoint;
}

/// 折线编辑插件
@JS()
extension type PolylineEditor._(JSObject _) implements JSObject {
  /// 构造函数
  external PolylineEditor(
    AMap map,
    Polygon? polygon,
    PolylineEditorOptions? opts,
  );

  /// 设置编辑对象
  external void setTarget(Polyline? overlay);

  /// 获取编辑对象
  external Polyline? getTarget();

  /// 开始编辑对象
  external void open();

  /// 停止编辑对象
  external void close();
}

extension type PolylineEditorOptions._(JSObject _) implements JSObject {
  /// 构造函数
  PolylineEditorOptions() : this._(JSObject());

  /// 新创建的对象样式
  external JSObject? createOptions;

  /// 编辑样式
  external JSObject? editOptions;

  /// 顶点样式 CircleMarkerOptions
  external JSObject? controlPoint;

  /// 中间点样式 CircleMarkerOptions
  external JSObject? midControlPoint;
}

/// 圆编辑插件
@JS()
extension type CircleEditor._(JSObject _) implements JSObject {
  /// 构造函数
  external CircleEditor(AMap map, Circle? circle, CircleEditorOptions? opts);

  /// 设置编辑对象
  external void setTarget(Circle? overlay);

  /// 获取编辑对象
  external Circle? getTarget();

  /// 打开编辑功能
  external void open();

  /// 关闭编辑功能
  external void close();
}

extension type CircleEditorOptions._(JSObject _) implements JSObject {
  /// 构造函数
  CircleEditorOptions() : this._(JSObject());

  /// 新创建的对象样式
  external JSObject? createOptions;

  /// 编辑样式
  external JSObject? editOptions;

  /// 移动点样式 MarkerOptions
  external JSObject? movePoint;

  /// reaize点样式 MarkerOptions
  external JSObject? resizePoint;
}

/// 贝塞尔曲线编辑器
@JS()
extension type BezierCurveEditor._(JSObject _) implements JSObject {
  /// 构造函数
  external BezierCurveEditor(
    AMap map,
    BezierCurve? bezier,
    BezierCurveEditorOptions? opts,
  );

  /// 设置编辑对象
  external void setTarget(BezierCurve? overlay);

  /// 获取编辑对象
  external BezierCurve? getTarget();

  /// 开始编辑对象
  external void open();

  /// 结束编辑对象
  external void close();
}

extension type BezierCurveEditorOptions._(JSObject _) implements JSObject {
  /// 构造函数
  BezierCurveEditorOptions() : this._(JSObject());

  /// 新创建的对象样式
  external JSObject? createOptions;

  /// 编辑样式
  external JSObject? editOptions;

  /// 顶点样式 MarkerOptions
  external JSObject? controlPoint;

  /// 中间点样式 MarkerOptions
  external JSObject? midControlPoint;

  /// 贝塞尔控制点样式 MarkerOptions
  external JSObject? bezierControlPoint;

  /// 贝塞尔控制线样式 PolylineOptions
  external JSObject? bezierControlLine;
}

/// 椭圆编辑器
@JS()
extension type EllipseEditor._(JSObject _) implements JSObject {
  /// 构造函数
  external EllipseEditor(
    AMap map,
    Ellipse? ellipse,
    EllipseEditorOptions? opts,
  );

  /// 设置编辑对象
  external void setTarget(Ellipse? overlay);

  /// 获取编辑对象
  external Ellipse? getTarget();

  /// 打开编辑功能
  external void open();

  /// 关闭编辑功能
  external void close();
}

extension type EllipseEditorOptions._(JSObject _) implements JSObject {
  /// 构造函数
  EllipseEditorOptions() : this._(JSObject());

  /// 新创建的对象样式
  external JSObject? createOptions;

  /// 编辑样式
  external JSObject? editOptions;

  /// 移动点样式 MarkerOptions
  external JSObject? movePoint;

  /// reaizeX点样式 MarkerOptions
  external JSObject? resizeXPoint;

  /// reaizeY点样式 MarkerOptions
  external JSObject? resizeYPoint;
}

/// 矩形编辑器
@JS()
extension type RectangleEditor._(JSObject _) implements JSObject {
  /// 构造函数
  external RectangleEditor(
    AMap map,
    Rectangle? rect,
    RectangleEditorOptions? opts,
  );

  /// 设置编辑对象
  external void setTarget(Rectangle? overlay);

  /// 获取编辑对象
  external Rectangle? getTarget();

  /// 打开编辑功能
  external void open();

  /// 关闭编辑功能
  external void close();
}

extension type RectangleEditorOptions._(JSObject _) implements JSObject {
  /// 构造函数
  RectangleEditorOptions() : this._(JSObject());

  /// 新创建的对象样式
  external JSObject? createOptions;

  /// 编辑样式
  external JSObject? editOptions;

  /// 西南点样式 MarkerOptions
  external JSObject? southWestPoint;

  /// 东北点样式 MarkerOptions
  external JSObject? northEastPoint;
}
