import 'dart:async';
import 'dart:html';
import 'dart:ui_web' as ui_web;

import 'package:amap_flutter/amap_flutter.dart';

import 'amap_flutter_web_api.dart';
import 'js/js.dart';
import 'utils.dart';

class AMapFlutterWebController extends AMapFlutterPlatformInterface {
  final Map<int, AMapFlutterWebApi> _maps = <int, AMapFlutterWebApi>{};
  final Completer<void> completer = Completer<void>();

  /// Accesses the AMapFlutterWebApi associated to the passed mapId.
  AMapFlutterWebApi _map(int mapId) {
    final AMapFlutterWebApi? map = _maps[mapId];
    if (map == null) {
      throw UnknownMapIDError(mapId);
    }
    return map;
  }

  @override
  Future<void> init(int mapId, AMapFlutter? aMapFlutter) async {
    AMapFlutterWebApi? map = _maps[mapId];
    if (map == null) {
      DivElement element =
          ui_web.platformViewRegistry.getViewById(mapId) as DivElement;
      ResizeObserver observer = ResizeObserver(
        (List mutations, ResizeObserver observer) {
          if (element.isConnected == true) {
            observer.disconnect();
            onMapContainerAttached(mapId, aMapFlutter);
          }
        },
      );
      observer.observe(element);
    }
    return completer.future;
  }

  void onMapContainerAttached(int mapId, AMapFlutter? aMapFlutter) {
    AMapFlutterWebApi map = AMapFlutterWebApi(mapId, aMapFlutter: aMapFlutter);
    addListener(mapId, map.aMap);
    _maps[mapId] = map;
    completer.complete();
  }

