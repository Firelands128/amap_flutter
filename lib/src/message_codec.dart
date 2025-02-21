import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/services.dart';

class AMapApiCodec extends StandardMessageCodec {
  const AMapApiCodec();

  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MapType) {
      buffer.putUint8(128);
      writeValue(buffer, value.index);
    } else if (value is UIControlAnchor) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else if (value is UserLocationType) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else if (value is Anchor) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is Bitmap) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CameraPosition) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is EdgePadding) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is Location) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is MapInitConfig) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is MapUpdateConfig) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is Marker) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is Poi) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is Position) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is Region) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is UIControlOffset) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is UIControlPosition) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is UserLocationConfig) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is UserLocationStyle) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MapType.values.elementAt(readValue(buffer) as int);
      case 129:
        return UIControlAnchor.values.elementAt(readValue(buffer) as int);
      case 130:
        return UserLocationType.values.elementAt(readValue(buffer) as int);
      case 131:
        return Anchor.decode(readValue(buffer) as List<Object?>);
      case 132:
        return Bitmap.decode(readValue(buffer) as List<Object?>);
      case 133:
        return CameraPosition.decode(readValue(buffer) as List<Object?>);
      case 134:
        return EdgePadding.decode(readValue(buffer) as List<Object?>);
      case 135:
        return Location.decode(readValue(buffer) as List<Object?>);
      case 136:
        return MapInitConfig.decode(readValue(buffer) as List<Object?>);
      case 137:
        return MapUpdateConfig.decode(readValue(buffer) as List<Object?>);
      case 138:
        return Marker.decode(readValue(buffer) as List<Object?>);
      case 139:
        return Poi.decode(readValue(buffer) as List<Object?>);
      case 140:
        return Position.decode(readValue(buffer) as List<Object?>);
      case 141:
        return Region.decode(readValue(buffer) as List<Object?>);
      case 142:
        return Size.decode(readValue(buffer) as List<Object?>);
      case 143:
        return UIControlOffset.decode(readValue(buffer) as List<Object?>);
      case 144:
        return UIControlPosition.decode(readValue(buffer) as List<Object?>);
      case 145:
        return UserLocationConfig.decode(readValue(buffer) as List<Object?>);
      case 146:
        return UserLocationStyle.decode(readValue(buffer) as List<Object?>);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}