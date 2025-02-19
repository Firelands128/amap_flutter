import 'package:latlong2/latlong.dart';

/// LatLng的扩展工具
extension LatLng$Ext on LatLng {
  Object encode() {
    return <Object?>[
      latitude,
      longitude,
    ];
  }

  static LatLng decode(List<Object?> result) {
    return LatLng(
      result[0]! as double,
      result[1]! as double,
    );
  }
}
