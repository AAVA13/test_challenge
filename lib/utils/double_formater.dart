class DoubleFormater {
  String? validateDouble(double? value) {
    return value?.toStringAsFixed(2);
  }
}