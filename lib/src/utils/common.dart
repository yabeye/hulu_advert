import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hulu_advert/src/themes/app_colors.dart';

class Common {
  Common._();

  // UI

  static void dismissKeyboard() => Get.focusScope!.unfocus();

  static Future showNotification({String? title, String? body}) async {
    if (title == null && body == null) return;
    Get.showSnackbar(
      GetSnackBar(
        messageText: const Text(
          "",
          style: TextStyle(color: AppColors.kPrimaryColor),
        ),
        titleText: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColors.kPrimaryColor,
              size: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    body ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    if (imageFiles.isNotEmpty) {
      for (final image in imageFiles) {
        images.add(File(image.path));
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
