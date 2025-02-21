package com.morbit.amap_flutter

import android.graphics.Color

/** 地图类型 */
enum class MapType(val raw: Int) {
  STANDARD(0),
  SATELLITE(1),
  STANDARD_NIGHT(2),
  NAVI(3),
  BUS(4),
  NAVI_NIGHT(5);

  companion object {
    fun ofRaw(raw: Int): MapType? {
      return MapType.values().firstOrNull { it.raw == raw }
    }
  }
}

/** UI控件位置锚点 */
enum class UIControlAnchor(val raw: Int) {
  TOP_LEFT(0),
  TOP_CENTER(1),
  TOP_RIGHT(2),
  CENTER_LEFT(3),
  CENTER(4),
  CENTER_RIGHT(5),
  BOTTOM_LEFT(6),
  BOTTOM_CENTER(7),
  BOTTOM_RIGHT(8);

  companion object {
    fun ofRaw(raw: Int): UIControlAnchor? {
      return UIControlAnchor.values().firstOrNull { it.raw == raw }
    }
  }
}

/** 用户定位类型 */
enum class UserLocationType(val raw: Int) {
  ///只定位一次（Android Only）
  LOCATION_TYPE_SHOW(0),

  ///定位一次，且将视角移动到地图中心点
  LOCATION_TYPE_LOCATE(1),

  ///连续定位、且将视角移动到地图中心点，定位蓝点跟随设备移动。（1秒1次定位）
  LOCATION_TYPE_FOLLOW(2),

  ///连续定位、且将视角移动到地图中心点，地图依照设备方向旋转，定位点会跟随设备移动。（1秒1次定位）
  LOCATION_TYPE_MAP_ROTATE(3),

  ///连续定位、且将视角移动到地图中心点，定位点依照设备方向旋转，并且会跟随设备移动。（1秒1次定位）默认执行此种模式（Android Only）
  LOCATION_TYPE_LOCATION_ROTATE(4),

  ///连续定位、蓝点不会移动到地图中心点，定位点依照设备方向旋转，并且蓝点会跟随设备移动（Android Only）
  LOCATION_TYPE_LOCATION_ROTATE_NO_CENTER(5),

  ///连续定位、蓝点不会移动到地图中心点，并且蓝点会跟随设备移动（Android Only）
  LOCATION_TYPE_FOLLOW_NO_CENTER(6),

  ///连续定位、蓝点不会移动到地图中心点，地图依照设备方向旋转，并且蓝点会跟随设备移动（Android Only）
  LOCATION_TYPE_MAP_ROTATE_NO_CENTER(7);

  companion object {
    fun ofRaw(raw: Int): UserLocationType? {
      return UserLocationType.values().firstOrNull { it.raw == raw }
    }
  }
}

/** 点标记图标锚点 */
data class Anchor(
  /** 点标记图标锚点的X坐标 */
  val x: Double,
  /** 点标记图标锚点的Y坐标 */
  val y: Double
) {
  companion object {
    fun fromList(list: List<Any?>): Anchor {
      val x = list[0] as Double
      val y = list[1] as Double
      return Anchor(x, y)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      x,
      y,
    )
  }
}

/** 图片信息 */
data class Bitmap(
  /** 图片资源路径 */
  val asset: String? = null,
  /** 图片数据 */
  val bytes: ByteArray? = null
) {
  companion object {
    fun fromList(list: List<Any?>): Bitmap {
      val asset = list[0] as String?
      val bytes = list[1] as ByteArray?
      return Bitmap(asset, bytes)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      asset,
      bytes,
    )
  }

  override fun equals(other: Any?): Boolean {
    if (this === other) return true
    if (javaClass != other?.javaClass) return false

    other as Bitmap

    if (asset != other.asset) return false
    if (bytes != null) {
      if (other.bytes == null) return false
      if (!bytes.contentEquals(other.bytes)) return false
    } else if (other.bytes != null) return false

    return true
  }

  override fun hashCode(): Int {
    var result = asset?.hashCode() ?: 0
    result = 31 * result + (bytes?.contentHashCode() ?: 0)
    return result
  }
}

