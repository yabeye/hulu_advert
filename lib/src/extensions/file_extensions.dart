import 'dart:io';

extension fileHelpers on File {
  double sizeInkB() {
    final fileSizeInBytes = lengthSync();
    return double.parse((fileSizeInBytes / 1024).toStringAsFixed(2));
  }

  double sizeInmB() {
    final fileSizeInBytes = lengthSync();
    return double.parse((fileSizeInBytes / (1024 * 1024)).toStringAsFixed(2));
  }
}
