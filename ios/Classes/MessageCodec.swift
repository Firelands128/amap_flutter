import Flutter


class AMapCodec: FlutterStandardMethodCodec {
  static let shared = AMapCodec(readerWriter: AMapCodecReaderWriter())
}

private class AMapCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return AMapCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return AMapCodecWriter(data: data)
  }
}

private class AMapCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return MapType(rawValue: self.readValue() as! Int)
    case 129:
      return UIControlAnchor(rawValue: self.readValue() as! Int)
    case 130:
      return UserLocationType(rawValue: self.readValue() as! Int)
    case 131:
      return Anchor.fromList(self.readValue() as! [Any?])
    case 132:
      return Bitmap.fromList(self.readValue() as! [Any?])
    case 133:
      return CameraPosition.fromList(self.readValue() as! [Any?])
    case 134:
      return EdgePadding.fromList(self.readValue() as! [Any?])
    case 135:
      return Location.fromList(self.readValue() as! [Any?])
    case 136:
      return MapInitConfig.fromList(self.readValue() as! [Any?])
    case 137:
      return MapUpdateConfig.fromList(self.readValue() as! [Any?])
    case 138:
      return Marker.fromList(self.readValue() as! [Any?])
    case 139:
      return Poi.fromList(self.readValue() as! [Any?])
    case 140:
      return Position.fromList(self.readValue() as! [Any?])
    case 141:
      return Region.fromList(self.readValue() as! [Any?])
    case 142:
      return Size.fromList(self.readValue() as! [Any?])
    case 143:
      return UIControlOffset.fromList(self.readValue() as! [Any?])
    case 144:
      return UIControlPosition.fromList(self.readValue() as! [Any?])
    case 145:
      return UserLocationConfig.fromList(self.readValue() as! [Any?])
    case 146:
      return UserLocationStyle.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class AMapCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? MapType {
      super.writeValue(128)
      super.writeValue(value.rawValue)
    } else if let value = value as? UIControlAnchor {
      super.writeValue(129)
      super.writeValue(value.rawValue)
    } else if let value = value as? UserLocationType {
      super.writeValue(130)
      super.writeValue(value.rawValue)
    } else if let value = value as? Anchor {
      super.writeByte(131)
      super.writeValue(value.toList())
    } else if let value = value as? Bitmap {
      super.writeByte(132)
      super.writeValue(value.toList())
    } else if let value = value as? CameraPosition {
      super.writeByte(133)
      super.writeValue(value.toList())
    } else if let value = value as? EdgePadding {
      super.writeByte(134)
      super.writeValue(value.toList())
    } else if let value = value as? Location {
      super.writeByte(135)
      super.writeValue(value.toList())
    } else if let value = value as? MapInitConfig {
      super.writeByte(136)
      super.writeValue(value.toList())
    } else if let value = value as? MapUpdateConfig {
      super.writeByte(137)
      super.writeValue(value.toList())
    } else if let value = value as? Marker {
      super.writeByte(138)
      super.writeValue(value.toList())
    } else if let value = value as? Poi {
      super.writeByte(139)
      super.writeValue(value.toList())
    } else if let value = value as? Position {
      super.writeByte(140)
      super.writeValue(value.toList())
    } else if let value = value as? Region {
      super.writeByte(141)
      super.writeValue(value.toList())
    } else if let value = value as? Size {
      super.writeByte(142)
      super.writeValue(value.toList())
    } else if let value = value as? UIControlOffset {
      super.writeByte(143)
      super.writeValue(value.toList())
    } else if let value = value as? UIControlPosition {
      super.writeByte(144)
      super.writeValue(value.toList())
    } else if let value = value as? UserLocationConfig {
      super.writeByte(145)
      super.writeValue(value.toList())
    } else if let value = value as? UserLocationStyle {
      super.writeByte(146)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}
