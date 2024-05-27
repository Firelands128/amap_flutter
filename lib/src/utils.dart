import 'package:latlong2/latlong.dart';

import '../amap_flutter.dart';

/// Position的扩展工具
extension Position$Ext on Position {
  /// 将Position对象转换为LatLng
  LatLng get latLng {
    return LatLng(latitude, longitude);
  }
}

/// LatLng的扩展工具
extension LatLng$Ext on LatLng {
  /// 将LatLng对象转换为Position
  Position get position {
    return Position(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
