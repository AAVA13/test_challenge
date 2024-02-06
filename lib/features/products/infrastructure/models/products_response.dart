import 'package:test_challenge/features/products/infrastructure/models/product_response.dart';

///Clase que define el modelo de la respuesta obtenida por la API (respuesta completa)
class ProductsResponse {
  final List<ProductResponse> results;
  final int pages;
  final int records;
  final int current;
  final String filter;

  ProductsResponse({
    required this.results,
    required this.pages,
    required this.records,
    required this.current,
    required this.filter,
  });

  ///Mapea la respuesta de la api a un objeto tipo ProductsResponse
  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
        results: List<ProductResponse>.from(json["results"].map((x) => ProductResponse.fromJson(x))),
        pages: json["pages"],
        records: json["records"],
        current: json["current"],
        filter: json["filter"],
      );
}
