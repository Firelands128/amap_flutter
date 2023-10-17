import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

/// 地图事件回调页面
class MapEventsPage extends StatefulWidget {
  /// 地图事件回调页面构造函数
  const MapEventsPage({Key? key}) : super(key: key);

  /// 地图事件回调页面标题
  static const title = '地图事件回调';

  @override
  State<MapEventsPage> createState() => _MapEventsPageState();
}

class _MapEventsPageState extends State<MapEventsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.snackBar('请查看控制台输出');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(MapEventsPage.title)),
      body: AMapFlutter(
        initCameraPosition: CameraPosition(
          position: Position(latitude: 39.984120, longitude: 116.307484),
          zoom: 17.2,
        ),
        onMapInitComplete: () => print("onMapInitComplete: "),
        onMapCompleted: () => print("onMapCompleted: "),
        onMapPress: (position) => print("onMapPress: ${position.encode()}"),
        onMapDoublePress: (position) => print("onMapDoublePress: ${position.encode()}"),
        onMapRightPress: (position) => print("onMapRightPress: ${position.encode()}"),
        onMapLongPress: (position) => print("onMapLongPress: ${position.encode()}"),
        onCameraChange: (cameraPosition) => print("onCameraChange: ${cameraPosition.encode()}"),
        onCameraChangeStart: (cameraPosition) => print("onCameraChangeStart: ${cameraPosition.encode()}"),
        onCameraChangeFinish: (cameraPosition) => print("onCameraChangeFinish: ${cameraPosition.encode()}"),
        onMapMoveStart: (position) => print("onMapMoveStart: ${position.encode()}"),
        onMapMove: (position) => print("onMapMove: ${position.encode()}"),
        onMapMoveEnd: (position) => print("onMapMoveEnd: ${position.encode()}"),
        onMapResized: (size) => print("onMapResized: ${size.encode()}"),
        onZoomChange: (zoom) => print("onZoomChange: $zoom"),
        onZoomChangeStart: (zoom) => print("onZoomChangeStart: $zoom"),
        onZoomChangeEnd: (zoom) => print("onZoomChangeEnd: $zoom"),
        onRotateChange: (rotate) => print("onRotateChange: $rotate"),
        onRotateChangeStart: (rotate) => print("onRotateChangeStart: $rotate"),
        onRotateChangeEnd: (rotate) => print("onRotateChangeEnd: $rotate"),
        onMouseMove: (position) => print("onMouseMove: ${position.encode()}"),
        onMouseWheel: (zoom) => print("onMouseWheel: $zoom"),
        onMouseOver: (position) => print("onMouseOver: ${position.encode()}"),
        onMouseOut: (position) => print("onMouseOut: ${position.encode()}"),
        onMouseUp: (position) => print("onMouseUp: ${position.encode()}"),
        onMouseDown: (position) => print("onMouseDown: ${position.encode()}"),
        onDragStart: (position) => print("onDragStart: ${position.encode()}"),
        onDragging: (position) => print("onDragging: ${position.encode()}"),
        onDragEnd: (position) => print("onDragEnd: ${position.encode()}"),
        onTouchStart: (position) => print("onTouchStart: ${position.encode()}"),
        onTouching: (position) => print("onTouching: ${position.encode()}"),
        onTouchEnd: (position) => print("onTouchEnd: ${position.encode()}"),
        onPoiClick: (poi) => print("onPoiClick: ${poi.encode()}"),
        onMarkerClick: (markerId) => print("onMarkerClick: $markerId"),
        onMarkerDragStart: (markerId, position) => print("onMarkerDragStart: $markerId, ${position.encode()}"),
        onMarkerDrag: (markerId, position) => print("onMarkerDrag: $markerId, ${position.encode()}"),
        onMarkerDragEnd: (markerId, position) => print("onMarkerDragEnd: $markerId, ${position.encode()}"),
        onUserLocationChange: (location) => print("onUserLocationChange: ${location.encode()}"),
      ),
    );
  }
}
