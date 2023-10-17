package com.morbit.amap_flutter

import android.location.Location
import com.amap.api.maps.AMap
import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.Poi
import com.amap.api.maps.model.CameraPosition as AMapCameraPosition
import com.amap.api.maps.model.Marker as AMapMarker


class AMapListener(private val amap: AMapFlutter) : TencentMapListenerInterface {
  override fun onMapLoaded() {
    amap.controller.onMapCompleted()
  }

  override fun onMapClick(latLng: LatLng) {
    amap.controller.onMapPress(latLng.toPosition())
  }

  override fun onMapLongClick(latLng: LatLng) {
    amap.controller.onMapLongPress(latLng.toPosition())
  }

  override fun onCameraChange(position: AMapCameraPosition) {
    amap.controller.onCameraChange(position.toCameraPosition())
  }

  override fun onCameraChangeFinish(position: AMapCameraPosition) {
    amap.controller.onCameraChangeFinish(position.toCameraPosition())
  }

  override fun onPOIClick(poi: Poi) {
    amap.controller.onPoiClick(poi.toPoi())
  }

  override fun onMarkerClick(marker: AMapMarker): Boolean {
    val markerId: String = amap.aMapMarkerIdToDartMarkerId[marker.id] ?: return false
    amap.controller.onMarkerClick(markerId)
    return true
  }

  override fun onMarkerDragStart(marker: AMapMarker) {
    val markerId: String = amap.aMapMarkerIdToDartMarkerId[marker.id] ?: return
    amap.controller.onMarkerDragStart(markerId, marker.position.toPosition())
  }

  override fun onMarkerDrag(marker: AMapMarker) {
    val markerId: String = amap.aMapMarkerIdToDartMarkerId[marker.id] ?: return
    amap.controller.onMarkerDrag(markerId, marker.position.toPosition())
  }

  override fun onMarkerDragEnd(marker: AMapMarker) {
    val markerId: String = amap.aMapMarkerIdToDartMarkerId[marker.id] ?: return
    amap.controller.onMarkerDragEnd(markerId, marker.position.toPosition())
  }

  override fun onMyLocationChange(location: Location) {
    amap.controller.onUserLocationChange(location.toLocation())
  }
}

internal interface TencentMapListenerInterface :
  AMap.OnMapLoadedListener,
  AMap.OnMapClickListener,
  AMap.OnMapLongClickListener,
  AMap.OnCameraChangeListener,
  AMap.OnPOIClickListener,
  AMap.OnMarkerClickListener,
  AMap.OnMarkerDragListener,
  AMap.OnMyLocationChangeListener
