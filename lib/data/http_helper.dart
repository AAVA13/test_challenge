import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_challenge/data/products_data.dart';

class HTTPHelper {
  // 'https://ds.deepcompany.com/marketplace/product-demo?page=1'
  // rIH99Wc_HcMlonQTugzKySx5J31O2XgFJsLVJS8m9tF-Zyr01SfiwmvQZFVuqErM8soJeGV-RCgdSMXpT_25wg
  final String url =
      'https://ds.deepcompany.com/marketplace/product-demo?page=';
  final String xAPIKey =
      'rIH99Wc_HcMlonQTugzKySx5J31O2XgFJsLVJS8m9tF-Zyr01SfiwmvQZFVuqErM8soJeGV-RCgdSMXpT_25wg';

  Future<List<ProductsData>> getProducts(bool firstPage) async {
    int i;
    int page = 1;
    int count = 20;
    List<ProductsData> products = [];

    if (firstPage) {
      page = 1;
    }
    for (i = page; i <= (page + count); i++) {
      final response = await http.get(
        Uri.parse(url + (i).toString()),
        // Send authorization headers to the backend.
        headers: {
          'x-apikey-marketplace': xAPIKey,
          'Accept': 'application/json, text/plain, /'
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final results = responseBody['results'];

        for (final result in results) {
          products.add(ProductsData.fromJson(result));
        }
      } else {
        throw Exception('Failed to load products');
      }
    }
    page = i;
    return products;
  }
}
