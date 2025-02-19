import 'package:amap_flutter/amap_flutter.dart';

import 'js/js.dart';
import 'utils.dart';

class AMapFlutterWebApi {
  AMapFlutterWebApi(int mapId, {AMapFlutter? aMapFlutter})
      : aMap = AMap(
          mapId.toString(),
          aMapFlutter?.mapOptions ?? MapOptions(),
        );

  final AMap aMap;

  Traffic? _traffic;
  Buildings? _buildings;
  IndoorMap? _indoorMap;
  Satellite? _satellite;
  RoadNet? _roadNet;

  ControlBar? _controlBar;
  Scale? _scale;
  ToolBar? _toolbar;
  Geolocation? _geolocation;
  HawkEye? _hawkEye;
  MapTypeControl? _mapTypeControl;

  final Map<String, MarkerJS> markers = {};

  Future<void> updateMapConfig(MapUpdateConfig config) async {
    if (config.mapStyle != null) {
      aMap.setMapStyle(config.mapStyle!);
    }
    if (config.mapFeatures != null) {
      aMap.setFeatures(config.mapFeatures!);
    }
    if (config.dragEnable != null ||
        config.zoomEnable != null ||
        config.tiltEnable != null ||
        config.rotateEnable != null) {
      Map<String, bool> status = {};
      if (config.dragEnable != null) {
        status["dragEnable"] = config.dragEnable!;
      }
      if (config.zoomEnable != null) {
        status["zoomEnable"] = config.zoomEnable!;
      }
      if (config.tiltEnable != null) {
        status["tiltEnable"] = config.tiltEnable!;
      }
      if (config.rotateEnable != null) {
        status["rotateEnable"] = config.rotateEnable!;
      }
      aMap.setStatus(status);
    }
    if (config.compassControlEnabled != null || config.compassControlPosition != null) {
      if (_controlBar != null) {
        aMap.removeControl(_controlBar!);
        _controlBar == null;
      }
      if (config.compassControlEnabled == null || config.compassControlEnabled == true) {
        final controlConfig = ControlConfig();
        if (config.compassControlPosition != null) {
          controlConfig.position = config.compassControlPosition!.position;
        }
        _controlBar = ControlBar(controlConfig);
        aMap.addControl(_controlBar!);
      }
    }
    if (config.scaleControlEnabled != null || config.scaleControlPosition != null) {
      if (_scale != null) {
        aMap.removeControl(_scale!);
        _scale = null;
      }
      if (config.scaleControlEnabled == null || config.scaleControlEnabled == true) {
        final controlConfig = ControlConfig();
        if (config.scaleControlPosition != null) {
          controlConfig.position = config.scaleControlPosition!.position;
        }
        _scale = Scale(controlConfig);
        aMap.addControl(_scale!);
      }
    }
    if (config.zoomControlEnabled != null || config.zoomControlPosition != null) {
      if (_toolbar != null) {
        aMap.removeControl(_toolbar!);
        _toolbar = null;
      }
      if (config.zoomControlEnabled == null || config.zoomControlEnabled == true) {
        final controlConfig = ControlConfig();
        if (config.zoomControlPosition != null) {
          controlConfig.position = config.zoomControlPosition!.position;
        }
        _toolbar = ToolBar(controlConfig);
        aMap.addControl(_toolbar!);
      }
    }
    if (config.hawkEyeControlEnabled != null) {
      if (config.hawkEyeControlEnabled!) {
        _hawkEye = HawkEye(HawkEyeOptions());
        aMap.addControl(_hawkEye!);
      } else {
        if (_hawkEye != null) {
          aMap.removeControl(_hawkEye!);
        }
      }
    }
    if (config.mapTypeControlEnabled != null) {
      if (config.mapTypeControlEnabled!) {
        _mapTypeControl = MapTypeControl(MapTypeControlOptions());
        aMap.addControl(_mapTypeControl!);
      } else {
        if (_mapTypeControl != null) {
          aMap.removeControl(_mapTypeControl!);
        }
      }
    }
    if (config.showTraffic != null) {
      if (config.showTraffic!) {
        _traffic = Traffic(TrafficLayerOptions());
        aMap.addLayer(_traffic!);
      } else {
        if (_traffic != null) {
          aMap.removeLayer(_traffic!);
        }
      }
    }
    if (config.showBuildings != null) {
      if (config.showBuildings!) {
        _buildings = Buildings(BuildingLayerOptions());
        aMap.addLayer(_buildings!);
      } else {
        if (_buildings != null) {
          aMap.removeLayer(_buildings!);
        }
      }
    }
    if (config.showIndoorMap != null) {
      if (config.showIndoorMap!) {
        _indoorMap = IndoorMap(IndoorMapOptions());
        aMap.addLayer(_indoorMap!);
      } else {
        if (_indoorMap != null) {
          aMap.removeLayer(_indoorMap!);
        }
      }
    }
    if (config.showSatelliteLayer != null) {
      if (config.showSatelliteLayer!) {
        _satellite = Satellite(SatelliteLayerOptions());
        aMap.addLayer(_satellite!);
      } else {
        if (_satellite != null) {
          aMap.removeLayer(_satellite!);
        }
      }
    }
    if (config.showRoadNetLayer != null) {
      if (config.showRoadNetLayer!) {
        _roadNet = RoadNet(RoadnetLayerOptions());
        aMap.addLayer(_roadNet!);
      } else {
        if (_roadNet != null) {
          aMap.removeLayer(_roadNet!);
        }
      }
    }
    if (config.userLocationConfig != null) {
      if (_geolocation != null) {
        aMap.removeControl(_geolocation!);
        _geolocation = null;
      }
      if (config.userLocationConfig!.userLocationButton != null ||
          config.userLocationConfig!.showUserLocation != null ||
          config.userLocationConfig!.userLocationStyle != null) {
        final options = GeolocationOptions();
        if (config.userLocationConfig!.userLocationButton != null) {
          options.showButton = config.userLocationConfig!.userLocationButton!;
        }
        if (config.userLocationConfig!.showUserLocation != null) {
          options.showMarker = config.userLocationConfig!.showUserLocation!;
        }
        if (config.userLocationConfig!.userLocationStyle != null) {
          final userLocationStyle = config.userLocationConfig!.userLocationStyle!;
          final circleOptions = CircleOptions();
          if (userLocationStyle.fillColor != null) {
            circleOptions.fillColor = "#${userLocationStyle.fillColor!.value.toRadixString(16)}";
          }
          if (userLocationStyle.strokeColor != null) {
            circleOptions.strokeColor =
                "#${userLocationStyle.strokeColor!.value.toRadixString(16)}";
          }
          if (userLocationStyle.lineWidth != null) {
            circleOptions.strokeWeight = userLocationStyle.lineWidth!;
          }
          options.circleOptions = circleOptions;
          if (userLocationStyle.image?.icon != null) {
            options.markerOptions = MarkerOptions()..icon = userLocationStyle.image!.icon!;
          }
        }
        _geolocation = Geolocation(options);
        aMap.addControl(_geolocation!);
      }
    }
  }

