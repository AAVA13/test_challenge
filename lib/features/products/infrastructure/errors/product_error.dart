class ConnectionTimeout implements Exception {
  final String message;

  ConnectionTimeout({required this.message});
}

class ProductNotFound implements Exception {
  final String message;

  ProductNotFound({required this.message});
}
