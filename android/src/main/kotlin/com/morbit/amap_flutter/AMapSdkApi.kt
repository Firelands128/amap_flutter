package com.morbit.amap_flutter

import android.content.Context
import com.amap.api.maps.MapsInitializer
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AMapSdkApi {
  companion object {
    fun setup(binding: FlutterPluginBinding) {
      val initializerChannel = MethodChannel(binding.binaryMessenger, "plugins.flutter.dev/amap_initializer")
      initializerChannel.setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
        if (call.method == "agreePrivacy") {
          val agree = call.argument<Boolean>("agree")!!
          agreePrivacy(binding.applicationContext, agree)
          result.success(null)
        } else if (call.method == "setApiKey") {
          val apiKey = call.argument<String>("androidKey")!!
          setApiKey(apiKey)
          result.success(null)
        }
      }
    }

    private fun agreePrivacy(context: Context, agreePrivacy: Boolean) {
      MapsInitializer.updatePrivacyShow(context, agreePrivacy, agreePrivacy)
      MapsInitializer.updatePrivacyAgree(context, agreePrivacy)
    }

    private fun setApiKey(apiKey: String) {
      MapsInitializer.setApiKey(apiKey)
    }
  }
}
