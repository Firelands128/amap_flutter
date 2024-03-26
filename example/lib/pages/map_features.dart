import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 地图显示要素页面
class MapFeaturesPage extends StatefulWidget {
  /// 地图显示要素页面构造函数
  const MapFeaturesPage({Key? key}) : super(key: key);

  /// 地图显示要素页面标题
  static const title = '地图显示要素';

  @override
  State<MapFeaturesPage> createState() => _MapFeaturesPageState();
}

class _MapFeaturesPageState extends State<MapFeaturesPage> {
  var mapFeatures = {"bg", "road", "building", "point"};

  final features = {
    "bg": "区域面",
    "road": "道路",
    "building": "建筑物",
    "point": "标注",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapFeaturesPage.title),
        actions: [
          CupertinoButton(
            onPressed: showOptions,
            child: Text(
              "设置",
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
        mapFeatures: mapFeatures,
      ),
    );
  }

  void showOptions() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(children: [
        for (final item in features.entries)
          SimpleDialogOption(
            onPressed: () {
              setState(() {
                if (mapFeatures.contains(item.key)) {
                  mapFeatures = Set.from(mapFeatures)..remove(item.key);
                } else {
                  mapFeatures = Set.from(mapFeatures)..add(item.key);
                }
              });
              Navigator.pop(context);
            },
            child: Row(children: [
              Icon(
                mapFeatures.contains(item.key)
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(item.value),
            ]),
          ),
      ]),
    );
  }
}
