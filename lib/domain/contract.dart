// Importa la entidad del producto
import 'package:test_challenge/entity/product.dart';

// Define una interfaz para el repositorio
abstract class Repository {
  // Declara un método para obtener los productos
  // Este método devuelve una lista de productos y recibe un número de página
  Future<List<dynamic>> getProductDemo(int page);
}