  Future<void> moveCamera(CameraPosition position, int duration) async {
    aMap.setZoomAndCenter(
      position.zoom,
      position.latLng.lngLat,
      duration == 0,
      duration,
    );
  }

  Future<void> moveCameraToFitPosition(
      List<LngLat>? positions, EdgePadding padding, int duration) async {
    final overlays =
        positions?.map((position) => MarkerJS(MarkerOptions()..position = position)).toList();
    aMap.setFitView(
      overlays,
      duration == 0,
      [padding.top, padding.bottom, padding.left, padding.right],
    );
  }

  Future<void> setRestrictRegion(Region region) async {
    aMap.setLimitBounds(region.bounds);
  }

  Future<void> removeRestrictRegion() async {
    aMap.clearLimitBounds();
  }

  Future<MarkerJS> addMarker(Marker marker) async {
    final markerJS = MarkerJS(marker.marker);
    aMap.addOverlay(markerJS);
    markers[marker.id] = markerJS;
    return markerJS;
  }

  Future<void> removeMarker(String id) async {
    if (markers[id] != null) {
      aMap.removeOverlay(markers[id]!);
      markers.remove(id);
    }
  }

  Future<void> updateMarker(String markerId, LatLng latLng) async {
    removeMarker(markerId);
    addMarker(Marker(id: markerId, latLng: latLng));
  }

  Future<Location> getUserLocation() async {
    throw UnimplementedError();
  }

  Future<void> start() async {}

  Future<void> pause() async {}

  Future<void> resume() async {}

  Future<void> destroy() async {}
}
