import '../entities/product.dart';
///Clase para definir las reglas que deben seguir los datasources
abstract class ProductsDatasource {
  Future<List<Product>> getProductsByPage({int page = 0});
  Future<Product> getProductById(String id);
}
