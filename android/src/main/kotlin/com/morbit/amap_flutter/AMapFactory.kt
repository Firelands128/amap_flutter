package com.morbit.amap_flutter

import android.content.Context
import androidx.lifecycle.Lifecycle
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AMapFactory(
  private val binding: FlutterPlugin.FlutterPluginBinding,
  private val lifecycleProvider: () -> Lifecycle?,
) :
  PlatformViewFactory(StandardMessageCodec.INSTANCE) {
  override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
    return AMapFlutter(context!!, viewId, binding, lifecycleProvider, args as HashMap<*, *>)
  }
}
