import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/ui_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UIController>(() => UIController());
  }
}
