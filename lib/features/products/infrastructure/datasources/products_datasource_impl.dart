import 'package:dio/dio.dart';
import 'package:test_challenge/config/constants/environment.dart';
import 'package:test_challenge/features/products/domain/datasources/products_datasource.dart';
import 'package:test_challenge/features/products/domain/entities/product.dart';
import 'package:test_challenge/features/products/infrastructure/errors/product_error.dart';
import 'package:test_challenge/features/products/infrastructure/models/product_details_response.dart';
import 'package:test_challenge/features/products/infrastructure/models/products_response.dart';

import '../mappers/product_mapper.dart';

///Implemeta las relglas del datasource. Realiza peticiones http con ayuda del paquete de DIO
class ProductsDatasourceImpl extends ProductsDatasource {

  final Dio dio = Dio(
    BaseOptions(baseUrl: Environment.apiUrl),
  );

  ///Función para obtener información detallada de un producto según su [id].
  @override
  Future<Product> getProductById(String id) async {
    try {
      final response = await dio.get('/product-demo',
          queryParameters: {'id': id},
          options: Options(
            headers: {'x-apikey-marketplace': Environment.apiKey},
          ));
      final productDetailsResponse = ProductDetailsResponse.fromJson(response.data);
      return ProductMapper.productDetailResponseToEntity(productDetailsResponse);
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw ProductNotFound(message: 'El producto seleccionado no existe');
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout(message: 'Sin conexión a internet, vuelva a intentarlo más tarde');
      }
      throw Exception('Error no controlado');
    } catch (e) {
      throw Exception(e);
    }
  }

  ///Función para obtener un listado de productos según la [page].
  @override
  Future<List<Product>> getProductsByPage({int page = 0}) async {
    try {
      final response = await dio.get('/product-demo',
          queryParameters: {'page': page},
          options: Options(
            headers: {'x-apikey-marketplace': Environment.apiKey},
          ));

      return _jsonToProductList(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout(message: 'Sin conexión a internet, vuelva a intentarlo más tarde');
      }
      throw Exception('Error no controlado');
    } catch (e) {
      throw Exception(e);
    }
  }

  ///Función para mapear las respuestas de la api
  List<Product> _jsonToProductList(Map<String, dynamic> json) {
    final productResponse = ProductsResponse.fromJson(json);
    return productResponse.results.map((e) => ProductMapper.productResponseToEntity(e)).toList();
  }
}