/** 地图视野 */
data class CameraPosition(
  /** 地图视野的位置 */
  val position: Position? = null,
  /** 地图视野的旋转角度 */
  val heading: Double? = null,
  /** 地图视野的倾斜角度 */
  val skew: Double? = null,
  /** 地图视野的缩放级别 */
  val zoom: Double? = null
) {
  companion object {
    fun fromList(list: List<Any?>): CameraPosition {
      val position = (list[0] as List<Any?>?)?.let { Position.fromList(it) }
      val heading = list[1] as Double?
      val skew = list[2] as Double?
      val zoom = list[3] as Double?
      return CameraPosition(position, heading, skew, zoom)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      position?.toList(),
      heading,
      skew,
      zoom,
    )
  }
}

/** 视野边缘宽度 */
data class EdgePadding(
  /** 左边缘宽度 */
  val left: Double,
  /** 上边缘宽度 */
  val top: Double,
  /** 右边缘宽度 */
  val right: Double,
  /** 下边缘宽度 */
  val bottom: Double,
) {
  companion object {
    fun fromList(list: List<Any?>): EdgePadding {
      val left = list[0] as Double
      val top = list[1] as Double
      val right = list[2] as Double
      val bottom = list[3] as Double
      return EdgePadding(left, top, right, bottom)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      left,
      top,
      right,
      bottom,
    )
  }
}

/** 定位点 */
data class Location(
  /** 定位点的位置 */
  val position: Position? = null,
  /** 定位点的方向 */
  val heading: Double? = null,
  /** 定位点的精确度 */
  val accuracy: Double? = null
) {
  companion object {
    fun fromList(list: List<Any?>): Location {
      val position = (list[0] as List<Any?>?)?.let { Position.fromList(it) }
      val heading = list[1] as Double?
      val accuracy = list[2] as Double?
      return Location(position, heading, accuracy)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      position?.toList(),
      heading,
      accuracy,
    )
  }
}

