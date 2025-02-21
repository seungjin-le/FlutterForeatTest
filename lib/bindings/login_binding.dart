import 'package:foreat_mobile/controllers/login_controller.dart';
import 'package:foreat_mobile/services/login_service.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginService>(() => LoginService());
  }
}
