import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/controllers/user_controller.dart';
import 'package:hulu_advert/src/repositories/product_repository.dart';
import 'package:hulu_advert/src/repositories/promotion_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<PromotionRepository>(() => PromotionRepository());
    Get.lazyPut<PromotionController>(() => PromotionController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<UIController>(() => UIController());
    Get.lazyPut<FilterController>(() => FilterController());
  }
}