/** 地图初始化属性配置 **/
data class MapInitConfig(
  /** 地图类型 */
  val mapType: MapType?,
  /** 地图的显示样式 */
  val mapStyle: String?,
  /** 地图视野 */
  val cameraPosition: CameraPosition?,
  /** 地图视野以适应位置 */
  val fitPositions: List<Position>?,
  /** 地图是否允许拖拽 */
  val dragEnable: Boolean?,
  /** 地图是否允许缩放 */
  val zoomEnable: Boolean?,
  /** 地图是否允许俯仰 */
  val tiltEnable: Boolean?,
  /** 地图是否允许旋转 */
  val rotateEnable: Boolean?,
  /** 地图是否使用缓动效果，默认为true */
  val jogEnable: Boolean?,
  /** 地图平移过程中是否使用动画，默认为true */
  val animateEnable: Boolean?,
  /** 地图是否可通过键盘控制，默认为true */
  val keyboardEnable: Boolean?,
  /** 是否显示指南针控件 */
  val compassControlEnabled: Boolean?,
  /** 是否显示比例尺控件 */
  val scaleControlEnabled: Boolean?,
  /** 是否显示缩放控件(Android Only) */
  val zoomControlEnabled: Boolean?,
  /** Logo位置锚点(Android Only) */
  val logoPosition: UIControlPosition?,
  /** 地图是否可通过双击鼠标放大地图，默认为true */
  val doubleClickZoom: Boolean?,
  /** 地图是否可通过鼠标滚轮缩放浏览，默认为true */
  val scrollWheel: Boolean?,
  /** 地图在移动终端上是否可通过多点触控缩放浏览地图，默认为true */
  val touchZoom: Boolean?,
  /** 手机端双指缩放是否以地图中心为中心，否则以双指中间点为中心，默认为true */
  val touchZoomCenter: Boolean?,
  /** 是否开启地图热点和标注的hover效果，PC端默认是true，移动端默认是 false */
  val isHotspot: Boolean?,
  /** 是否展示地图3D楼块，默认true */
  val showBuildingBlock: Boolean?,
  /** 是否展示地图文字和 POI 信息，默认为true */
  val showLabel: Boolean?,
  /** 是否自动展示室内地图，默认是false */
  val showIndoorMap: Boolean?,
  /** 地图默认鼠标样式 */
  val defaultCursor: String?,
  /** 初始地图视图模式，默认为2D, 3D 地形图 目前仅支持 v2.1Beta，（仅web端有效） */
  val viewMode: String?,
  /** 初始地图是否展示地形，默认为false，（仅web端有效） */
  val terrain: Boolean?,
  /** 地图楼块的侧面颜色 */
  val wallColor: Color?,
  /** 地图楼块的顶面颜色 */
  val roofColor: Color?,
  /** 天空颜色，3D模式下带有俯仰角时会显示 */
  val skyColor: Color?,
) {
  companion object {
    fun fromList(list: List<Any?>): MapInitConfig {
      val mapType = (list[0] as Int?)?.let { MapType.ofRaw(it) }
      val mapStyle = list[1] as String?
      val cameraPosition = (list[2] as List<Any?>?)?.let { CameraPosition.fromList(it) }
      val fitPositions =
        (list[3] as List<Any?>?)?.map { position -> Position.fromList(position as List<Any?>) }
      val dragEnable = list[4] as Boolean?
      val zoomEnable = list[5] as Boolean?
      val tiltEnable = list[6] as Boolean?
      val rotateEnable = list[7] as Boolean?
      val jogEnable = list[8] as Boolean?
      val animateEnable = list[9] as Boolean?
      val keyboardEnable = list[10] as Boolean?
      val compassControlEnabled = list[11] as Boolean?
      val scaleControlEnabled = list[12] as Boolean?
      val zoomControlEnabled = list[13] as Boolean?
      val logoPosition = (list[14] as List<Any?>?)?.let { UIControlPosition.fromList(it) }
      val doubleClickZoom = list[15] as Boolean?
      val scrollWheel = list[16] as Boolean?
      val touchZoom = list[17] as Boolean?
      val touchZoomCenter = list[18] as Boolean?
      val isHotspot = list[19] as Boolean?
      val showBuildingBlock = list[20] as Boolean?
      val showLabel = list[21] as Boolean?
      val showIndoorMap = list[22] as Boolean?
      val defaultCursor = list[23] as String?
      val viewMode = list[24] as String?
      val terrain = list[25] as Boolean?
      val wallColor = (list[26] as Int?)?.let { Color.valueOf(it) }
      val roofColor = (list[27] as Int?)?.let { Color.valueOf(it) }
      val skyColor = (list[28] as Int?)?.let { Color.valueOf(it) }
      return MapInitConfig(
        mapType,
        mapStyle,
        cameraPosition,
        fitPositions,
        dragEnable,
        zoomEnable,
        tiltEnable,
        rotateEnable,
        jogEnable,
        animateEnable,
        keyboardEnable,
        compassControlEnabled,
        scaleControlEnabled,
        zoomControlEnabled,
        logoPosition,
        doubleClickZoom,
        scrollWheel,
        touchZoom,
        touchZoomCenter,
        isHotspot,
        showBuildingBlock,
        showLabel,
        showIndoorMap,
        defaultCursor,
        viewMode,
        terrain,
        wallColor,
        roofColor,
        skyColor,
      )
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      mapType?.raw,
      mapStyle,
      cameraPosition?.toList(),
      fitPositions?.map { it.toList() },
      dragEnable,
      zoomEnable,
      tiltEnable,
      rotateEnable,
      jogEnable,
      animateEnable,
      keyboardEnable,
      compassControlEnabled,
      scaleControlEnabled,
      zoomControlEnabled,
      logoPosition?.toList(),
      doubleClickZoom,
      scrollWheel,
      touchZoom,
      touchZoomCenter,
      isHotspot,
      showBuildingBlock,
      showLabel,
      showIndoorMap,
      defaultCursor,
      viewMode,
      terrain,
      wallColor?.toArgb(),
      roofColor?.toArgb(),
      skyColor?.toArgb(),
    )
  }
}

