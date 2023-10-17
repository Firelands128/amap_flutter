@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

import 'js.dart';

/// 构造一个距离量测插件对象
@JS()
class RangingTool {
  /// 构造函数
  external RangingTool(AMap map, RangingToolOptions opts);

  /// 启动测距工具
  external void turnOn();

  /// 关闭测距工具，removeOverlays：是否删除测距过程产生的覆盖物
  external void turnOff(bool removeOverlays);
}

@JS()
@anonymous
class RangingToolOptions {
  /// 构造函数
  external RangingToolOptions();

  /// 设置量测起始点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions
  external Object startMarkerOptions;

  /// 设置量测中间点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions
  external Object midMarkerOptions;

  /// 设置量测结束点标记属性对象，包括点标记样式、大小等，参考 MarkerOptions
  external Object endMarkerOptions;

  /// 设置距离量测线的属性对象，包括线样式、颜色等，参考 PolylineOptions
  external Object lineOptions;

  /// 设置距离量测过程中临时量测线的属性对象，包括线样式、颜色，参考 PolylineOptions
  external Object tmpLineOptions;

  /// 设置量测起始点标签的文字内容，默认为“起点”
  external String startLabelText;

  /// 设置量测中间点处标签的文字内容，默认为当前量测结果值
  external String midLabelText;

  /// 设置量测结束点处标签的文字内容，默认为当前量测结果值
  external String endLabelText;

  /// 设置量测起始点标签的偏移量。默认值：Pixel(-6, 6)
  external Pixel startLabelOffset;

  /// 设置量测中间点标签的偏移量。默认值：Pixel(-6, 6)
  external Pixel midLabelOffset;

  /// 设置量测结束点标签的偏移量。默认值：Pixel(-6, 6)
  external Pixel endLabelOffset;
}

/// 鼠标工具插件
@JS()
class MouseTool {
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
  external void close(bool ifClear);
}

/// Polygon 编辑器
@JS()
class PolygonEditor {
  /// 构造函数
  external PolygonEditor(AMap map, Polygon? polygon, PolygonEditorOptions? opts);

  /// 开始编辑对象
  external void open();

  /// 设置编辑对象
  external void setTarget(dynamic tar, Polygon overlay);

  /// 获取编辑对象
  external Polygon? getTarget();

  /// 设置吸附多边形
  external void setAdsorbPolygons(List<Polygon> list);

  /// 清空所有的吸附多边形
  external void clearAdsorbPolygons();

  /// 添加吸附多边形
  external void addAdsorbPolygons(List<Polygon> list);

  /// 删除吸附多边形
  external void removeAdsorbPolygons(List<Polygon> list);

  /// 停止编辑对象
  external void close();
}

@JS()
@anonymous
class PolygonEditorOptions {
  /// 构造函数
  external PolygonEditorOptions();

  /// 新创建的对象样式
  external Object? createOptions;

  /// 编辑样式
  external Object? editOptions;

  /// 顶点样式 CircleMarkerOptions
  external Object? controlPoint;

  /// 中间点样式 CircleMarkerOptions
  external Object? midControlPoint;
}

/// 折线编辑插件
@JS()
class PolylineEditor {
  /// 构造函数
  external PolylineEditor(AMap map, Polygon? polygon, PolylineEditorOptions? opts);

  /// 设置编辑对象
  external void setTarget(Polyline? overlay);

  /// 获取编辑对象
  external Polyline? getTarget();

  /// 开始编辑对象
  external void open();

  /// 停止编辑对象
  external void close();
}

@JS()
@anonymous
class PolylineEditorOptions {
  /// 构造函数
  external PolylineEditorOptions();

  /// 新创建的对象样式
  external Object? createOptions;

  /// 编辑样式
  external Object? editOptions;

  /// 顶点样式 CircleMarkerOptions
  external Object? controlPoint;

  /// 中间点样式 CircleMarkerOptions
  external Object? midControlPoint;
}

/// 圆编辑插件
@JS()
class CircleEditor {
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

@JS()
@anonymous
class CircleEditorOptions {
  /// 构造函数
  external CircleEditorOptions();

  /// 新创建的对象样式
  external Object? createOptions;

  /// 编辑样式
  external Object? editOptions;

  /// 移动点样式 MarkerOptions
  external Object? movePoint;

  /// reaize点样式 MarkerOptions
  external Object? resizePoint;
}

/// 贝塞尔曲线编辑器
@JS()
class BezierCurveEditor {
  /// 构造函数
  external BezierCurveEditor(AMap map, BezierCurve? bezier, BezierCurveEditorOptions? opts);

  /// 设置编辑对象
  external void setTarget(BezierCurve? overlay);

  /// 获取编辑对象
  external BezierCurve? getTarget();

  /// 开始编辑对象
  external void open();

  /// 结束编辑对象
  external void close();
}

@JS()
@anonymous
class BezierCurveEditorOptions {
  /// 构造函数
  external BezierCurveEditorOptions();

  /// 新创建的对象样式
  external Object? createOptions;

  /// 编辑样式
  external Object? editOptions;

  /// 顶点样式 MarkerOptions
  external Object? controlPoint;

  /// 中间点样式 MarkerOptions
  external Object? midControlPoint;

  /// 贝塞尔控制点样式 MarkerOptions
  external Object? bezierControlPoint;

  /// 贝塞尔控制线样式 PolylineOptions
  external Object? bezierControlLine;
}

/// 椭圆编辑器
@JS()
class EllipseEditor {
  /// 构造函数
  external EllipseEditor(AMap map, Ellipse? ellipse, EllipseEditorOptions? opts);

  /// 设置编辑对象
  external void setTarget(Ellipse? overlay);

  /// 获取编辑对象
  external Ellipse? getTarget();

  /// 打开编辑功能
  external void open();

  /// 关闭编辑功能
  external void close();
}

@JS()
@anonymous
class EllipseEditorOptions {
  /// 构造函数
  external EllipseEditorOptions();

  /// 新创建的对象样式
  external Object? createOptions;

  /// 编辑样式
  external Object? editOptions;

  /// 移动点样式 MarkerOptions
  external Object? movePoint;

  /// reaizeX点样式 MarkerOptions
  external Object? resizeXPoint;

  /// reaizeY点样式 MarkerOptions
  external Object? resizeYPoint;
}

/// 矩形编辑器
@JS()
class RectangleEditor {
  /// 构造函数
  external RectangleEditor(AMap map, Rectangle? rect, RectangleEditorOptions? opts);

  /// 设置编辑对象
  external void setTarget(Rectangle? overlay);

  /// 获取编辑对象
  external Rectangle? getTarget();

  /// 打开编辑功能
  external void open();

  /// 关闭编辑功能
  external void close();
}

@JS()
@anonymous
class RectangleEditorOptions {
  /// 构造函数
  external RectangleEditorOptions();

  /// 新创建的对象样式
  external Object? createOptions;

  /// 编辑样式
  external Object? editOptions;

  /// 西南点样式 MarkerOptions
  external Object? southWestPoint;

  /// 东北点样式 MarkerOptions
  external Object? northEastPoint;
}
