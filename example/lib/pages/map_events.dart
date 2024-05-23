import 'dart:io';

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
        onMapInitComplete: () {
          debugPrint("onMapInitComplete: ");
        },
        onMapCompleted: () {
          debugPrint("onMapCompleted: ");
        },
        onMapPress: (position) {
          debugPrint("onMapPress: ${position.encode()}");
        },
        onMapDoublePress: (position) {
          debugPrint("onMapDoublePress: ${position.encode()}");
        },
        onMapRightPress: (position) {
          debugPrint("onMapRightPress: ${position.encode()}");
        },
        onMapLongPress: (position) {
          debugPrint("onMapLongPress: ${position.encode()}");
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
          debugPrint("onMapMoveStart: ${position.encode()}");
        },
        onMapMove: (position) {
          debugPrint("onMapMove: ${position.encode()}");
        },
        onMapMoveEnd: (position) {
          debugPrint("onMapMoveEnd: ${position.encode()}");
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
          debugPrint("onMouseMove: ${position.encode()}");
        },
        onMouseWheel: (zoom) {
          debugPrint("onMouseWheel: $zoom");
        },
        onMouseOver: (position) {
          debugPrint("onMouseOver: ${position.encode()}");
        },
        onMouseOut: (position) {
          debugPrint("onMouseOut: ${position.encode()}");
        },
        onMouseUp: (position) {
          debugPrint("onMouseUp: ${position.encode()}");
        },
        onMouseDown: (position) {
          debugPrint("onMouseDown: ${position.encode()}");
        },
        onDragStart: (position) {
          debugPrint("onDragStart: ${position.encode()}");
        },
        onDragging: (position) {
          debugPrint("onDragging: ${position.encode()}");
        },
        onDragEnd: (position) {
          debugPrint("onDragEnd: ${position.encode()}");
        },
        onTouchStart: (position) {
          debugPrint("onTouchStart: ${position.encode()}");
        },
        onTouching: (position) {
          debugPrint("onTouching: ${position.encode()}");
        },
        onTouchEnd: (position) {
          debugPrint("onTouchEnd: ${position.encode()}");
        },
        onPoiClick: (poi) {
          debugPrint("onPoiClick: ${poi.encode()}");
        },
        onMarkerClick: (markerId) {
          debugPrint("onMarkerClick: $markerId");
        },
        onMarkerDragStart: (markerId, position) {
          debugPrint("onMarkerDragStart: $markerId, ${position.encode()}");
        },
        onMarkerDrag: (markerId, position) {
          debugPrint("onMarkerDrag: $markerId, ${position.encode()}");
        },
        onMarkerDragEnd: (markerId, position) {
          debugPrint("onMarkerDragEnd: $markerId, ${position.encode()}");
        },
        onUserLocationChange: (location) {
          debugPrint("onUserLocationChange: ${location.encode()}");
        },
      ),
    );
  }
}
