@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'package:web/web.dart' show EventListener, HTMLElement;
import 'js.dart';

/// 右键菜单
extension type ContextMenu._(JSObject _) implements JSObject {
  /// 构造函数
  external ContextMenu(OverlayOptions opts);

  /// 打开右键菜单
  external void open(AMap map, LngLat position);

  /// 关闭右键菜单
  external void close();

  /// 菜单添加一条内容
  external void addItem(String text, EventListener fn, num num);

  /// 菜单移除一条内容
  external void removeItem(String text, EventListener fn);
}

extension type OverlayOptions._(JSObject _) implements JSObject {
  /// 构造函数
  OverlayOptions() : this._(JSObject());

  /// 右键菜单显示的位置
  external LngLat position;

  /// 右键菜单内容（针对自定义菜单时，添加菜单内容及功能。可以是HTML要素字符串或者HTML DOM对象。）
  external HTMLElement content;
}
