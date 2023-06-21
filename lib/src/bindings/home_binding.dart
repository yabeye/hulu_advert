import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UIController>(() => UIController());
    Get.lazyPut<FilterController>(() => FilterController());
  }
}
