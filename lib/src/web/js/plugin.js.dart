@JS("AMap")
library amap_flutter;

import 'dart:js_interop';

/// 异步加载插件
@JS()
external void plugin(JSArray<JSString> plugins, JSFunction callback);
