import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/material.dart';

/// 地图限制区域页面
class MapRestrictionPage extends StatefulWidget {
  /// 地图限制区域页面构造函数
  const MapRestrictionPage({Key? key}) : super(key: key);

  /// 地图限制区域页面标题
  static const title = '地图限制区域';

  @override
  State<MapRestrictionPage> createState() => _MapRestrictionPageState();
}

class _MapRestrictionPageState extends State<MapRestrictionPage> {
  final Region restrictedRegion = Region(
    north: 39.98437,
    east: 116.31863,
    south: 39.97837,
    west: 116.31363,
  );

  late AMapController controller;
  var restricted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapRestrictionPage.title),
        actions: [
          Row(children: [
            const Text('限制'),
            Switch(
              value: restricted,
              onChanged: (value) {
                setState(() {
                  restricted = value;
                  if (value) {
                    controller.setRestrictRegion(restrictedRegion);
                  } else {
                    controller.removeRestrictRegion();
                  }
                });
              },
            ),
          ]),
        ],
      ),
      body: Stack(
        children: [
          AMapFlutter(
            initCameraPosition: CameraPosition(
              position: Position(latitude: 39.984120, longitude: 116.307484),
              zoom: 17.2,
            ),
            onMapCreated: (controller) => this.controller = controller,
          ),
        ],
      ),
    );
  }
}
