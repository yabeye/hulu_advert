import 'package:flutter/services.dart';

class InputValidators {
  static isRequired(String? v, {String? message}) {
    if (v == null || v.isEmpty) {
      return message ?? "This filed is required";
    }
    return null;
  }

  static withInRange(v, {int? min, String? similar, String? message}) {
    if (v == null || v!.isEmpty) {
      return "This filed is required";
    }

    if (v.length < min) {
      return "min $min required";
    }

    if ((similar ?? v) != v) {
      return message ?? "don't match";
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
