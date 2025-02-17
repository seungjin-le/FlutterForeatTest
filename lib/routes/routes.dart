import 'package:foreat_mobile/controllers/home_controller.dart';
import 'package:foreat_mobile/screens/home.dart';
import 'package:foreat_mobile/screens/login.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}

abstract class Routes {
  static const HOME = '/home';
  static const LOGIN = '/login';
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
