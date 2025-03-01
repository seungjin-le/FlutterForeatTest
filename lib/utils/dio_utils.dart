import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 쿠키를 로컬 스토리지에서 가져옴
    final prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString('cookie');

    if (cookie != null) {
      // 쿠키가 존재하면 요청 헤더에 추가합니다.
      options.headers['Cookie'] = cookie;
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    // Add any custom logic for response interception

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}

class DioUtils {
  static Dio? _instance;
  static const String _baseUrl = 'YOUR_API_BASE_URL';
  static const String _tokenKey = 'auth_token';

  static Dio get instance {
    _instance ??= createDioInstance();
    return _instance!;
  }

  static Dio createDioInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    // 인터셉터 추가
    dio.interceptors.addAll([
      _authInterceptor(),
      _logInterceptor(),
      _errorInterceptor(),
    ]);

    return dio;
  }

  // 인증 토큰 처리 인터셉터
  static Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        final storage = GetStorage();
        final token = storage.read(_tokenKey);

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    );
  }

  // 로깅 인터셉터
  static Interceptor _logInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    );
  }

  // 에러 처리 인터셉터
  static Interceptor _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // 토큰 만료 처리
          final storage = GetStorage();
          storage.remove(_tokenKey);

          // 로그인 페이지로 이동
          Get.offAllNamed('/login');
          return handler.reject(error);
        }

        // 서버 에러 처리
        if (error.response?.statusCode == 500) {
          Get.snackbar(
            '서버 오류',
            '서버에 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }

        // 네트워크 에러 처리
        if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
          Get.snackbar(
            '네트워크 오류',
            '인터넷 연결을 확인해주세요.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }

        return handler.next(error);
      },
    );
  }

  // Dio 인스턴스 초기화 (필요한 경우)
  static void resetDioInstance() {
    _instance = null;
  }
}
