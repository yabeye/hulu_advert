import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/product_controller.dart';
import 'package:hulu_advert/src/controllers/promotion_controller.dart';
import 'package:hulu_advert/src/models/models.dart';
import 'package:hulu_advert/src/repositories/repositories.dart';

class FilterController extends GetxController {
  late final TextEditingController searchKeyword;

  final _productRepo = Get.find<ProductController>();
  final _promotionRepo = Get.find<PromotionController>();

  var productSearchResult = <ProductModel>[].obs;
  var promotionSearchResult = <PromotionModel>[].obs;

  @override
  void onInit() {
    searchKeyword = TextEditingController();
    _productRepo.dispose();
    _promotionRepo.dispose();
    super.onInit();
  }

  @override
  void onClose() {
    searchKeyword.dispose();
    super.dispose();
  }

  search() async {
    productSearchResult.value = _productRepo.feedProducts
        .where((e) => ((e.name?.toLowerCase() ?? "")
                .contains(searchKeyword.text.toLowerCase()) ||
            (e.desc?.toLowerCase() ?? "")
                .contains(searchKeyword.text.toLowerCase())))
        .toList();
    promotionSearchResult.value = _promotionRepo.feedPromotions
        .where((e) => ((e.name?.toLowerCase() ?? "")
                .toLowerCase()
                .contains(searchKeyword.text.toLowerCase()) ||
            (e.desc?.toLowerCase() ?? "")
                .contains(searchKeyword.text.toLowerCase())))
        .toList();
  }
}
