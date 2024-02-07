// Importa las librerías necesarias
import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

// Define una área de título como un StatelessWidget
class TitleArea extends StatelessWidget {
  // Declara una variable para el texto del título
  final String text;

  // Constructor que inicializa el texto del título
  const TitleArea({
    super.key,
    required this.text,
  });

  // Método para construir la interfaz de usuario del área de título
  @override
  Widget build(BuildContext context) {
    // Retorna un widget Text
    return Text(
      // Define el texto del widget Text
      text,
      // Define el estilo del texto
      style: const TextStyle(
          // Define el peso de la fuente
          fontWeight: FontWeight.w900,
          // Define el tamaño de la fuente
          fontSize: 20,
          // Define el color del texto
          color: AppColors.primaryColor),
    );
  }
}
