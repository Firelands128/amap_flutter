import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

/// 地图初始化设置页面
class MapSettingPage extends StatefulWidget {
  /// 地图初始化设置页面构造函数
  const MapSettingPage({super.key});

  /// 地图初始化设置页面标题
  static const title = '地图初始化设置';

  @override
  State<MapSettingPage> createState() => _MapSettingPageState();
}

class _MapSettingPageState extends State<MapSettingPage> {
  bool configured = false;
  bool dragEnable = true;
  bool zoomEnable = true;
  bool jogEnable = true;
  bool tiltEnable = true;
  bool rotateEnable = true;
  bool animateEnable = true;
  bool keyboardEnable = true;
  bool doubleClickZoom = true;
  bool scrollWheel = true;
  bool touchZoom = true;
  bool touchZoomCenter = true;
  bool showLabel = true;
  bool isHotspot = true;
  bool is3DMode = false;
  bool showBuildingBlock = true;
  bool showIndoorMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MapSettingPage.title),
      ),
      body: configured
          ? AMapFlutter(
              initCameraPosition: CameraPosition(
                latLng: const LatLng(39.984120, 116.307484),
                zoom: 17.2,
              ),
              dragEnable: dragEnable,
              zoomEnable: zoomEnable,
              tiltEnable: tiltEnable,
              rotateEnable: rotateEnable,
              jogEnable: jogEnable,
              animateEnable: animateEnable,
              keyboardEnable: keyboardEnable,
              doubleClickZoom: doubleClickZoom,
              scrollWheel: scrollWheel,
              touchZoom: touchZoom,
              touchZoomCenter: touchZoomCenter,
              showLabel: showLabel,
              isHotspot: isHotspot,
              viewMode: is3DMode ? "3D" : "2D",
              terrain: is3DMode ? true : false,
              showBuildingBlock: showBuildingBlock,
              showIndoorMap: showIndoorMap,
            )
          : SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(50),
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _labelCheckbox(
                        "地图是否允许拖拽",
                        dragEnable,
                        () => setState(() => dragEnable = !dragEnable),
                      ),
                      _labelCheckbox(
                        "地图是否允许缩放",
                        zoomEnable,
                        () => setState(() => zoomEnable = !zoomEnable),
                      ),
                      _labelCheckbox(
                        "地图是否允许俯仰",
                        tiltEnable,
                        () => setState(() => tiltEnable = !tiltEnable),
                      ),
                      _labelCheckbox(
                        "地图是否允许旋转",
                        rotateEnable,
                        () => setState(() => rotateEnable = !rotateEnable),
                      ),
                      if (kIsWeb)
                        ExpansionTile(
                          title: const Text('Web端初始化设置'),
                          children: <Widget>[
                            _labelCheckbox(
                              "是否使用缓动效果",
                              jogEnable,
                              () => setState(() => jogEnable = !jogEnable),
                            ),
                            _labelCheckbox(
                              "平移过程中是否使用动画",
                              animateEnable,
                              () => setState(
                                () => animateEnable = !animateEnable,
                              ),
                            ),
                            _labelCheckbox(
                              "是否可通过键盘控制",
                              keyboardEnable,
                              () => setState(
                                () => keyboardEnable = !keyboardEnable,
                              ),
                            ),
                            _labelCheckbox(
                              "是否可通过双击鼠标缩放地图",
                              doubleClickZoom,
                              () => setState(
                                () => doubleClickZoom = !doubleClickZoom,
                              ),
                            ),
                            _labelCheckbox(
                              "是否可通过鼠标滚轮缩放地图",
                              scrollWheel,
                              () => setState(() => scrollWheel = !scrollWheel),
                            ),
                            _labelCheckbox(
                              "是否可通过多点触控缩放地图",
                              touchZoom,
                              () => setState(() => touchZoom = !touchZoom),
                            ),
                            _labelCheckbox(
                              "手机端双指缩放是否以地图中心为中心",
                              touchZoomCenter,
                              () => setState(
                                () => touchZoomCenter = !touchZoomCenter,
                              ),
                            ),
                            _labelCheckbox(
                              "显示文字标注",
                              showLabel,
                              () => setState(() => showLabel = !showLabel),
                            ),
                            _labelCheckbox(
                              "是否开启地图热点和标注的悬停效果",
                              isHotspot,
                              () => setState(() => isHotspot = !isHotspot),
                            ),
                            _labelCheckbox(
                              "3D地形图模式",
                              is3DMode,
                              () => setState(() => is3DMode = !is3DMode),
                            ),
                            _labelCheckbox(
                              "是否展示地图 3D 楼块",
                              showBuildingBlock,
                              () => setState(
                                () => showBuildingBlock = !showBuildingBlock,
                              ),
                            ),
                            _labelCheckbox(
                              "是否自动展示室内地图",
                              showIndoorMap,
                              () => setState(
                                () => showIndoorMap = !showIndoorMap,
                              ),
                            ),
                          ],
                        ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            configured = true;
                          });
                        },
                        child: const Text("显示地图"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _labelCheckbox(String text, bool value, VoidCallback onPressed) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(text),
      value: value,
      onChanged: (_) => onPressed(),
    );
  }
}
