import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/themes/themes.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? backgroundColor,
    double? elevation,
    Brightness? brightness,
    bool showLeading = true,
    Widget? title,
    VoidCallback? onBack,
  }) : super(
          key: key,
          backgroundColor: backgroundColor ?? Colors.white,
          elevation: elevation ?? 0,
          leadingWidth: 80,
          leading: showLeading
              ? InkWell(
                  onTap: () {
                    if (onBack != null) {
                      onBack();
                    } else {
                      Get.back();
                    }
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    color: AppColors.gray,
                  ),
                )
              : null,
          title: title,
        );
}
