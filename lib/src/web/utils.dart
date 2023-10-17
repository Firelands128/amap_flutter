import "package:amap_flutter/amap_flutter.dart";

import 'js/js.dart' as js;

extension Position$Ext on Position {
  js.LngLat get lngLat {
    return js.LngLat(longitude, latitude);
  }
}

extension LatLng$Ext on js.LngLat {
  Position get position {
    return Position(latitude: lat.toDouble(), longitude: lng.toDouble());
  }
}

extension SizeJS$Ext on js.Size {
  Size get size {
    return Size(width: getWidth().toDouble(), height: getHeight().toDouble());
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
    if (mapStyle != null) options.mapStyle = mapStyle as String;
    if (initCameraPosition?.position != null) options.center = initCameraPosition!.position!.lngLat;
    if (initCameraPosition?.zoom != null) options.zoom = initCameraPosition!.zoom as num;
    if (initCameraPosition?.heading != null) options.rotation = initCameraPosition!.heading as num;
    if (initCameraPosition?.skew != null) options.pitch = initCameraPosition!.skew as num;
    if (dragEnable != null) options.dragEnable = dragEnable as bool;
    if (zoomEnable != null) options.zoomEnable = zoomEnable as bool;
    if (tiltEnable != null) options.pitchEnable = tiltEnable as bool;
    if (rotateEnable != null) options.rotateEnable = rotateEnable as bool;
    if (jogEnable != null) options.jogEnable = jogEnable!;
    if (animateEnable != null) options.animateEnable = animateEnable!;
    if (keyboardEnable != null) options.keyboardEnable = keyboardEnable!;
    if (doubleClickZoom != null) options.doubleClickZoom = doubleClickZoom!;
    if (scrollWheel != null) options.scrollWheel = scrollWheel!;
    if (touchZoom != null) options.touchZoom = touchZoom!;
    if (touchZoomCenter != null) options.touchZoomCenter = touchZoomCenter!;
    if (isHotspot != null) options.isHotspot = isHotspot!;
    if (showBuildingBlock != null) options.showBuildingBlock = showBuildingBlock!;
    if (showLabel != null) options.showLabel = showLabel!;
    if (showIndoorMap != null) options.showIndoorMap = showIndoorMap!;
    if (defaultCursor != null) options.defaultCursor = defaultCursor!;
    if (viewMode != null) options.viewMode = viewMode!;
    if (terrain != null) options.terrain = terrain!;
    if (wallColor != null) options.wallColor = wallColor!.toString();
    if (roofColor != null) options.roofColor = roofColor!.toString();
    if (skyColor != null) options.skyColor = skyColor!.toString();
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
    if (asset != null) {
      return js.Icon(js.IconOpts()..image = asset!);
    }
    return null;
  }
}

extension UIControlPosition$Ext on UIControlPosition {
  js.ControlPosition get position {
    switch (anchor) {
      case UIControlAnchor.topLeft:
        return js.ControlPosition()
          ..top = "${offset.y}px"
          ..left = "${offset.x}px";
      case UIControlAnchor.topCenter:
        return js.ControlPosition()..top = "${offset.y}px";
      case UIControlAnchor.topRight:
        return js.ControlPosition()
          ..top = "${offset.y}px"
          ..right = "${offset.x}px";
      case UIControlAnchor.centerLeft:
        return js.ControlPosition()..left = "${offset.x}px";
      case UIControlAnchor.center:
        return js.ControlPosition();
      case UIControlAnchor.centerRight:
        return js.ControlPosition()..right = "${offset.x}px";
      case UIControlAnchor.bottomLeft:
        return js.ControlPosition()
          ..left = "${offset.x}px"
          ..bottom = "${offset.y}px";
      case UIControlAnchor.bottomCenter:
        return js.ControlPosition()..bottom = "${offset.y}px";
      case UIControlAnchor.bottomRight:
        return js.ControlPosition()
          ..bottom = "${offset.y}px"
          ..right = "${offset.x}px";
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
    return Poi(name: name, position: lnglat.position);
  }
}
