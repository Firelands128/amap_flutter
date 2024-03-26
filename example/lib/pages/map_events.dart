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
          stdout.writeln("onMapInitComplete: ");
        },
        onMapCompleted: () {
          stdout.writeln("onMapCompleted: ");
        },
        onMapPress: (position) {
          stdout.writeln("onMapPress: ${position.encode()}");
        },
        onMapDoublePress: (position) {
          stdout.writeln("onMapDoublePress: ${position.encode()}");
        },
        onMapRightPress: (position) {
          stdout.writeln("onMapRightPress: ${position.encode()}");
        },
        onMapLongPress: (position) {
          stdout.writeln("onMapLongPress: ${position.encode()}");
        },
        onCameraChange: (cameraPosition) {
          stdout.writeln("onCameraChange: ${cameraPosition.encode()}");
        },
        onCameraChangeStart: (cameraPosition) {
          stdout.writeln("onCameraChangeStart: ${cameraPosition.encode()}");
        },
        onCameraChangeFinish: (cameraPosition) {
          stdout.writeln("onCameraChangeFinish: ${cameraPosition.encode()}");
        },
        onMapMoveStart: (position) {
          stdout.writeln("onMapMoveStart: ${position.encode()}");
        },
        onMapMove: (position) {
          stdout.writeln("onMapMove: ${position.encode()}");
        },
        onMapMoveEnd: (position) {
          stdout.writeln("onMapMoveEnd: ${position.encode()}");
        },
        onMapResized: (size) {
          stdout.writeln("onMapResized: ${size.encode()}");
        },
        onZoomChange: (zoom) {
          stdout.writeln("onZoomChange: $zoom");
        },
        onZoomChangeStart: (zoom) {
          stdout.writeln("onZoomChangeStart: $zoom");
        },
        onZoomChangeEnd: (zoom) {
          stdout.writeln("onZoomChangeEnd: $zoom");
        },
        onRotateChange: (rotate) {
          stdout.writeln("onRotateChange: $rotate");
        },
        onRotateChangeStart: (rotate) {
          stdout.writeln("onRotateChangeStart: $rotate");
        },
        onRotateChangeEnd: (rotate) {
          stdout.writeln("onRotateChangeEnd: $rotate");
        },
        onMouseMove: (position) {
          stdout.writeln("onMouseMove: ${position.encode()}");
        },
        onMouseWheel: (zoom) {
          stdout.writeln("onMouseWheel: $zoom");
        },
        onMouseOver: (position) {
          stdout.writeln("onMouseOver: ${position.encode()}");
        },
        onMouseOut: (position) {
          stdout.writeln("onMouseOut: ${position.encode()}");
        },
        onMouseUp: (position) {
          stdout.writeln("onMouseUp: ${position.encode()}");
        },
        onMouseDown: (position) {
          stdout.writeln("onMouseDown: ${position.encode()}");
        },
        onDragStart: (position) {
          stdout.writeln("onDragStart: ${position.encode()}");
        },
        onDragging: (position) {
          stdout.writeln("onDragging: ${position.encode()}");
        },
        onDragEnd: (position) {
          stdout.writeln("onDragEnd: ${position.encode()}");
        },
        onTouchStart: (position) {
          stdout.writeln("onTouchStart: ${position.encode()}");
        },
        onTouching: (position) {
          stdout.writeln("onTouching: ${position.encode()}");
        },
        onTouchEnd: (position) {
          stdout.writeln("onTouchEnd: ${position.encode()}");
        },
        onPoiClick: (poi) {
          stdout.writeln("onPoiClick: ${poi.encode()}");
        },
        onMarkerClick: (markerId) {
          stdout.writeln("onMarkerClick: $markerId");
        },
        onMarkerDragStart: (markerId, position) {
          stdout.writeln("onMarkerDragStart: $markerId, ${position.encode()}");
        },
        onMarkerDrag: (markerId, position) {
          stdout.writeln("onMarkerDrag: $markerId, ${position.encode()}");
        },
        onMarkerDragEnd: (markerId, position) {
          stdout.writeln("onMarkerDragEnd: $markerId, ${position.encode()}");
        },
        onUserLocationChange: (location) {
          stdout.writeln("onUserLocationChange: ${location.encode()}");
        },
      ),
    );
  }
}
