import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/material.dart';

/// 地图视野调整页面
class MapViewPage extends StatefulWidget {
  /// 地图视野调整页面构造函数
  const MapViewPage({Key? key}) : super(key: key);

  /// 地图视野调整页面标题
  static const title = '地图视野调整';

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late AMapController controller;
  var animated = false;
  static final position1 = CameraPosition(
    position: Position(latitude: 39.97837, longitude: 116.31363),
    zoom: 19,
    heading: 45,
    skew: 45,
  );
  static final region = Region(
    north: 39.98537,
    east: 116.32363,
    south: 39.96537,
    west: 116.30363,
  );

  @override
  Widget build(BuildContext context) {
    final duration = animated ? const Duration(seconds: 2) : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapViewPage.title),
        actions: [
          Row(children: [
            const Text('动画'),
            Switch(
              value: animated,
              onChanged: (value) => setState(() => animated = value),
            ),
          ]),
        ],
      ),
      body: Stack(children: [
        AMapFlutter(
          initCameraPosition: CameraPosition(
            position: Position(latitude: 39.984120, longitude: 116.307484),
            zoom: 17.2,
          ),
          onMapCreated: (controller) => this.controller = controller,
        ),
        Positioned(
          top: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text(' 视野 1 '),
                onPressed: () => controller.moveCamera(position1, duration),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                child: const Text(' 视野 2 '),
                onPressed: () => controller.moveCameraToRegion(
                  region,
                  duration,
                ),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                child: const Text(' 视野 3 '),
                onPressed: () => controller.moveCameraToFitPosition(
                  [
                    Position(latitude: 39.98437, longitude: 116.31863),
                    Position(latitude: 39.98937, longitude: 116.32363),
                    Position(latitude: 39.98037, longitude: 116.31163),
                  ],
                  EdgePadding(
                    top: 0.2,
                    right: 0.2,
                    bottom: 0.2,
                    left: 0.2,
                  ),
                  duration,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
