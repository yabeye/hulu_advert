import 'package:flutter/cupertino.dart';

// ignore: camel_case_extensions
extension sizeHelper on int {
  Widget height() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
