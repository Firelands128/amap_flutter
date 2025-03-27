import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' show HTMLDivElement;

import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'amap_flutter_web_controller.dart';

class AMapFlutterWebPlugin extends Registrar {
  /// Constructs a AMapFlutterWebPlugin
  AMapFlutterWebPlugin();

  static void registerWith(Registrar registrar) {
    AMapFlutterPlatformInterface.instance = AMapFlutterWebController();
    // ignore: undefined_prefixed_name
    ui_web.platformViewRegistry.registerViewFactory(
      'amap_flutter',
      (int viewId) {
        return HTMLDivElement()
          ..id = viewId.toString()
          ..style.width = '100%'
          ..style.height = '100%';
      },
    );
  }
}
