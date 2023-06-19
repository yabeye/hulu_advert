import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';

class Common {
  Common._();

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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(body ?? ""),
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
}
