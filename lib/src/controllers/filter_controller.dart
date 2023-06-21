import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  late final TextEditingController searchKeyword;

  List productSearchResult = [];
  List promotionSearchResult = [];

  @override
  void onInit() {
    searchKeyword = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchKeyword.dispose();
    super.dispose();
  }
}
