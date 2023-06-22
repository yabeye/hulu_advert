import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/extensions/file_extensions.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hulu_advert/src/themes/app_colors.dart';

class Common {
  Common._();

  // UI

  static void dismissKeyboard() => Get.focusScope!.unfocus();

  static void showLoading() {
    Get.dialog(
      Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.white,
          ),
          child: const SpinKitFadingCircle(
            size: 50,
            color: AppColors.red,
          ),
        ),
      ),
      barrierColor: AppColors.black.withAlpha(36),
      barrierDismissible: false,
      transitionCurve: Curves.easeInOutBack,
    );
  }

  static void showError(String error) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          error,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(20),
        borderRadius: 24,
        backgroundColor: AppColors.red,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  static Future showNotification({String? title, String? body}) async {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          body ?? "",
          style: const TextStyle(color: AppColors.kPrimaryColor),
        ),
        titleText: Text(
          title ?? "",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(20),
        borderRadius: 24,
        backgroundColor: AppColors.white,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  // Assets
  static Future<List<File>> pickImages() async {
    List<File> images = [];
    final ImagePicker picker = ImagePicker();
    final imageFiles = await picker.pickMultiImage(
      imageQuality: 50,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    if (imageFiles.isNotEmpty) {
      for (final image in imageFiles) {
        images.add(File(image.path));
        print("Current Selcted Size: ${images.first.sizeInkB()}");
      }
    }
    return images;
  }

  static Future<XFile?> pickVideo() async {
    final ImagePicker picker = ImagePicker();

    final XFile? galleryVideo =
        await picker.pickVideo(source: ImageSource.gallery);
    //TODO: Do some compressio here!

    return galleryVideo;
  }
}
