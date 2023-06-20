import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';

class AppThemes {
  AppThemes._();
  static get font => "Helix";
  static get userFont => "Helix";

  static ThemeData get themData => ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: AppColors.kSecondaryColor,
        fontFamily: font,
        // textTheme: ThemeData.light().textTheme.apply(fontFamily: font),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            color: AppColors.gray,
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            color: AppColors.gray,
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.kPrimaryColor,
          secondary: AppColors.kPrimaryColor,
          surface: AppColors.kPrimaryColor,
          background: AppColors.white,
          onSurface: Colors.black,
          onPrimary: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontFamily: font,
            fontWeight: FontWeight.w700,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.black,
          unselectedLabelColor: const Color(0xff858585),
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: font,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: font,
          ),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
        ),
        dialogBackgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
        highlightColor: Colors.grey,
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.kPrimaryColor,
            selectionHandleColor: Colors.black.withOpacity(0.1)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.kPrimaryColor),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          // focusedBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kPrimaryColor,
              width: 1.5,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          hintStyle: TextStyle(
            color: AppColors.lightGray,
          ),
          prefixStyle: TextStyle(color: AppColors.lightGray),
          prefixIconColor: AppColors.lightGray,
          suffixStyle: TextStyle(color: AppColors.lightGray),
          suffixIconColor: AppColors.lightGray,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.kPrimaryColor;
              }
              return AppColors.lightGray;
            },
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedIconTheme: IconThemeData(
            color: AppColors.kPrimaryColor,
          ),
          unselectedIconTheme: IconThemeData(color: AppColors.gray),
          // unselectedLabelStyle: TextStyle(color: AppColors.black),
          // selectedLabelStyle: TextStyle(color: AppColors.black),
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: AppColors.kPrimaryColor,
        ),
      );
}
