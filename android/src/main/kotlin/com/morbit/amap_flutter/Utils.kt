package com.morbit.amap_flutter

import android.graphics.BitmapFactory
import com.amap.api.maps.AMap
import com.amap.api.maps.AMapOptions
import com.amap.api.maps.model.BitmapDescriptor
import com.amap.api.maps.model.BitmapDescriptorFactory
import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.LatLngBounds
import com.amap.api.maps.model.MarkerOptions
import com.amap.api.maps.model.MyLocationStyle
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import android.location.Location as AndroidLocation
import com.amap.api.maps.model.CameraPosition as AMapCameraPosition
import com.amap.api.maps.model.Poi as AMapPoi

fun MapType.toMapType(): Int? {
  return when (this) {
    MapType.STANDARD -> AMap.MAP_TYPE_NORMAL
    MapType.SATELLITE -> AMap.MAP_TYPE_SATELLITE
    MapType.STANDARD_NIGHT -> AMap.MAP_TYPE_NIGHT
    MapType.NAVI -> AMap.MAP_TYPE_NAVI
    MapType.BUS -> AMap.MAP_TYPE_BUS
    else -> null
  }
}

fun UIControlAnchor.toLogoPosition(): Int? {
  return when (this) {
    UIControlAnchor.BOTTOM_LEFT -> AMapOptions.LOGO_POSITION_BOTTOM_LEFT
    UIControlAnchor.BOTTOM_CENTER -> AMapOptions.LOGO_POSITION_BOTTOM_CENTER
    UIControlAnchor.BOTTOM_RIGHT -> AMapOptions.LOGO_POSITION_BOTTOM_RIGHT
    else -> null
  }
}

fun UIControlAnchor.toZoomPosition(): Int? {
  return when (this) {
    UIControlAnchor.CENTER_RIGHT -> AMapOptions.ZOOM_POSITION_RIGHT_CENTER
    UIControlAnchor.BOTTOM_RIGHT -> AMapOptions.ZOOM_POSITION_RIGHT_BUTTOM
    else -> null
  }
}

fun Bitmap.toBitmapDescriptor(binding: FlutterPluginBinding): BitmapDescriptor? {
  asset?.let {
    return BitmapDescriptorFactory.fromAsset(binding.flutterAssets.getAssetFilePathByName(it))
  }
  bytes?.let {
    return BitmapDescriptorFactory.fromBitmap(BitmapFactory.decodeByteArray(it, 0, it.size))
  }
  return null
}

fun AMapCameraPosition.toCameraPosition(): CameraPosition {
  return CameraPosition(
    target.toPosition(),
    bearing.toDouble(),
    tilt.toDouble(),
    zoom.toDouble(),
  )
}

fun CameraPosition.toCameraPosition(): AMapCameraPosition {
  return AMapCameraPosition.Builder().let { builder ->
    position?.let { builder.target(position.toPosition()) }
    skew?.let { builder.tilt(skew.toFloat()) }
    zoom?.let { builder.zoom(zoom.toFloat()) }
    heading?.let { builder.bearing(heading.toFloat()) }
    builder.build()
  }
}

fun AndroidLocation.toLocation(): Location {
  return Location(
    Position(latitude, longitude), bearing.toDouble(), accuracy.toDouble()
  )
}

fun Marker.toMarkerOptions(): MarkerOptions {
  return MarkerOptions().let { options ->
    position.toPosition().let { options.position(it) }
    options
  }
}

fun AMapPoi.toPoi(): Poi {
  return Poi(name, coordinate.toPosition())
}

fun Position.toPosition(): LatLng {
  return LatLng(latitude, longitude)
}

fun LatLng.toPosition(): Position {
  return Position(latitude, longitude)
}

fun Region.toLatLngBounds(): LatLngBounds {
  return LatLngBounds(LatLng(south, west), LatLng(north, east))
}

fun UserLocationStyle.toLocationStyle(binding: FlutterPluginBinding): MyLocationStyle {
  val myLocationStyle = MyLocationStyle()
  userLocationType?.toMyLocationType()?.let { myLocationStyle.myLocationType(it) }
  fillColor?.toArgb()?.let { myLocationStyle.radiusFillColor(it) }
  strokeColor?.toArgb()?.let { myLocationStyle.strokeColor(it) }
  lineWidth?.toFloat()?.let { myLocationStyle.strokeWidth(it) }
  image?.let { myLocationStyle.myLocationIcon(it.toBitmapDescriptor(binding)) }
  return myLocationStyle
}

fun UserLocationType.toMyLocationType(): Int {
  return when (this) {
    UserLocationType.LOCATION_TYPE_SHOW -> MyLocationStyle.LOCATION_TYPE_SHOW
    UserLocationType.LOCATION_TYPE_LOCATE -> MyLocationStyle.LOCATION_TYPE_LOCATE
    UserLocationType.LOCATION_TYPE_FOLLOW -> MyLocationStyle.LOCATION_TYPE_FOLLOW
    UserLocationType.LOCATION_TYPE_MAP_ROTATE -> MyLocationStyle.LOCATION_TYPE_MAP_ROTATE
    UserLocationType.LOCATION_TYPE_LOCATION_ROTATE -> MyLocationStyle.LOCATION_TYPE_LOCATION_ROTATE
    UserLocationType.LOCATION_TYPE_LOCATION_ROTATE_NO_CENTER -> MyLocationStyle.LOCATION_TYPE_LOCATION_ROTATE_NO_CENTER
    UserLocationType.LOCATION_TYPE_FOLLOW_NO_CENTER -> MyLocationStyle.LOCATION_TYPE_FOLLOW_NO_CENTER
    UserLocationType.LOCATION_TYPE_MAP_ROTATE_NO_CENTER -> MyLocationStyle.LOCATION_TYPE_MAP_ROTATE_NO_CENTER
  }
}
