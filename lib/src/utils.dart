part of '../amap_flutter.dart';

/// LatLng的扩展工具
extension LatLng$Ext on LatLng {
  Position get position {
    return Position(latitude: latitude, longitude: longitude);
  }
}

extension EdgePadding$Ext on EdgePadding {
  static EdgePadding all(double value) {
    return EdgePadding(left: value, top: value, right: value, bottom: value);
  }
}
