import '../../domain/domain.dart';

///Clase que implementa las reglas del repositorio
class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl({required this.datasource});

  ///Llama a la función del datasource getProductById. Obtiene los detalles del producto por su id
  @override
  Future<Product> getProductById(String id) {
    return datasource.getProductById(id);
  }

  ///Llama a la función del datasource getProductByPage. Obtiene los productos por pagina
  @override
  Future<List<Product>> getProductsByPage({int page = 0}) {
    return datasource.getProductsByPage(page: 0);
  }
}
