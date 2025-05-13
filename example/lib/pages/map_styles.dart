import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 地图样式切换页面
class MapStylesPage extends StatefulWidget {
  /// 地图样式切换页面构造函数
  const MapStylesPage({super.key});

  /// 地图样式切换页面标题
  static const title = '地图样式切换';

  @override
  State<MapStylesPage> createState() => _MapStylesPageState();
}

class _MapStylesPageState extends State<MapStylesPage> {
  String mapStyle = "amap://styles/normal";
  final styles = {
    "amap://styles/normal": "标准",
    "amap://styles/macaron": "马卡龙",
    "amap://styles/graffiti": "涂鸦",
    "amap://styles/whitesmoke": "远山黛",
    "amap://styles/dark": "幻影黑",
    "amap://styles/fresh": "草色青",
    "amap://styles/darkblue": "极夜蓝",
    "amap://styles/blue": "靛青蓝",
    "amap://styles/light": "月光银",
    "amap://styles/grey": "雅士灰"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapStylesPage.title),
        actions: [
          CupertinoButton(
            onPressed: showOptions,
            child: Text(
              styles[mapStyle]!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
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
        mapStyle: mapStyle,
      ),
    );
  }

  void showOptions() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          for (final item in styles.entries)
            SimpleDialogOption(
              onPressed: () {
                setState(() => mapStyle = item.key);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    item.key == mapStyle
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
