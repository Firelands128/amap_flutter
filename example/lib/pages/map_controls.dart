import 'package:amap_flutter/amap_flutter.dart';
import 'package:amap_flutter_example/utils.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

/// 地图控件加载页面
class MapControlsPage extends StatefulWidget {
  /// 地图控件加载页面构造函数
  const MapControlsPage({super.key});

  /// 地图控件加载页面标题
  static const title = '地图控件加载';

  @override
  State<MapControlsPage> createState() => _MapControlsPageState();
}

class _MapControlsPageState extends State<MapControlsPage> {
  static const compass = '指南针';
  static const scale = '比例尺';
  static const zoom = '缩放';
  static const geolocation = '定位按钮';
  static const hawkEye = '鹰眼';
  static const mapType = '地图类型';

  static const androidSupport = [compass, scale, zoom, geolocation];
  static const iOSSupport = [compass, scale];

  final _state = {
    compass: true,
    scale: true,
    zoom: true,
    geolocation: true,
    hawkEye: true,
    mapType: true,
  };

  List<Widget> get items {
    Iterable<String> keys = switch (PlatformUtil.platform) {
      PlatformEnum.web => _state.keys,
      PlatformEnum.android => androidSupport,
      PlatformEnum.ios => iOSSupport,
      PlatformEnum.unknown => [],
    };
    return keys
        .map(
          (item) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(item),
              ),
              Switch(
                value: _state[item]!,
                onChanged: (value) => setState(() => _state[item] = value),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(MapControlsPage.title)),
      body: AMapFlutter(
        initCameraPosition: CameraPosition(
          position: const LatLng(39.984120, 116.307484),
          zoom: 17.2,
        ),
        compassControlEnabled: _state[compass]!,
        scaleControlEnabled: _state[scale]!,
        zoomControlEnabled: _state[zoom]!,
        geolocationControlEnabled: _state[geolocation]!,
        hawkEyeControlEnabled: _state[hawkEye]!,
        mapTypeControlEnabled: _state[mapType]!,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}
