import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:hulu_advert/src/utils/utils.dart';

// ignore: camel_case_extensions
extension sizeHelper on int {
  Widget height() {
    return SizedBox(
      height: toDouble(),
    );
  }
}

extension doubleHelper on double {
  String priceFormat() {
    final formatter = NumberFormat.currency(symbol: currencySymbol);
    final formattedPrice = formatter.format(this);
    return formattedPrice;
  }
}