  void addListener(int mapId, AMap map) {
    map.on(
      "complete",
      (_) => mapEventStreamController.add(MapCompleteEvent(mapId)),
    );
    map.on(
      "click",
      (MapsEvent event) => mapEventStreamController
          .add(MapPressEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "dblclick",
      (MapsEvent event) => mapEventStreamController
          .add(MapDoublePressEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "rightclick",
      (MapsEvent event) => mapEventStreamController
          .add(MapRightPressEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "movestart",
      (_) => mapEventStreamController
          .add(MapMoveStartEvent(mapId, map.getCenter().position)),
    );
    map.on(
      "mapmove",
      (_) => mapEventStreamController
          .add(MapMoveEvent(mapId, map.getCenter().position)),
    );
    map.on(
      "moveend",
      (_) => mapEventStreamController
          .add(MapMoveEndEvent(mapId, map.getCenter().position)),
    );
    map.on(
      "resize",
      (_) => mapEventStreamController
          .add(MapResizedEvent(mapId, map.getSize().size)),
    );
    map.on(
      "zoomstart",
      (_) => mapEventStreamController
          .add(ZoomChangeStartEvent(mapId, map.getZoom().toDouble())),
    );
    map.on(
      "zoomchange",
      (_) => mapEventStreamController
          .add(ZoomChangeEvent(mapId, map.getZoom().toDouble())),
    );
    map.on(
      "zoomend",
      (_) => mapEventStreamController
          .add(ZoomChangeEndEvent(mapId, map.getZoom().toDouble())),
    );
    map.on(
      "rotatestart",
      (_) => mapEventStreamController
          .add(RotateChangeStartEvent(mapId, map.getRotation().toDouble())),
    );
    map.on(
      "rotatechange",
      (_) => mapEventStreamController
          .add(RotateChangeEvent(mapId, map.getRotation().toDouble())),
    );
    map.on(
      "rotateend",
      (_) => mapEventStreamController
          .add(RotateChangeEndEvent(mapId, map.getRotation().toDouble())),
    );
    map.on(
      "mousemove",
      (MapsEvent event) => mapEventStreamController
          .add(MouseMoveEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "mousewheel",
      (_) => mapEventStreamController
          .add(MouseWheelEvent(mapId, map.getZoom().toDouble())),
    );
    map.on(
      "mouseover",
      (MapsEvent event) => mapEventStreamController
          .add(MouseOverEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "mouseout",
      (MapsEvent event) => mapEventStreamController
          .add(MouseOutEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "mouseup",
      (MapsEvent event) => mapEventStreamController
          .add(MouseUpEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "mousedown",
      (MapsEvent event) => mapEventStreamController
          .add(MouseDownEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "dragstart",
      (MapsEvent event) => mapEventStreamController
          .add(DragStartEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "dragging",
      (MapsEvent event) => mapEventStreamController
          .add(DraggingEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "dragend",
      (MapsEvent event) => mapEventStreamController
          .add(DragEndEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "touchstart",
      (MapsEvent event) => mapEventStreamController
          .add(TouchStartEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "touchmove",
      (MapsEvent event) => mapEventStreamController
          .add(TouchingEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "touchend",
      (MapsEvent event) => mapEventStreamController
          .add(TouchEndEvent(mapId, event.lnglat.position)),
    );
    map.on(
      "hotspotclick",
      (MapsEvent event) => mapEventStreamController
          .add(PoiClickEvent(mapId, (event as HotspotEvent).poi)),
    );
  }

  @override
  Future<void> setApiKey(ApiKey apiKey) async {
    throw UnsupportedError('setApiKey() has not been supported on web.');
  }

  @override
  Future<void> agreePrivacy(bool agree) async {
    throw UnsupportedError('agreePrivacy() has not been supported on web.');
  }

  @override
  Future<void> updateMapConfig(MapUpdateConfig config,
      {required int mapId}) async {
    _map(mapId).updateMapConfig(config);
  }

  @override
  Future<void> moveCamera(CameraPosition position, int duration,
      {required int mapId}) async {
    _map(mapId).moveCamera(position, duration);
  }

  @override
  Future<void> moveCameraToFitPosition(
    List<Position>? positions,
    EdgePadding padding,
    int duration, {
    required int mapId,
  }) async {
    _map(mapId).moveCameraToFitPosition(positions, padding, duration);
  }

  @override
  Future<void> setRestrictRegion(Region region, {required int mapId}) async {
    _map(mapId).setRestrictRegion(region);
  }

  @override
  Future<void> removeRestrictRegion({required int mapId}) async {
    _map(mapId).removeRestrictRegion();
  }

  @override
  Future<void> addMarker(Marker marker, {required int mapId}) async {
    MarkerJS markerJS = await _map(mapId).addMarker(marker);
    markerJS.on("click", (_) {
      mapEventStreamController.add(MarkerClickEvent(mapId, marker.id));
    });
    markerJS.on("dragstart", (_) {
      mapEventStreamController.add(
        MarkerDragStartEvent(mapId, marker.position, marker.id),
      );
    });
    markerJS.on("dragging", (_) {
      mapEventStreamController.add(
        MarkerDragEvent(mapId, marker.position, marker.id),
      );
    });
    markerJS.on("dragend", (_) {
      mapEventStreamController.add(
        MarkerDragEndEvent(mapId, marker.position, marker.id),
      );
    });
  }

  @override
  Future<void> removeMarker(String id, {required int mapId}) async {
    _map(mapId).removeMarker(id);
  }

  @override
  Future<void> updateMarker(
    String markerId,
    Position position, {
    required int mapId,
  }) async {
    _map(mapId).updateMarker(markerId, position);
  }

  @override
  Future<Location> getUserLocation({required int mapId}) async {
    return _map(mapId).getUserLocation();
  }

  @override
  Future<void> start({required int mapId}) async {}

  @override
  Future<void> pause({required int mapId}) async {}

  @override
  Future<void> resume({required int mapId}) async {}

  @override
  Future<void> destroy({required int mapId}) async {
    if (_maps.containsKey(mapId)) {
      _maps.remove(mapId);
      _maps[mapId]!.aMap.destroy();
    }
  }
}
