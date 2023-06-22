import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/auth_controller.dart';
import 'package:hulu_advert/src/models/models.dart';
import 'package:hulu_advert/src/repositories/product_repository.dart';
import 'package:hulu_advert/src/utils/common.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:path_provider/path_provider.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var feedProducts = <ProductModel>[].obs;

  final _authRepo = Get.find<AuthController>();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
  late final TextEditingController amountController;

  var photos = <File>[].obs;
  final _productRepo = Get.find<ProductRepository>();
  final catagories = [].obs;

  List<ProductModel> get myProducts => feedProducts
      .where((p) => p.ownerId == _authRepo.currentUser.value.id)
      .toList();

  @override
  void onInit() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    fetchAllProducts();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   descriptionController.dispose();
  //   priceController.dispose();
  //   amountController.dispose();
  //   catagories.value = [];
  //   super.dispose();
  // }

  fetchAllProducts() async {
    feedProducts.value = await _productRepo.getAllProducts();
  }

  addProduct() async {
    // Fist store the images to the external storage
    final externalDirectory = await getExternalStorageDirectory();

    final huluDirectory = await Directory('${externalDirectory!.path}/$appName')
        .create(recursive: true);
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();

    final List<String> locations = [];

    for (int i = 0; i < photos.length; i++) {
      final file = await photos[i].copy(
        '${huluDirectory.path}/$fileName-${photos[i].path.split("/").last}',
      );
      locations.add(file.path);
    }

    ProductModel newProduct = ProductModel(
      ownerId: _authRepo.currentUser.value.id,
      name: nameController.text.trim(),
      desc: descriptionController.text.trim(),
      unitPrice: double.parse(priceController.text),
      amount: int.parse(amountController.text),
      createdAt: DateTime.now(),
      images: locations,
    );

    print("Data to send is ${newProduct.toString()}");

    newProduct = await _productRepo.addProduct(newProduct);

    feedProducts.insert(0, newProduct);

    _reset();
  }

  _reset() {
    photos.value = [];
    nameController.text = "";
    descriptionController.text = "";
    priceController.text = "";
    amountController.text = "";
  }
}
