import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hulu_advert/src/controllers/auth_controller.dart';
import 'package:hulu_advert/src/models/models.dart';
import 'package:hulu_advert/src/repositories/promotion_repository.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:video_compress/video_compress.dart';

class PromotionController extends GetxController {
  var isLoading = false.obs;
  var feedPromotions = <PromotionModel>[].obs;

  final _logger = Get.find<Logger>();
  final _authRepo = Get.find<AuthController>();
  final _promotionRepo = Get.find<PromotionRepository>();

  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
  late final TextEditingController amountController;

  File? _videoFile;

  File? get videoFile => _videoFile;

  set videoFile(File? file) {
    _videoFile = file;
    update();
  }

  List<PromotionModel> get myPromotions => feedPromotions
      .where((p) => p.ownerId == _authRepo.currentUser.value.id)
      .toList();

  fetchPromotion() async {
    await _promotionRepo.getAllPromotions();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    fetchAllPromotions();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    amountController.dispose();
    super.dispose();
  }

  fetchAllPromotions() async {
    feedPromotions.value = await _promotionRepo.getAllPromotions();
  }

  addPromotion() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (_videoFile == null) {
      Common.showError("Add a video");
      return;
    }

    final externalDirectory = await getExternalStorageDirectory();
    final huluDirectory = await Directory('${externalDirectory!.path}/$appName')
        .create(recursive: true);
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();

    final videoFile = await _videoFile!.copy(
      '${huluDirectory.path}/$fileName-${_videoFile!.path.split("/").last}',
    );

    PromotionModel newPromotion = PromotionModel(
      ownerId: _authRepo.currentUser.value.id,
      name: nameController.text.trim(),
      desc: descriptionController.text.trim(),
      unitPrice: double.parse(priceController.text),
      amount: int.parse(amountController.text),
      createdAt: DateTime.now(),
      videoUrl: videoFile.path,
    );

    newPromotion = await _promotionRepo.addPromotion(newPromotion);

    feedPromotions.insert(0, newPromotion);

    _logger.i("New Promotion ${newPromotion.toString()}");

    reset();
  }

  reset() {
    nameController.text = "";
    descriptionController.text = "";
    priceController.text = "";
    amountController.text = "";
    videoFile = null;
    VideoCompress.cancelCompression();
    VideoCompress.deleteAllCache();
  }
}
