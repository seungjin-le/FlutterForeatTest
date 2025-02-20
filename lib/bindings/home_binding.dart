import 'package:foreat_mobile/controllers/home_controller.dart';
import 'package:foreat_mobile/services/home_service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeService>(() => HomeService());
  }
}
