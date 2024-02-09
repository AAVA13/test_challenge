import 'dart:convert';

import 'package:test_challenge/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'package:test_challenge/models/request_model.dart';

abstract class ProductsApi {

  Future<RequestModel> getProducts(int index);
  
}

class ProductsApiImpl implements ProductsApi{
  
  @override
  Future<RequestModel> getProducts(int index) async {
    
    Uri url = Uri.parse('https://ds.deepcompany.com/marketplace/product-demo?page=$index');
  
    http.Response response = await http.get(
      url,
      headers: {
        'Accept': 'application/json,text/plain',
        'x-apikey-marketplace': 'rIH99Wc_HcMlonQTugzKySx5J31O2XgFJsLVJS8m9tF-Zyr01SfiwmvQZFVuqErM8soJeGV-RCgdSMXpT_25wg',
      }
    );

    if(response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(statusCode: response.statusCode);
    }
    Map<String,dynamic> jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    return RequestModel.fromJson(jsonResponse);
    //return List<ProductModel>.from(jsonResponse['results'].map((x) => ProductModel.fromJson(x)));
    
  }

}