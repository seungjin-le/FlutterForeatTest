import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add any custom logic for request interception
    print('Request: ${options.method} ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Add any custom logic for response interception
    print('Response: ${response.statusCode} ${response.statusMessage}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Add any custom logic for error interception
    print('Error: ${err.message}');
    super.onError(err, handler);
  }
}

class DioUtils {
  static Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) async {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return await dio.get(url, queryParameters: queryParameters);
  }

  static Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return await dio.post(url, data: data);
  }

  static Future<Response> put(String url, {Map<String, dynamic>? data}) async {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return await dio.put(url, data: data);
  }

  static Future<Response> delete(String url) async {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return await dio.delete(url);
  }
}
