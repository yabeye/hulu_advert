import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/utils.dart';

InputDecoration getInputDecoration(
  String? hintText, {
  IconData? prefixIcon,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      // hintStyle: const TextStyle(
      //   fontSize: 14,
      // ),
      isDense: false,
      counterText: '',
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
        borderSide: const BorderSide(
          color: AppColors.kPrimaryColor,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
        borderSide: const BorderSide(
          color: AppColors.kPrimaryColor,
          width: 1.5,
        ),
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      suffixIconConstraints: const BoxConstraints(
          // maxWidth: 0,
          ),
      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      suffixIcon: suffixIcon,
    );
