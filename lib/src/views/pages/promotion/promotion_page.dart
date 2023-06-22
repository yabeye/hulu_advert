import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/routes/app_routes.dart';
import 'package:hulu_advert/src/utils/common.dart';
import 'package:hulu_advert/src/views/pages/promotion/widgets/widgets.dart';

class PromotionPage extends StatelessWidget {
  PromotionPage({super.key});
  final _promotionController = Get.find<PromotionController>();

  _addPromotion() async {
    try {
      Common.showLoading();
      await _promotionController.addPromotion();
      Get.back();
      Common.dismissKeyboard();
      Common.showNotification(title: "Success", body: "Promotion added");
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
              onPressed: _addPromotion,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddPromotionVideoSection(),
              const AddPromotionInfoSection(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
