import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
  late final TextEditingController amountController;
  final catagories = [].obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    amountController.dispose();
    catagories.value = [];
    super.dispose();
  }

  addProduct() async {}
}
