package com.morbit.amap_flutter

import com.amap.api.maps.CameraUpdateFactory
import com.amap.api.maps.model.LatLngBounds

class AMapApi(private val amap: AMapFlutter, private val config: MapInitConfig?) {
  private val mapView = amap.view

  fun initMap() {
    config?.fitPositions?.let { positions ->
      val latLngBoundsBuilder = LatLngBounds.builder()
      positions.forEach { latLngBoundsBuilder.include(it.toPosition()) }
      val latLngBounds = latLngBoundsBuilder.build()
      val cameraUpdate = CameraUpdateFactory.newLatLngBounds(latLngBounds, 0)
      mapView.map.moveCamera(cameraUpdate)
    }
  }

  fun updateMapConfig(config: MapUpdateConfig) {
    config.mapType?.toMapType()?.let { mapView.map.mapType = it }
    config.dragEnable?.let { mapView.map.uiSettings.isScrollGesturesEnabled = it }
    config.zoomEnable?.let { mapView.map.uiSettings.isZoomGesturesEnabled = it }
    config.tiltEnable?.let { mapView.map.uiSettings.isTiltGesturesEnabled = it }
    config.rotateEnable?.let { mapView.map.uiSettings.isRotateGesturesEnabled = it }
    config.compassControlEnabled?.let { mapView.map.uiSettings.isCompassEnabled = it }
    config.scaleControlEnabled?.let { mapView.map.uiSettings.isScaleControlsEnabled = it }
    config.zoomControlEnabled?.let { mapView.map.uiSettings.isZoomControlsEnabled = it }
    config.logoPosition?.anchor?.toLogoPosition()?.let { mapView.map.uiSettings.logoPosition = it }
    config.zoomControlPosition?.anchor?.toZoomPosition()?.let { mapView.map.uiSettings.zoomPosition = it }
    config.showTraffic?.let { mapView.map.isTrafficEnabled = it }
    config.showBuildings?.let { mapView.map.showBuildings(it) }
    config.showIndoorMap?.let { mapView.map.showIndoorMap(it) }
    config.userLocationConfig?.let {
      it.userLocationButton?.let { showButton -> mapView.map.uiSettings.isMyLocationButtonEnabled = showButton }
      it.showUserLocation?.let { showLocation -> mapView.map.isMyLocationEnabled = showLocation }
      it.userLocationStyle?.toLocationStyle(amap.binding)?.let { style -> mapView.map.myLocationStyle = style }
    }
  }

  fun moveCamera(position: CameraPosition, duration: Long) {
    val cameraPosition = position.toCameraPosition()
    val cameraUpdate = CameraUpdateFactory.newCameraPosition(cameraPosition)
    if (duration > 0) {
      mapView.map.stopAnimation()
      mapView.map.animateCamera(cameraUpdate, duration, null)
    } else {
      mapView.map.moveCamera(cameraUpdate)
    }
  }

  fun moveCameraToRegion(region: Region, duration: Long) {
    val latLngBounds = region.toLatLngBounds()
    val cameraUpdate = CameraUpdateFactory.newLatLngBounds(latLngBounds, 0)
    if (duration > 0) {
      mapView.map.stopAnimation()
      mapView.map.animateCamera(cameraUpdate, duration, null)
    } else {
      mapView.map.moveCamera(cameraUpdate)
    }
  }

  fun moveCameraToRegionWithPosition(positions: List<Position?>, padding: EdgePadding, duration: Long) {
    val latLngBoundsBuilder = LatLngBounds.builder()
    positions.filterNotNull().forEach { latLngBoundsBuilder.include(it.toPosition()) }
    val latLngBounds = latLngBoundsBuilder.build()
    val cameraUpdate = CameraUpdateFactory.newLatLngBoundsRect(
      latLngBounds,
      padding.left.toInt(),
      padding.right.toInt(),
      padding.top.toInt(),
      padding.bottom.toInt(),
    )
    if (duration > 0) {
      mapView.map.stopAnimation()
      mapView.map.animateCamera(cameraUpdate, duration, null)
    } else {
      mapView.map.moveCamera(cameraUpdate)
    }
  }

  fun setRestrictRegion(region: Region) {
    mapView.map.setMapStatusLimits(region.toLatLngBounds())
  }

  fun removeRestrictRegion() {
    mapView.map.setMapStatusLimits(null)
  }

  fun addMarker(marker: Marker) {
    val aMapMarker = mapView.map.addMarker(marker.toMarkerOptions())
    amap.markers[marker.id] = aMapMarker
    amap.aMapMarkerIdToDartMarkerId[aMapMarker.id] = marker.id
  }

  fun removeMarker(id: String) {
    val marker = amap.markers[id]
    if (marker != null) {
      marker.remove()
      amap.markers.remove(id)
      amap.aMapMarkerIdToDartMarkerId.remove(marker.id)
    }
  }

  fun updateMarker(markerId: String, position: Position) {
    this.removeMarker(markerId)
    this.addMarker(Marker(markerId, position))
  }

  fun getUserLocation(): Location? {
    return mapView.map.myLocation?.toLocation()
  }

  fun start() {
    mapView.onCreate(null)
  }

  fun pause() {
    mapView.onPause()
  }

  fun resume() {
    mapView.onResume()
  }

  fun destroy() {
    mapView.onDestroy()
  }
}