/** 地图属性配置 */
data class MapUpdateConfig(
  val mapType: MapType? = null,
  val mapStyle: String? = null,
  val mapFeatures: List<String>? = null,
  val dragEnable: Boolean? = null,
  val zoomEnable: Boolean? = null,
  val tiltEnable: Boolean? = null,
  val rotateEnable: Boolean? = null,
  val compassControlEnabled: Boolean? = null,
  val scaleControlEnabled: Boolean? = null,
  val zoomControlEnabled: Boolean? = null,
  val hawkEyeControlEnabled: Boolean? = null,
  val mapTypeControlEnabled: Boolean? = null,
  val logoPosition: UIControlPosition? = null,
  val compassControlPosition: UIControlPosition? = null,
  val scaleControlPosition: UIControlPosition? = null,
  val zoomControlPosition: UIControlPosition? = null,
  val showTraffic: Boolean? = null,
  val showBuildings: Boolean? = null,
  val showIndoorMap: Boolean? = null,
  val showSatelliteLayer: Boolean? = null,
  val showRoadNetLayer: Boolean? = null,
  val userLocationConfig: UserLocationConfig? = null,
) {

  companion object {
    fun fromList(list: List<Any?>): MapUpdateConfig {
      val mapType = (list[0] as Int?)?.let { MapType.ofRaw(it) }
      val mapStyle = list[1] as String?
      val mapFeatures = list[2] as List<String>?
      val dragEnable = list[3] as Boolean?
      val zoomEnable = list[4] as Boolean?
      val tiltEnable = list[5] as Boolean?
      val rotateEnable = list[6] as Boolean?
      val compassControlEnabled = list[7] as Boolean?
      val scaleControlEnabled = list[8] as Boolean?
      val zoomControlEnabled = list[9] as Boolean?
      val hawkEyeControlEnabled = list[10] as Boolean?
      val mapTypeControlEnabled = list[11] as Boolean?
      val logoPosition = (list[12] as List<Any?>?)?.let { UIControlPosition.fromList(it) }
      val compassControlPosition =
        (list[13] as List<Any?>?)?.let { UIControlPosition.fromList(it) }
      val scaleControlPosition =
        (list[14] as List<Any?>?)?.let { UIControlPosition.fromList(it) }
      val zoomControlPosition =
        (list[15] as List<Any?>?)?.let { UIControlPosition.fromList(it) }
      val showTraffic = list[16] as Boolean?
      val showBuildings = list[17] as Boolean?
      val showIndoorMap = list[18] as Boolean?
      val showSatelliteLayer = list[19] as Boolean?
      val showRoadNetLayer = list[20] as Boolean?
      val userLocationConfig =
        (list[21] as List<Any?>?)?.let { UserLocationConfig.fromList(it) }
      return MapUpdateConfig(
        mapType,
        mapStyle,
        mapFeatures,
        dragEnable,
        zoomEnable,
        tiltEnable,
        rotateEnable,
        compassControlEnabled,
        scaleControlEnabled,
        zoomControlEnabled,
        hawkEyeControlEnabled,
        mapTypeControlEnabled,
        logoPosition,
        compassControlPosition,
        scaleControlPosition,
        zoomControlPosition,
        showTraffic,
        showBuildings,
        showIndoorMap,
        showSatelliteLayer,
        showRoadNetLayer,
        userLocationConfig,
      )
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      mapType?.raw,
      mapStyle,
      mapFeatures,
      dragEnable,
      zoomEnable,
      tiltEnable,
      rotateEnable,
      compassControlEnabled,
      scaleControlEnabled,
      zoomControlEnabled,
      hawkEyeControlEnabled,
      mapTypeControlEnabled,
      logoPosition?.toList(),
      compassControlPosition?.toList(),
      scaleControlPosition?.toList(),
      zoomControlPosition?.toList(),
      showTraffic,
      showBuildings,
      showIndoorMap,
      showSatelliteLayer,
      showRoadNetLayer,
      userLocationConfig?.toList(),
    )
  }
}

/** 标记点配置属性 */
data class Marker(
  /** 标记点ID */
  val id: String,
  /** 标记点的位置 */
  val position: Position,
) {
  companion object {
    fun fromList(list: List<Any?>): Marker {
      val id = list[0] as String
      val position = Position.fromList(list[1] as List<Any?>)
      return Marker(id, position)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      id,
      position.toList(),
    )
  }
}

/** 地图兴趣点 */
data class Poi(
  /** 兴趣点的名称 */
  val name: String,
  /** 兴趣点的位置 */
  val position: Position
) {
  companion object {
    fun fromList(list: List<Any?>): Poi {
      val name = list[0] as String
      val position = Position.fromList(list[1] as List<Any?>)
      return Poi(name, position)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      name,
      position.toList(),
    )
  }
}

