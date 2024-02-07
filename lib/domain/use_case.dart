// Importa el contrato del repositorio y la entidad del producto
import 'package:test_challenge/domain/contract.dart';
import 'package:test_challenge/entity/product.dart';

// Define la clase UseCase
class UseCase {
  // Declara una variable final para el repositorio
  final Repository _repository;

  // Constructor que inicializa el repositorio
  UseCase(this._repository);

  // Método para obtener los productos
  Future<List<dynamic>> getProductDemo(int page) =>
      // Llama al método getProductDemo del repositorio
      _repository.getProductDemo(page);
}
