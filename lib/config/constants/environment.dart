import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Clase para manejar las variables de entorno
class Environment {
  static String apiUrl = dotenv.env['API_URL'] ?? 'No esta configurada la variable de entorno';
  static String apiKey = dotenv.env['API_KEY'] ?? 'No esta configurada la variable de entorno';

  ///Inicializa las variables de entorno utilizando el paquete Dotnv
  static Future<void> initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }
}
