import 'package:amap_flutter/amap_flutter.dart';

/// LatLng的扩展工具
extension LatLng$Ext on LatLng {
  Position get position {
    return Position(latitude: latitude, longitude: longitude);
  }
}
