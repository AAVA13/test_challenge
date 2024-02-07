// Importa las librerías necesarias
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:test_challenge/entity/product.dart';

// Clase para almacenar las constantes de la API
class ApiConstants {
  // Endpoint de la API
  static String deepCompanyEndpoint = 'ds.deepcompany.com';
  // Ruta para obtener los productos
  static String deepCompanyPath = '/marketplace/product-demo';
  // Clave de la API
  static String? deepCompanyKey = dotenv.env['deepCompanyKey'];
  // Parámetro para la paginación
  static String pageParameter = 'page';
}

// Clase para manejar las peticiones a la red
class NetworkService {
  // Método para obtener los productos
  Future<List<dynamic>> getProductDemo(int page) async {
    // Define los parámetros de la consulta
    final queryParameters = {
      ApiConstants.pageParameter: page.toString(),
    };
    // Construye la URL
    var url = Uri.https(ApiConstants.deepCompanyEndpoint,
        ApiConstants.deepCompanyPath, queryParameters);
    // Realiza la petición GET
    final response = await http.get(
      url,
      headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*/*',
        'x-apikey-marketplace': ApiConstants.deepCompanyKey!,
      },
    );

    // Decodifica la respuesta
    var responseData = jsonDecode(response.body);
    // Obtiene los resultados de la respuesta
    responseData = responseData['results'];
    // Devuelve los resultados
    return responseData;
  }
}
