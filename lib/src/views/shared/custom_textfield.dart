import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/utils.dart';

InputDecoration getInputDecoration(
  String? hintText, {
  IconData? prefixIcon,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      isDense: false,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
        borderSide: const BorderSide(
          color: AppColors.darkerLightGray,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
        borderSide: const BorderSide(
          color: AppColors.kPrimaryColor,
          width: 1.5,
        ),
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      suffixIconConstraints: const BoxConstraints(
          // maxWidth: 0,
          ),
      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      suffixIcon: suffixIcon,
    );
