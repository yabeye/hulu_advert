import 'package:flutter/services.dart';

class InputValidators {
  static isRequired(String? v, {String? message}) {
    if (v == null) {
      return message ?? "This filed is required";
    }
    if (v.isEmpty) {
      return message ?? "This filed is required";
    }

    return null;
  }
}

class MaxValueFormatter extends TextInputFormatter {
  final int maxValue;

  MaxValueFormatter({required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (int.tryParse(newValue.text) == null) {
      return oldValue;
    }

    final intValue = int.parse(newValue.text);
    if (intValue > maxValue) {
      return TextEditingValue(
        text: maxValue.toString(),
        selection: TextSelection.collapsed(offset: maxValue.toString().length),
      );
    }

    return newValue;
  }
}
