import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/product_controller.dart';
import 'package:hulu_advert/src/views/pages/promotion/widgets/widgets.dart';

class PromotionPage extends StatelessWidget {
  PromotionPage({super.key});
  final _productController = Get.find<ProductController>();

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
              onPressed: () async {
                await _productController.addProduct();
              },
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
              AddPromotionVideoSection(),
              AddPromotionInfoSection(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
