class ApiException implements Exception {
  ApiException({required this.statusCode});
  final int statusCode;
}
