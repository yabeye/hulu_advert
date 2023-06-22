import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/repositories/product_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<UIController>(() => UIController());
    Get.lazyPut<FilterController>(() => FilterController());
  }
}
