import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/dio_utils.dart';

class LoginService extends GetxService {
  final _dio = DioUtils.instance;
  final storage = GetStorage();

  static const String _tokenKey = 'auth_token';

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        storage.write(_tokenKey, token);
        return true;
      }
      return false;
    } catch (e) {
      print('로그인 에러 : $e');
      return false;
    }
  }

  // GetStorage에서 토큰 삭제
  Future<void> logout() async {
    storage.remove(_tokenKey);
    _dio.options.headers.remove('Authorization');
  }

  String? getToken() {
    return storage.read(_tokenKey);
  }

  bool isLoggedIn() {
    return storage.hasData(_tokenKey);
  }

  Future<bool> googleLogin(String idToken) async {
    try {
      final response = await _dio.post(
        '/auth/google',
        data: {
          'id_token': idToken,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        storage.write(_tokenKey, token);
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