/** 位置 */
data class Position(
  /** 位置的纬度 */
  val latitude: Double,
  /** 位置的经度 */
  val longitude: Double
) {
  companion object {
    fun fromList(list: List<Any?>): Position {
      val latitude = list[0] as Double
      val longitude = list[1] as Double
      return Position(latitude, longitude)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      latitude,
      longitude,
    )
  }
}

/** 地图区域 */
data class Region(
  /** 最北的纬度 */
  val north: Double,
  /** 最东的经度 */
  val east: Double,
  /** 最南的纬度 */
  val south: Double,
  /** 最西的经度 */
  val west: Double
) {
  companion object {
    fun fromList(list: List<Any?>): Region {
      val north = list[0] as Double
      val east = list[1] as Double
      val south = list[2] as Double
      val west = list[3] as Double
      return Region(north, east, south, west)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      north,
      east,
      south,
      west,
    )
  }
}

/** 对象的像素尺寸 **/
data class Size(
  /** 宽度 **/
  val width: Double,
  /** 高度 **/
  val height: Double,
) {
  companion object {
    fun fromList(list: List<Any?>): Size {
      val width = list[0] as Double
      val height = list[1] as Double
      return Size(width, height)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      width,
      height,
    )
  }
}

/** UI控件位置偏移 */
data class UIControlOffset(
  /** X轴方向的位置偏移 */
  val x: Double,
  /** Y轴方向的位置偏移 */
  val y: Double
) {
  companion object {
    fun fromList(list: List<Any?>): UIControlOffset {
      val x = list[0] as Double
      val y = list[1] as Double
      return UIControlOffset(x, y)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      x,
      y,
    )
  }
}

/** UI控件位置 */
data class UIControlPosition(
  /** UI控件位置锚点 */
  val anchor: UIControlAnchor,
  /** UI控件位置偏移 */
  val offset: UIControlOffset
) {
  companion object {
    fun fromList(list: List<Any?>): UIControlPosition {
      val anchor = UIControlAnchor.ofRaw(list[0] as Int)!!
      val offset = UIControlOffset.fromList(list[1] as List<Any?>)
      return UIControlPosition(anchor, offset)
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      anchor.raw,
      offset.toList(),
    )
  }
}

/** 用户定位配置 */
data class UserLocationConfig(
  val userLocationButton: Boolean?,
  val showUserLocation: Boolean?,
  val userLocationStyle: UserLocationStyle?
) {
  companion object {
    fun fromList(list: List<Any?>): UserLocationConfig {
      val userLocationButton = list[0] as Boolean?
      val showUserLocation = list[1] as Boolean?
      val userLocationStyle = (list[2] as List<Any?>?)?.let { UserLocationStyle.fromList(it) }
      return UserLocationConfig(
        userLocationButton,
        showUserLocation,
        userLocationStyle,
      )
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      this.userLocationButton,
      this.showUserLocation,
      this.userLocationStyle?.toList(),
    )
  }
}

/** 用户定位样式 */
data class UserLocationStyle(
  val userLocationType: UserLocationType?,
  val fillColor: Color?,
  val strokeColor: Color?,
  val lineWidth: Double?,
  val image: Bitmap?
) {
  companion object {
    fun fromList(list: List<Any?>): UserLocationStyle {
      val userLocationType = (list[0] as Int?)?.let { UserLocationType.ofRaw(it) }
      val fillColor = (list[1] as Int?)?.let { Color.valueOf(it) }
      val strokeColor = (list[2] as Int?)?.let { Color.valueOf(it) }
      val lineWidth = list[3] as Double?
      val image = (list[4] as List<Any?>?)?.let { Bitmap.fromList(it) }
      return UserLocationStyle(
        userLocationType,
        fillColor,
        strokeColor,
        lineWidth,
        image,
      )
    }
  }

  fun toList(): List<Any?> {
    return listOf(
      userLocationType?.raw,
      fillColor?.toArgb(),
      strokeColor?.toArgb(),
      lineWidth,
      image?.toList(),
    )
  }
}
