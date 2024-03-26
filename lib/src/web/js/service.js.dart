@JS("AMap")
library amap_flutter;

import 'package:js/js.dart';

/// 用于调用 Web 服务 API，直接透传查询条件和返回结果，提供GET和POST两种请求方式，具体请求接口和返回结果，请参考 https://lbs.amap.com/api/webservice/summary/
@JS()
class WebService {
  /// 以 GET 请求方式请求指定的 Web 服务 API 接口
  external static void get(
    String path,
    Object params,
    WebServiceCallback callback,
    Object opts,
  );

  /// 以 POST 请求方式请求指定的 Web 服务 API 接口, 目前只有轨迹纠偏接口需要使用 POST 方式
  external static void post(
    String path,
    dynamic params,
    WebServiceCallback callback,
  );
}

/// WebService 的回调函数类型
typedef WebServiceCallback = void Function(String status, dynamic data);
