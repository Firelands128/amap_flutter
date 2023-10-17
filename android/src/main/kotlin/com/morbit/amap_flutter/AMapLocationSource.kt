package com.morbit.amap_flutter

import android.content.Context
import com.amap.api.location.AMapLocation
import com.amap.api.location.AMapLocationClient
import com.amap.api.location.AMapLocationListener
import com.amap.api.maps.LocationSource
import android.location.Location as AndroidLocation

class AMapLocationSource(context: Context) : LocationSource, AMapLocationListener {
  /// 声明AMapLocationClient类对象
  private var locationClient: AMapLocationClient?
  private var locationChangedListener: LocationSource.OnLocationChangedListener? = null

  /**
   * 定位的一些初始化设置
   */
  init {
    /// 初始化定位
    locationClient = AMapLocationClient(context.applicationContext)
    /// 设置定位回调监听
    locationClient?.setLocationListener(this)
  }

  override fun activate(onLocationChangedListener: LocationSource.OnLocationChangedListener?) {
    /// 保存地图返回的位置监听器
    locationChangedListener = onLocationChangedListener
    /// 启动定位
    locationClient?.stopLocation()
    locationClient?.startLocation()
  }

  override fun deactivate() {
    //当不需要展示定位点时，需要停止定位并释放相关资源
    locationChangedListener = null
    locationClient?.stopLocation()
    locationClient?.onDestroy()
    locationClient = null
  }

  /**
   * 腾讯定位SDK位置变化回调
   */
  override fun onLocationChanged(amapLocation: AMapLocation?) {
    if (amapLocation != null && amapLocation.errorCode == 0) {
      //可在其中解析amapLocation获取相应内容。
      val location = AndroidLocation(amapLocation.provider)
      location.latitude = amapLocation.latitude
      location.longitude = amapLocation.longitude
      location.bearing = amapLocation.bearing
      location.accuracy = amapLocation.accuracy
      locationChangedListener?.onLocationChanged(location)
    }
  }
}