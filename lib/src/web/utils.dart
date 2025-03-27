import 'dart:convert';
import 'dart:js_interop';

import "package:amap_flutter/amap_flutter.dart";
import 'package:latlong2/latlong.dart';

import 'js/js.dart' as js;

extension LatLng$Ext on LatLng {
  js.LngLat get lngLat {
    return js.LngLat(longitude, latitude);
  }
}

extension Position$Ext on Position {
  js.LngLat get lngLat {
    return js.LngLat(longitude, latitude);
  }
}

extension LngLat$Ext on js.LngLat {
  LatLng get latLng {
    return LatLng(lat.toDartDouble, lng.toDartDouble);
  }
}

extension SizeJS$Ext on js.Size {
  Size get size {
    return Size(width: getWidth().toDartDouble, height: getHeight().toDartDouble);
  }
}

extension Size$Ext on Size {
  js.Size get size {
    return js.Size(width, height);
  }
}

extension AMapFlutter$Ext on AMapFlutter {
  js.MapOptions get mapOptions {
    final options = js.MapOptions();
    if (mapStyle != null) options.mapStyle = mapStyle!.toJS;
    if (initCameraPosition?.position != null) {
      options.center = initCameraPosition!.position.lngLat;
    }
    if (initCameraPosition?.zoom != null) {
      options.zoom = initCameraPosition!.zoom!.toJS;
    }
    if (initCameraPosition?.heading != null) {
      options.rotation = initCameraPosition!.heading!.toJS;
    }
    if (initCameraPosition?.skew != null) {
      options.pitch = initCameraPosition!.skew!.toJS;
    }
    if (dragEnable != null) options.dragEnable = dragEnable!.toJS;
    if (zoomEnable != null) options.zoomEnable = zoomEnable!.toJS;
    if (tiltEnable != null) options.pitchEnable = tiltEnable!.toJS;
    if (rotateEnable != null) options.rotateEnable = rotateEnable!.toJS;
    if (jogEnable != null) options.jogEnable = jogEnable!.toJS;
    if (animateEnable != null) options.animateEnable = animateEnable!.toJS;
    if (keyboardEnable != null) options.keyboardEnable = keyboardEnable!.toJS;
    if (doubleClickZoom != null) options.doubleClickZoom = doubleClickZoom!.toJS;
    if (scrollWheel != null) options.scrollWheel = scrollWheel!.toJS;
    if (touchZoom != null) options.touchZoom = touchZoom!.toJS;
    if (touchZoomCenter != null) options.touchZoomCenter = touchZoomCenter!.toJS;
    if (isHotspot != null) options.isHotspot = isHotspot!.toJS;
    if (showBuildingBlock != null) {
      options.showBuildingBlock = showBuildingBlock!.toJS;
    }
    if (showLabel != null) options.showLabel = showLabel!.toJS;
    if (showIndoorMap != null) options.showIndoorMap = showIndoorMap!.toJS;
    if (defaultCursor != null) options.defaultCursor = defaultCursor!.toJS;
    if (viewMode != null) options.viewMode = viewMode!.toJS;
    if (terrain != null) options.terrain = terrain!.toJS;
    if (wallColor != null) options.wallColor = wallColor!.toString().toJS;
    if (roofColor != null) options.roofColor = roofColor!.toString().toJS;
    if (skyColor != null) options.skyColor = skyColor!.toString().toJS;
    return options;
  }
}

extension Region$Ext on Region {
  js.Bounds get bounds {
    return js.Bounds(js.LngLat(west, south), js.LngLat(east, north));
  }
}

extension Bitmap$Ext on Bitmap {
  js.Icon? get icon {
    final image = bytes != null ? "data:image/png;base64,${base64Encode(bytes!)}" : asset;
    if (image == null) return null;

    final icon = js.Icon(js.IconOpts()..image = image.toJS);
    if (size != null) icon.setSize(size!.size);
    return icon;
  }
}

extension UIControlPosition$Ext on UIControlPosition {
  js.ControlPosition get position {
    switch (anchor) {
      case UIControlAnchor.topLeft:
        return js.ControlPosition()
          ..top = "${offset.y}px".toJS
          ..left = "${offset.x}px".toJS;
      case UIControlAnchor.topCenter:
        return js.ControlPosition()..top = "${offset.y}px".toJS;
      case UIControlAnchor.topRight:
        return js.ControlPosition()
          ..top = "${offset.y}px".toJS
          ..right = "${offset.x}px".toJS;
      case UIControlAnchor.centerLeft:
        return js.ControlPosition()..left = "${offset.x}px".toJS;
      case UIControlAnchor.center:
        return js.ControlPosition();
      case UIControlAnchor.centerRight:
        return js.ControlPosition()..right = "${offset.x}px".toJS;
      case UIControlAnchor.bottomLeft:
        return js.ControlPosition()
          ..left = "${offset.x}px".toJS
          ..bottom = "${offset.y}px".toJS;
      case UIControlAnchor.bottomCenter:
        return js.ControlPosition()..bottom = "${offset.y}px".toJS;
      case UIControlAnchor.bottomRight:
        return js.ControlPosition()
          ..bottom = "${offset.y}px".toJS
          ..right = "${offset.x}px".toJS;
    }
  }
}

extension Marker$Ext on Marker {
  js.MarkerOptions get marker {
    return js.MarkerOptions()..position = position.lngLat;
  }
}

extension HotspotEvent$Ext on js.HotspotEvent {
  get poi {
    return Poi(name: name.toDart, position: lnglat.latLng.position);
  }
}
