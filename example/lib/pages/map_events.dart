import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

/// 地图事件回调页面
class MapEventsPage extends StatefulWidget {
  /// 地图事件回调页面构造函数
  const MapEventsPage({super.key});

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
          latLng: const LatLng(39.984120, 116.307484),
          zoom: 17.2,
        ),
        onMapInitComplete: () {
          debugPrint("onMapInitComplete: ");
        },
        onMapCompleted: () {
          debugPrint("onMapCompleted: ");
        },
        onMapPress: (position) {
          debugPrint("onMapPress: ${position.toJson()}");
        },
        onMapDoublePress: (position) {
          debugPrint("onMapDoublePress: ${position.toJson()}");
        },
        onMapRightPress: (position) {
          debugPrint("onMapRightPress: ${position.toJson()}");
        },
        onMapLongPress: (position) {
          debugPrint("onMapLongPress: ${position.toJson()}");
        },
        onCameraChange: (cameraPosition) {
          debugPrint("onCameraChange: ${cameraPosition.encode()}");
        },
        onCameraChangeStart: (cameraPosition) {
          debugPrint("onCameraChangeStart: ${cameraPosition.encode()}");
        },
        onCameraChangeFinish: (cameraPosition) {
          debugPrint("onCameraChangeFinish: ${cameraPosition.encode()}");
        },
        onMapMoveStart: (position) {
          debugPrint("onMapMoveStart: ${position.toJson()}");
        },
        onMapMove: (position) {
          debugPrint("onMapMove: ${position.toJson()}");
        },
        onMapMoveEnd: (position) {
          debugPrint("onMapMoveEnd: ${position.toJson()}");
        },
        onMapResized: (size) {
          debugPrint("onMapResized: ${size.encode()}");
        },
        onZoomChange: (zoom) {
          debugPrint("onZoomChange: $zoom");
        },
        onZoomChangeStart: (zoom) {
          debugPrint("onZoomChangeStart: $zoom");
        },
        onZoomChangeEnd: (zoom) {
          debugPrint("onZoomChangeEnd: $zoom");
        },
        onRotateChange: (rotate) {
          debugPrint("onRotateChange: $rotate");
        },
        onRotateChangeStart: (rotate) {
          debugPrint("onRotateChangeStart: $rotate");
        },
        onRotateChangeEnd: (rotate) {
          debugPrint("onRotateChangeEnd: $rotate");
        },
        onMouseMove: (position) {
          debugPrint("onMouseMove: ${position.toJson()}");
        },
        onMouseWheel: (zoom) {
          debugPrint("onMouseWheel: $zoom");
        },
        onMouseOver: (position) {
          debugPrint("onMouseOver: ${position.toJson()}");
        },
        onMouseOut: (position) {
          debugPrint("onMouseOut: ${position.toJson()}");
        },
        onMouseUp: (position) {
          debugPrint("onMouseUp: ${position.toJson()}");
        },
        onMouseDown: (position) {
          debugPrint("onMouseDown: ${position.toJson()}");
        },
        onDragStart: (position) {
          debugPrint("onDragStart: ${position.toJson()}");
        },
        onDragging: (position) {
          debugPrint("onDragging: ${position.toJson()}");
        },
        onDragEnd: (position) {
          debugPrint("onDragEnd: ${position.toJson()}");
        },
        onTouchStart: (position) {
          debugPrint("onTouchStart: ${position.toJson()}");
        },
        onTouching: (position) {
          debugPrint("onTouching: ${position.toJson()}");
        },
        onTouchEnd: (position) {
          debugPrint("onTouchEnd: ${position.toJson()}");
        },
        onPoiClick: (poi) {
          debugPrint("onPoiClick: ${poi.encode()}");
        },
        onMarkerClick: (markerId) {
          debugPrint("onMarkerClick: $markerId");
        },
        onMarkerDragStart: (markerId, position) {
          debugPrint("onMarkerDragStart: $markerId, ${position.toJson()}");
        },
        onMarkerDrag: (markerId, position) {
          debugPrint("onMarkerDrag: $markerId, ${position.toJson()}");
        },
        onMarkerDragEnd: (markerId, position) {
          debugPrint("onMarkerDragEnd: $markerId, ${position.toJson()}");
        },
        onUserLocationChange: (location) {
          debugPrint("onUserLocationChange: ${location.encode()}");
        },
      ),
    );
  }
}
