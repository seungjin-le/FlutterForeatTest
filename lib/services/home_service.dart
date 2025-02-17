import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends GetxService {
  final Dio _dio = Dio();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  // API 기본 URL
  static const String _baseUrl = 'YOUR_API_BASE_URL';

  // 토큰 저장 키
  static const String _tokenKey = 'auth_token';

  // 로그인 메소드
  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // 토큰 저장
        final token = response.data['token'];
        await _prefs.setString(_tokenKey, token);

        // dio 인스턴스에 토큰 설정
        _dio.options.headers['Authorization'] = 'Bearer $token';
        return true;
      }
      return false;
    } catch (e) {
      print('로그인 에러: $e');
      return false;
    }
  }

  // 로그아웃 메소드
  Future<void> logout() async {
    try {
      await _prefs.remove(_tokenKey);
      _dio.options.headers.remove('Authorization');
    } catch (e) {
      print('로그아웃 에러: $e');
    }
  }

  // 토큰 가져오기
  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  // 로그인 상태 확인
  bool isLoggedIn() {
    return getToken() != null;
  }

  // 소셜 로그인 메소드 (예: 구글)
  Future<bool> googleLogin(String idToken) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/google',
        data: {
          'id_token': idToken,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        await _prefs.setString(_tokenKey, token);
        _dio.options.headers['Authorization'] = 'Bearer $token';
        return true;
      }
      return false;
    } catch (e) {
      print('구글 로그인 에러: $e');
      return false;
    }
  }
}
