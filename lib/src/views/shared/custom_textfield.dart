import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';

InputDecoration getInputDecoration(
  String? hintText, {
  IconData? prefixIcon,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: AppColors.darkerLightGray,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: AppColors.kPrimaryColor,
          width: 1.5,
        ),
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      suffixIconConstraints: const BoxConstraints(
          // maxWidth: 0,
          ),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
    );
