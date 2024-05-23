import 'dart:io';

import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/material.dart';

/// 地图定位页面
class UserLocationPage extends StatefulWidget {
  /// 地图定位页面构造函数
  const UserLocationPage({Key? key}) : super(key: key);

  /// 地图定位页面标题
  static const title = '地图定位';

  @override
  State<UserLocationPage> createState() => _UserLocationPageState();
}

class _UserLocationPageState extends State<UserLocationPage> {
  late AMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UserLocationPage.title),
        actions: [
          TextButton(
            onPressed: () async {
              Location location = await controller.getUserLocation();
              controller.moveCamera(
                CameraPosition(
                  position: location.position,
                  heading: location.heading,
                  zoom: 13,
                ),
              );
            },
            child: const Text("当前位置"),
          ),
        ],
      ),
      body: AMapFlutter(
        showUserLocation: true,
        onUserLocationChange: (location) {
          debugPrint(
            '${location.position?.latitude}, ${location.position?.longitude}',
          );
        },
        onMapCreated: (controller) async {
          this.controller = controller;
        },
      ),
    );
  }
}
