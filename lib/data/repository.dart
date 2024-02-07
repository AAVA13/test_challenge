// Importa las librerías necesarias
import 'package:test_challenge/domain/contract.dart';
import 'endpoints.dart';

// Implementación del repositorio
class RepositoryImpl implements Repository {
  // Servicio de red
  final NetworkService _networkService;

  // Constructor que recibe el servicio de red
  RepositoryImpl(this._networkService);

  // Método para obtener los productos
  @override
  Future<List<dynamic>> getProductDemo(int page) async {
    // Realiza la petición a la red
    final response = await _networkService.getProductDemo(page);
    // Si la respuesta no es nula, la devuelve
    if (response != null) {
      return response;
    } else {
      // Si la respuesta es nula, lanza una excepción
      throw Exception('Failed to fetch product demo');
    }
  }
}
