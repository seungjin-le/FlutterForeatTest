import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  void increment() {
    count.value++;
  }

  @override
  void onInit() {
    super.onInit();
    // 컨트롤러 초기화
  }
}
