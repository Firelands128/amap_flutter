package com.morbit.amap_flutter

import android.content.Context
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import com.amap.api.maps.AMapOptions
import com.amap.api.maps.MapView
import com.amap.api.maps.model.Marker
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.platform.PlatformView


class AMapFlutter(
  context: Context,
  viewId: Int,
  val binding: FlutterPlugin.FlutterPluginBinding,
  lifecycleProvider: () -> Lifecycle?,
  args: HashMap<*, *>
) : PlatformView, DefaultLifecycleObserver {
  private val mapView: MapView
  private val locationSource = AMapLocationSource(context)
  val controller: AMapController
  val markers = mutableMapOf<String, Marker>()
  val aMapMarkerIdToDartMarkerId = mutableMapOf<String, String>()

  override fun getView(): MapView {
    return mapView
  }

  override fun dispose() {}

  init {
    val mapOptions = AMapOptions()
    if (args["options"] != null) {
      val config = MapInitConfig.fromList(args["options"] as List<Any?>)
      config.mapType?.toMapType()?.let { mapOptions.mapType(it) }
      config.cameraPosition?.toCameraPosition()?.let { mapOptions.camera(it) }
      config.dragEnable?.let { mapOptions.scrollGesturesEnabled(it) }
      config.zoomEnable?.let { mapOptions.zoomGesturesEnabled(it) }
      config.tiltEnable?.let { mapOptions.tiltGesturesEnabled(it) }
      config.rotateEnable?.let { mapOptions.rotateGesturesEnabled(it) }
      config.compassControlEnabled?.let { mapOptions.compassEnabled(it) }
      config.scaleControlEnabled?.let { mapOptions.scaleControlsEnabled(it) }
      config.zoomControlEnabled?.let { mapOptions.zoomControlsEnabled(it) }
      config.logoPosition?.anchor?.toLogoPosition()?.let { mapOptions.logoPosition(it) }
    }
    mapView = MapView(context, mapOptions)
    controller = AMapController(viewId, binding, AMapApi(this))
    lifecycleProvider()?.addObserver(this)
    mapView.map.setLocationSource(locationSource)
    setTencentMapListener()
  }

  private fun setTencentMapListener() {
    val mapListener = AMapListener(this)
    mapView.map.setOnMapLoadedListener(mapListener)
    mapView.map.setOnMapClickListener(mapListener)
    mapView.map.setOnMapLongClickListener(mapListener)
    mapView.map.setOnCameraChangeListener(mapListener)
    mapView.map.setOnPOIClickListener(mapListener)
    mapView.map.setOnMarkerClickListener(mapListener)
    mapView.map.setOnMarkerDragListener(mapListener)
    mapView.map.setOnMyLocationChangeListener(mapListener)
  }

  override fun onCreate(owner: LifecycleOwner) {
    mapView.onCreate(null)
  }

  override fun onResume(owner: LifecycleOwner) {
    mapView.onResume()
  }

  override fun onPause(owner: LifecycleOwner) {
    mapView.onPause()
  }

  override fun onDestroy(owner: LifecycleOwner) {
    mapView.onDestroy()
  }
}
