import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 图层显示页面
class MapLayersPage extends StatefulWidget {
  /// 图层显示页面构造函数
  const MapLayersPage({super.key});

  /// 图层显示页面标题
  static const title = '地图图层显示';

  @override
  State<MapLayersPage> createState() => _MapLayersPageState();
}

class _MapLayersPageState extends State<MapLayersPage> {
  static const traffic = '实时交通图层';
  static const buildings = '楼块图层';
  static const indoorMap = '室内地图';
  static const satellite = '卫星图层';
  static const roadNet = '路网图层';

  final _state = {
    traffic: false,
    buildings: false,
    indoorMap: false,
    satellite: false,
    roadNet: false,
  };
  static const iOSAndroidSupport = [traffic, buildings, indoorMap];

  List<Widget> get items {
    Iterable<String> keys;
    if (kIsWeb) {
      keys = _state.keys;
    } else {
      keys = iOSAndroidSupport;
    }
    return keys
        .map(
          (it) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: const EdgeInsets.only(top: 16), child: Text(it)),
              Switch(
                value: _state[it] ?? false,
                onChanged: (value) => setState(() => _state[it] = value),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(MapLayersPage.title)),
      body: AMapFlutter(
        initCameraPosition: CameraPosition(
          latLng: const LatLng(39.984120, 116.307484),
          zoom: 17.2,
        ),
        showTraffic: _state[traffic],
        showBuildings: _state[buildings]!,
        showIndoorMap: _state[indoorMap]!,
        showSatelliteLayer: _state[satellite]!,
        showRoadNetLayer: _state[roadNet]!,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}
