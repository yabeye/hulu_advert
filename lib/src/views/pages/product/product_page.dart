import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/routes/app_routes.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/pages/product/widgets/widgets.dart';
import 'package:hulu_advert/src/views/shared/shared.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final _productController = Get.find<ProductController>();

  _addProduct() async {
    if (!_productController.formKey.currentState!.validate()) {
      return;
    }

    if (_productController.photos.isEmpty) {
      Common.showError("Add at least one photo");
      return;
    }

    try {
      Common.showLoading();
      await _productController.addProduct();
      Get.back();
      Common.dismissKeyboard();
      Common.showNotification(title: "Success", body: "Product added");
      Get.until((route) => route.settings.name!.startsWith(AppRoutes.home));
    } on HttpException catch (e) {
      Get.back();
      Common.showError(e.message);
    } catch (e) {
      Get.back();
      Common.showError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: Get.back, child: const Icon(Icons.close)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: _addProduct,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddProductImagesSection(),
              AddProductInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
