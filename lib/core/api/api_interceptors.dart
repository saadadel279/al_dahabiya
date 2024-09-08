import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:dio/dio.dart';

import 'end_point.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
