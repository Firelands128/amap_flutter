import 'package:amap_flutter/amap_flutter.dart';
import 'package:amap_flutter_example/utils.dart';
import 'package:flutter/material.dart';

/// 地图视野调整页面
class MapViewPage extends StatefulWidget {
  /// 地图视野调整页面构造函数
  const MapViewPage({super.key});

  /// 地图视野调整页面标题
  static const title = '地图视野调整';

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late AMapController controller;
  var animated = false;
  static final position1 = CameraPosition(
    latLng: const LatLng(39.97837, 116.31363),
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
            latLng: const LatLng(39.984120, 116.307484),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  child: const Text(' 视野 1 '),
                  onPressed: () => controller.moveCamera(position1, duration),
                ),
              ),
              if (!PlatformUtil.isWeb)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    child: const Text(' 视野 2 '),
                    onPressed: () => controller.moveCameraToRegion(
                      region,
                      duration,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  child: const Text(' 视野 3 '),
                  onPressed: () => controller.moveCameraToFitPosition(
                    [
                      const LatLng(39.98437, 116.31863),
                      const LatLng(39.98937, 116.32363),
                      const LatLng(39.98037, 116.31163),
                    ],
                    const EdgePadding.all(0.2),
                    duration,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
