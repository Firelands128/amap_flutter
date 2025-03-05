package com.morbit.amap_flutter

import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

object AMapApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? Int)?.let {
          MapType.ofRaw(it)
        }
      }

      129.toByte() -> {
        return (readValue(buffer) as? Int)?.let {
          UIControlAnchor.ofRaw(it)
        }
      }

      130.toByte() -> {
        return (readValue(buffer) as? Int)?.let {
          UserLocationType.ofRaw(it)
        }
      }

      131.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Anchor.fromList(it)
        }
      }

      132.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Bitmap.fromList(it)
        }
      }

      133.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          CameraPosition.fromList(it)
        }
      }

      134.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          EdgePadding.fromList(it)
        }
      }

      135.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Location.fromList(it)
        }
      }

      136.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          MapInitConfig.fromList(it)
        }
      }

      137.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          MapUpdateConfig.fromList(it)
        }
      }

      138.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Marker.fromList(it)
        }
      }

      139.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Poi.fromList(it)
        }
      }

      140.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Position.fromList(it)
        }
      }

      141.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Region.fromList(it)
        }
      }

      142.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Size.fromList(it)
        }
      }

      143.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          UIControlOffset.fromList(it)
        }
      }

      144.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          UIControlPosition.fromList(it)
        }
      }

      145.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          UserLocationConfig.fromList(it)
        }
      }

      146.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          UserLocationStyle.fromList(it)
        }
      }

      else -> super.readValueOfType(type, buffer)
    }
  }

  override fun writeValue(stream: ByteArrayOutputStream, value: Any?) {
    when (value) {
      is MapType -> {
        stream.write(128)
        writeValue(stream, value.raw)
      }

      is UIControlAnchor -> {
        stream.write(129)
        writeValue(stream, value.raw)
      }

      is UserLocationType -> {
        stream.write(130)
        writeValue(stream, value.raw)
      }

      is Anchor -> {
        stream.write(131)
        writeValue(stream, value.toList())
      }

      is Bitmap -> {
        stream.write(132)
        writeValue(stream, value.toList())
      }

      is CameraPosition -> {
        stream.write(133)
        writeValue(stream, value.toList())
      }

      is EdgePadding -> {
        stream.write(134)
        writeValue(stream, value.toList())
      }

      is Location -> {
        stream.write(135)
        writeValue(stream, value.toList())
      }

      is MapInitConfig -> {
        stream.write(136)
        writeValue(stream, value.toList())
      }

      is MapUpdateConfig -> {
        stream.write(137)
        writeValue(stream, value.toList())
      }

      is Marker -> {
        stream.write(138)
        writeValue(stream, value.toList())
      }

      is Poi -> {
        stream.write(139)
        writeValue(stream, value.toList())
      }

      is Position -> {
        stream.write(140)
        writeValue(stream, value.toList())
      }

      is Region -> {
        stream.write(141)
        writeValue(stream, value.toList())
      }

      is Size -> {
        stream.write(142)
        writeValue(stream, value.toList())
      }

      is UIControlOffset -> {
        stream.write(143)
        writeValue(stream, value.toList())
      }

      is UIControlPosition -> {
        stream.write(144)
        writeValue(stream, value.toList())
      }

      is UserLocationConfig -> {
        stream.write(145)
        writeValue(stream, value.toList())
      }

      is UserLocationStyle -> {
        stream.write(146)
        writeValue(stream, value.toList())
      }

      else -> super.writeValue(stream, value)
    }
  }
}