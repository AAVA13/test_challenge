import 'package:flutter/material.dart';

///Clase para configurar los temas de la aplicación
class AppTheme {
  ///Retorna el tema utilizado con la configuración de colores
  static ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff188bf7),
      );
}
