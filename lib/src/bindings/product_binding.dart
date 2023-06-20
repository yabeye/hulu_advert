import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
