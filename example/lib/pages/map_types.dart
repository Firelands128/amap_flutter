import 'dart:io';

import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 地图类型切换页面
class MapTypesPage extends StatefulWidget {
  /// 地图类型切换页面构造函数
  const MapTypesPage({Key? key}) : super(key: key);

  /// 地图类型切换页面标题
  static const title = '地图类型切换';

  @override
  State<MapTypesPage> createState() => _MapTypesPageState();
}

class _MapTypesPageState extends State<MapTypesPage> {
  static const types = {
    MapType.standard: '标准地图',
    MapType.satellite: '卫星地图',
    MapType.standardNight: '夜景地图',
    MapType.navi: '导航地图',
    MapType.bus: '公交地图',
    MapType.naviNight: '导航夜景地图',
  };
  static const androidSupport = {
    MapType.standard: true,
    MapType.satellite: true,
    MapType.standardNight: true,
    MapType.navi: true,
    MapType.bus: true,
    MapType.naviNight: false,
  };

  MapType mapType = MapType.standard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapTypesPage.title),
        actions: [
          CupertinoButton(
            onPressed: showOptions,
            child: Text(
              types[mapType]!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
      body: AMapFlutter(
        initCameraPosition: CameraPosition(
          position: Position(latitude: 39.984120, longitude: 116.307484),
          zoom: 17.2,
        ),
        mapType: mapType,
      ),
    );
  }

  void showOptions() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          for (final item in types.entries)
            if (Platform.isIOS ||
                Platform.isAndroid && androidSupport[item.key]!)
              SimpleDialogOption(
                onPressed: () {
                  setState(() => mapType = item.key);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      item.key == mapType
                          ? Icons.check_circle_outlined
                          : Icons.radio_button_unchecked,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(item.value),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
