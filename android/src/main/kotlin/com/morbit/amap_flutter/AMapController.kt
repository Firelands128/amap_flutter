package com.morbit.amap_flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMethodCodec

class AMapController(viewId: Int, binding: FlutterPluginBinding, private val api: AMapApi) {
  private val channel: MethodChannel

  init {
    channel = MethodChannel(
      binding.binaryMessenger,
      "plugins.flutter.dev/amap_$viewId",
      StandardMethodCodec(AMapApiCodec),
    )
    channel.setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
      this.onMethodCall(call, result)
    }
  }

  private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "updateMapConfig" -> {
        val config = call.argument<MapUpdateConfig>("config")!!
        api.updateMapConfig(config)
        result.success(null)
      }

      "getUserLocation" -> {
        result.success(api.getUserLocation())
      }

      "moveCamera" -> {
        val position = call.argument<CameraPosition>("position")!!
        val duration = call.argument<Long>("duration")!!
        api.moveCamera(position, duration)
        result.success(null)
      }

      "moveCameraToRegion" -> {
        val region = call.argument<Region>("region")!!
        val duration = call.argument<Long>("duration")!!
        api.moveCameraToRegion(region, duration)
        result.success(null)
      }

      "moveCameraToRegionWithPosition" -> {
        val positions = call.argument<List<Position?>>("positions")!!
        val padding = call.argument<EdgePadding>("padding")!!
        val duration = call.argument<Long>("duration")!!
        api.moveCameraToRegionWithPosition(positions, padding, duration)
        result.success(null)
      }

      "setRestrictRegion" -> {
        val region = call.argument<Region>("region")!!
        api.setRestrictRegion(region)
        result.success(null)
      }

      "removeRestrictRegion" -> {
        api.removeRestrictRegion()
        result.success(null)
      }

      "addMarker" -> {
        val marker = call.argument<Marker>("marker")!!
        api.addMarker(marker)
        result.success(null)
      }

      "removeMarker" -> {
        val id = call.argument<String>("id")!!
        api.removeMarker(id)
        result.success(null)
      }

      "start" -> {
        api.start()
        result.success(null)
      }

      "pause" -> {
        api.pause()
        result.success(null)
      }

      "resume" -> {
        api.resume()
        result.success(null)
      }

      "destroy" -> {
        api.destroy()
        result.success(null)
      }
    }
  }

  /// 当地图加载完成时触发该回调
  fun onMapCompleted() {
    api.initMap()
    channel.invokeMethod(
      "onMapCompleted",
      null,
    )
  }

  /// 当点击地图上任意地点时会触发该回调，方法会传入点击的坐标点，事件可能被上层覆盖物拦截
  fun onMapPress(position: Position) {
    channel.invokeMethod(
      "onMapPress",
      mapOf(
        "position" to position,
      ),
    )
  }

  /// 当地图上任意地点进行长按点击时会触发该回调，事件可能被上层覆盖物拦截（Android Only）
  fun onMapLongPress(position: Position) {
    channel.invokeMethod(
      "onMapLongPress",
      mapOf(
        "position" to position,
      ),
    )
  }

  /// 当地图视野发生变化时触发该回调。视野持续变化时本回调可能会被频繁多次调用, 请不要做耗时或复杂的事情
  fun onCameraChange(cameraPosition: CameraPosition) {
    channel.invokeMethod(
      "onCameraChange",
      mapOf(
        "camera" to cameraPosition,
      ),
    )
  }

  /// 当地图视野变化完成时触发该回调，需注意当前地图状态有可能并不是稳定状态
  fun onCameraChangeFinish(cameraPosition: CameraPosition) {
    channel.invokeMethod(
      "onCameraChangeFinish",
      mapOf(
        "camera" to cameraPosition,
      ),
    )
  }

  /// 当点击地图上任意的POI时调用，方法会传入点击的POI信息
  fun onPoiClick(poi: Poi) {
    channel.invokeMethod(
      "onPoiClick",
      mapOf(
        "poi" to poi,
      ),
    )
  }

  /// 当点击点标记时触发该回调（Android Only）
  fun onMarkerClick(markerId: String) {
    channel.invokeMethod(
      "onMarkerClick",
      mapOf(
        "markerId" to markerId,
      ),
    )
  }

  /// 当开始拖动点标记时触发该回调（Android Only）
  fun onMarkerDragStart(markerId: String, position: Position) {
    channel.invokeMethod(
      "onMarkerDragStart",
      mapOf(
        "markerId" to markerId,
        "position" to position,
      ),
    )
  }

  /// 当拖动点标记时触发该回调（Android Only）
  fun onMarkerDrag(markerId: String, position: Position) {
    channel.invokeMethod(
      "onMarkerDrag",
      mapOf(
        "markerId" to markerId,
        "position" to position,
      ),
    )
  }

  /// 当拖动点标记完成时触发该回调（Android Only）
  fun onMarkerDragEnd(markerId: String, position: Position) {
    channel.invokeMethod(
      "onMarkerDragEnd",
      mapOf(
        "markerId" to markerId,
        "position" to position,
      ),
    )
  }

  /// 当前位置改变时触发该回调（Android Only）
  fun onUserLocationChange(location: Location) {
    channel.invokeMethod(
      "onUserLocationChange",
      mapOf(
        "location" to location,
      ),
    )
  }
}
