part of '../amap_flutter.dart';

/// Generic event used as a base class for all events that might be triggered from map.
abstract class MapEvent<T> {
  MapEvent(this.mapId, this.value);

  /// The ID of the Map this event is associated to.
  final int mapId;

  /// The value wrapped by this event
  final T value;
}

/// A `MapEvent` associated to a `position`.
class _PositionedMapEvent<T> extends MapEvent<T> {
  _PositionedMapEvent(int mapId, this.position, T value) : super(mapId, value);

  /// The position where this event happened.
  final Position position;
}

/// 地图初始化完成事件
class MapInitCompleteEvent extends MapEvent<void> {
  MapInitCompleteEvent(int mapId) : super(mapId, null);
}

/// 地图加载完成事件
class MapCompleteEvent extends MapEvent<void> {
  MapCompleteEvent(int mapId) : super(mapId, null);
}

/// 地图点击事件
class MapPressEvent extends _PositionedMapEvent<void> {
  MapPressEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 地图双击事件
class MapDoublePressEvent extends _PositionedMapEvent<void> {
  MapDoublePressEvent(int mapId, Position position)
      : super(mapId, position, null);
}

/// 地图右键点击事件
class MapRightPressEvent extends _PositionedMapEvent<void> {
  MapRightPressEvent(int mapId, Position position)
      : super(mapId, position, null);
}

/// 地图长按事件
class MapLongPressEvent extends _PositionedMapEvent<void> {
  MapLongPressEvent(int mapId, Position position)
      : super(mapId, position, null);
}

/// 地图视野变化事件
class CameraChangeEvent extends MapEvent<CameraPosition> {
  CameraChangeEvent(super.mapId, super.cameraPosition);
}

/// 地图视野开始变化事件
class CameraChangeStartEvent extends MapEvent<CameraPosition> {
  CameraChangeStartEvent(super.mapId, super.cameraPosition);
}

/// 地图视野变化结束事件
class CameraChangeFinishEvent extends MapEvent<CameraPosition> {
  CameraChangeFinishEvent(super.mapId, super.cameraPosition);
}

/// 地图平移开始事件
class MapMoveStartEvent extends _PositionedMapEvent<void> {
  MapMoveStartEvent(int mapId, Position position)
      : super(mapId, position, null);
}

/// 地图平移事件
class MapMoveEvent extends _PositionedMapEvent<void> {
  MapMoveEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 地图平移结束事件
class MapMoveEndEvent extends _PositionedMapEvent<void> {
  MapMoveEndEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 地图容器尺寸改变事件
class MapResizedEvent extends MapEvent<Size> {
  MapResizedEvent(super.mapId, super.size);
}

/// 地图缩放级别改变事件
class ZoomChangeEvent extends MapEvent<double> {
  ZoomChangeEvent(super.mapId, super.zoom);
}

/// 地图缩放级别开始改变事件
class ZoomChangeStartEvent extends MapEvent<double> {
  ZoomChangeStartEvent(super.mapId, super.zoom);
}

/// 地图缩放级别结束改变事件
class ZoomChangeEndEvent extends MapEvent<double> {
  ZoomChangeEndEvent(super.mapId, super.zoom);
}

/// 地图旋转事件
class RotateChangeEvent extends MapEvent<double> {
  RotateChangeEvent(super.mapId, super.rotate);
}

/// 地图旋转开始事件
class RotateChangeStartEvent extends MapEvent<double> {
  RotateChangeStartEvent(super.mapId, super.rotate);
}

/// 地图旋转结束事件
class RotateChangeEndEvent extends MapEvent<double> {
  RotateChangeEndEvent(super.mapId, super.rotate);
}

/// 移动鼠标事件
class MouseMoveEvent extends _PositionedMapEvent<void> {
  MouseMoveEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 鼠标滚轮缩放地图事件
class MouseWheelEvent extends MapEvent<double> {
  MouseWheelEvent(super.mapId, super.zoom);
}

/// 鼠标移入地图容器内时触发事件
class MouseOverEvent extends _PositionedMapEvent<void> {
  MouseOverEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 鼠标移出地图容器时触发事件
class MouseOutEvent extends _PositionedMapEvent<void> {
  MouseOutEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 鼠标在地图上单击抬起时触发事件
class MouseUpEvent extends _PositionedMapEvent<void> {
  MouseUpEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 鼠标在地图上单击按下时触发事件
class MouseDownEvent extends _PositionedMapEvent<void> {
  MouseDownEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 拖拽地图开始事件
class DragStartEvent extends _PositionedMapEvent<void> {
  DragStartEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 地图拖拽中事件
class DraggingEvent extends _PositionedMapEvent<void> {
  DraggingEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 拖拽地图停止事件
class DragEndEvent extends _PositionedMapEvent<void> {
  DragEndEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 触摸地图开始事件
class TouchStartEvent extends _PositionedMapEvent<void> {
  TouchStartEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 触摸移动地图时触发事件
class TouchingEvent extends _PositionedMapEvent<void> {
  TouchingEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 触摸地图停止事件
class TouchEndEvent extends _PositionedMapEvent<void> {
  TouchEndEvent(int mapId, Position position) : super(mapId, position, null);
}

/// 点击POI事件
class PoiClickEvent extends MapEvent<Poi> {
  PoiClickEvent(super.mapId, super.poi);
}

/// 点击标记点事件
class MarkerClickEvent extends MapEvent<String> {
  MarkerClickEvent(super.mapId, super.markerId);
}

/// 开始拖动标记点事件
class MarkerDragStartEvent extends _PositionedMapEvent<String> {
  MarkerDragStartEvent(super.mapId, super.position, super.markerId);
}

/// 拖动标记点事件
class MarkerDragEvent extends _PositionedMapEvent<String> {
  MarkerDragEvent(super.mapId, super.position, super.markerId);
}

/// 结束拖动标记点事件
class MarkerDragEndEvent extends _PositionedMapEvent<String> {
  MarkerDragEndEvent(super.mapId, super.position, super.markerId);
}

/// 用户位置改变事件
class UserLocationChangeEvent extends MapEvent<Location> {
  UserLocationChangeEvent(super.mapId, super.location);
}

/// 点击用户定位点事件
class UserLocationClickEvent extends _PositionedMapEvent<void> {
  UserLocationClickEvent(int mapId, Position position)
      : super(mapId, position, null);
}
