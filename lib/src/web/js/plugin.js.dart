@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

/// 异步加载插件
external void plugin(List<String> plugins, Function() callback);
