import 'package:amap_flutter/amap_flutter.dart';
import 'package:amap_flutter_example/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 地图控件位置设置页面
class MapControlsPositionPage extends StatefulWidget {
  /// 地图控件位置设置页面构造函数
  const MapControlsPositionPage({Key? key}) : super(key: key);

  /// 地图控件位置设置页面标题
  static const title = '地图控件位置';

  @override
  State<MapControlsPositionPage> createState() =>
      _MapControlsPositionPageState();
}

class _MapControlsPositionPageState extends State<MapControlsPositionPage> {
  static const logo = "Logo";
  static const scale = "比例尺";
  static const compass = "指南针";
  static const zoom = "缩放";

  static const webSupport = [scale, compass, zoom];
  static const androidSupport = [logo, zoom];
  static const iOSSupport = [logo, scale, compass];

  final _positions = {
    logo: UIControlPosition(
      anchor: UIControlAnchor.topLeft,
      offset: UIControlOffset(x: 0, y: 0),
    ),
    scale: UIControlPosition(
      anchor: UIControlAnchor.bottomLeft,
      offset: UIControlOffset(x: 0, y: 0),
    ),
    compass: UIControlPosition(
      anchor: UIControlAnchor.topRight,
      offset: UIControlOffset(x: 0, y: 0),
    ),
    zoom: UIControlPosition(
      anchor: UIControlAnchor.bottomRight,
      offset: UIControlOffset(x: 0, y: 0),
    ),
  };

  UIControlPosition logoPosition = UIControlPosition(
    anchor: UIControlAnchor.topLeft,
    offset: UIControlOffset(x: 0, y: 0),
  );
  UIControlPosition scalePosition = UIControlPosition(
    anchor: UIControlAnchor.bottomLeft,
    offset: UIControlOffset(x: 0, y: 0),
  );
  UIControlPosition compassPosition = UIControlPosition(
    anchor: UIControlAnchor.topRight,
    offset: UIControlOffset(x: 0, y: 0),
  );
  UIControlPosition zoomPosition = UIControlPosition(
    anchor: UIControlAnchor.bottomRight,
    offset: UIControlOffset(x: 0, y: 0),
  );

  void showOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
            changeState(VoidCallback fn) {
              stateSetter(fn);
              setState(fn);
            }

            Iterable<String> keys = switch (PlatformUtil.platform) {
              PlatformEnum.web => webSupport,
              PlatformEnum.android => androidSupport,
              PlatformEnum.ios => iOSSupport,
              PlatformEnum.unknown => [],
            };
            return SimpleDialog(
              title: const Center(
                child: Text("地图控件位置设置"),
              ),
              contentPadding: const EdgeInsets.all(20),
              children: keys
                  .map(
                    (item) => _LabelControlPosition(
                      name: item,
                      position: _positions[item]!,
                      onChanged: (UIControlPosition position) => changeState(
                        () => _positions[item] = position,
                      ),
                      offsetDisable: PlatformUtil.isAndroid,
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapControlsPositionPage.title),
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
      body: Column(
        children: [
          Expanded(
            child: AMapFlutter(
              initCameraPosition: CameraPosition(
                position: Position(latitude: 39.984120, longitude: 116.307484),
                zoom: 17.2,
              ),
              scaleControlEnabled: true,
              zoomControlEnabled: true,
              compassControlEnabled: true,
              logoPosition: _positions[logo],
              scaleControlPosition: _positions[scale],
              zoomControlPosition: _positions[zoom],
              compassControlPosition: _positions[compass],
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelControlPosition extends StatelessWidget {
  const _LabelControlPosition({
    required this.name,
    required this.position,
    required this.onChanged,
    this.offsetDisable = false,
  });

  static const webSupport = [
    UIControlAnchor.topLeft,
    UIControlAnchor.topRight,
    UIControlAnchor.bottomLeft,
    UIControlAnchor.bottomRight,
  ];
  static const androidLogoSupport = [
    UIControlAnchor.bottomLeft,
    UIControlAnchor.bottomCenter,
    UIControlAnchor.bottomRight,
  ];
  static const androidZoomSupport = [
    UIControlAnchor.centerRight,
    UIControlAnchor.bottomRight,
  ];

  static const anchorLabels = {
    UIControlAnchor.topLeft: "左上角",
    UIControlAnchor.topCenter: "顶部",
    UIControlAnchor.topRight: "右上角",
    UIControlAnchor.centerLeft: "左侧",
    UIControlAnchor.center: "中心",
    UIControlAnchor.centerRight: "右侧",
    UIControlAnchor.bottomLeft: "左下角",
    UIControlAnchor.bottomCenter: "底部",
    UIControlAnchor.bottomRight: "右下角",
  };

  final String name;
  final UIControlPosition position;
  final ValueChanged<UIControlPosition> onChanged;
  final bool offsetDisable;

  List<UIControlAnchor> get supportOptions {
    if (kIsWeb) {
      return webSupport;
    }
    if (PlatformUtil.isAndroid) {
      if (name == _MapControlsPositionPageState.logo) {
        return androidLogoSupport;
      } else if (name == _MapControlsPositionPageState.zoom) {
        return androidZoomSupport;
      }
    }
    return UIControlAnchor.values;
  }

  List<Widget> get offsetTextField {
    if (!offsetDisable) {
      return [
        _VerticalTextField(
          label: "X",
          initValue: position.offset.x.toString(),
          onChanged: (value) => onChanged(
            position.copyWith(offset: position.offset.copyWith(x: value)),
          ),
        ),
        _VerticalTextField(
          label: "Y",
          initValue: position.offset.y.toString(),
          onChanged: (value) => onChanged(
            position.copyWith(offset: position.offset.copyWith(y: value)),
          ),
        ),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<UIControlAnchor>(
                disabledHint: Text("请选择$name位置锚点"),
                value: position.anchor,
                items: UIControlAnchor.values.map((anchor) {
                  final enabled = supportOptions.contains(anchor);
                  return DropdownMenuItem(
                    value: anchor,
                    enabled: enabled,
                    child: Text(
                      anchorLabels[anchor]!,
                      style: enabled
                          ? null
                          : TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  );
                }).toList(),
                onChanged: (UIControlAnchor? anchor) => onChanged(
                  position.copyWith(anchor: anchor),
                ),
              ),
              ...offsetTextField,
            ],
          )
        ],
      ),
    );
  }
}

class _VerticalTextField extends StatelessWidget {
  const _VerticalTextField({
    required this.label,
    required this.initValue,
    required this.onChanged,
  });

  final String label;
  final String initValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        SizedBox(
          width: 50,
          child: TextFormField(
            initialValue: initValue,
            onChanged: (value) {
              onChanged(value.isNotEmpty ? double.parse(value) : 0);
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(5),
              FilteringTextInputFormatter.allow(RegExp(r'-?[0-9]*')),
            ],
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
