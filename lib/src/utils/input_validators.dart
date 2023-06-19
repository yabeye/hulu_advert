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
