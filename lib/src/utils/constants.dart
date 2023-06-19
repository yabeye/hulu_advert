// App constants
import 'package:flutter/material.dart';

const appTitle = "Hulu Advert App";
const appName = "Hulu Advert";

const board1Title = 'DISCOVER PRODUCTS';
const board1Desc = 'You can find more products in many categories';
const board2Title = 'WATCH PROMOTIONS';
const board2Desc = 'See what others are taking about products';
const board3Title = 'SHARE';
const board3Desc =
    'You can also share your own products and promotions with others';

// Style constants
class AppColors {
  AppColors._();

  static const Color kPrimaryColor = Color(0xFFE92662);
  static const Color kSecondaryColor = Color(0xFFFFC10A);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Color(0x00000000);
  static const Color green = Color(0xFF43A838);
  static const Color blue = Color(0xFF008ABF);
  static const Color red = Color(0xFFFF3B3B);
  static const Color gray = Color(0xFFAAAAAA);
  static const Color lightGray = Color(0xFF909296);
  static const Color superLightGray = Color(0xFFF2F0F1);
  static const Color colorDivider = Color(0xFFEBEBEB);

  static const Color neutral6 = Color(0xFFF1F2F9);
  static const Color neutral3 = Color(0xFFADAFC5);
}

// Asset constants
// const _iconsPath = "assets/icons/";
const _imagesPath = "assets/images/";

const logoAnimation = "assets/animations/logo-animation.json";
const appLogo = "${_imagesPath}hulu-advert.png";
const board1 = "${_imagesPath}board-1.png";
const board2 = "${_imagesPath}board-2.png";
const board3 = "${_imagesPath}board-3.png";
