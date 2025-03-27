@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'js.dart';

/// JSAPI 的所有类型（地图、图层、覆盖物等）都实现了事件接口，用于给当前实例对象绑定、移除、清理事件回调
extension type Event._(JSObject _) implements JSObject {
  /// 给实例绑定事件回调函数，同一个类型、同一个回调函数、同一个上下文只会绑定一次
  /// type: 事件类型
  /// function: 回调函数
  /// context: 事件上下文，缺省为实例本身
  /// once: 是否只执行一次
  external Event onContext(
    String type,
    JSExportedDartFunction function,
    JSObject? context,
    JSBoolean once,
  );

  /// 移除当前实例的某一个事件回调
  /// type: 事件类型
  /// function: 事件回调函数
  /// context: 事件上下文，缺省为实例本身
  external Event offContext(
      String type, JSExportedDartFunction function, JSObject? context);

  /// 给实例绑定事件回调函数，同一个类型、同一个回调函数、同一个上下文只会绑定一次
  /// type: 事件类型
  /// function: 回调函数
  /// context: 事件上下文，缺省为实例本身
  /// once: 是否只执行一次
  external Event on(String type, JSExportedDartFunction function,
      JSObject context, JSBoolean once);

  /// 移除当前实例的某一个事件回调
  /// type: 事件类型
  /// function: 事件回调函数
  /// context: 事件上下文，缺省为当前实例
  external Event off(
      String type, JSExportedDartFunction function, JSObject context);

  /// 判断当前实例是否已经绑定了某个事件回调
  /// type: 事件类型
  /// function: 事件回调
  /// context: 事件上下文
  external JSBoolean hasEvents(
      String type, JSExportedDartFunction function, JSObject context);

  /// 清除当前实例某一类型的全部事件回调
  /// type: 事件类型，如果此参数为空，清除实例上的所有绑定的事件回调
  external Event clearEvents(String type);

  /// 模拟触发当前实例的某个事件
  /// type: 事件类型
  /// data: 事件回调时返回的数据，模拟的事件体应该完整，否则可能导致报错
  external Event emit(String type, JSObject data);
}

/// 此对象用于表示地图、覆盖物、叠加层上的各种鼠标事件返回
extension type MapsEvent._(JSObject _) implements JSObject {
  /// 构造函数
  MapsEvent() : this._(JSObject());

  /// 发生事件时光标所在处的经纬度坐标。
  external LngLat lnglat;

  /// 发生事件时光标所在处的像素坐标。
  external Pixel pixel;

  /// 事件类型。
  external JSString type;

  /// 发生事件的目标对象，不同类型返回target不同。例如，事件对象是Marker，则target表示目标对象为Marker，事件对象是其他，则随之改变。
  external JSObject target;
}

/// 地图热点事件
extension type HotspotEvent._(JSObject _) implements MapsEvent {
  /// 构造函数
  HotspotEvent() : this._(JSObject());

  /// 地图热点ID
  external JSString id;

  /// 地图热点名称
  external JSString name;
}
