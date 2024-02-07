// Importa las librerías necesarias
import 'package:flutter/material.dart';

// Define una área de descripción como un StatelessWidget
class DescriptionArea extends StatelessWidget {
  // Declara una variable para la descripción
  final String? desc;

  // Constructor que inicializa la descripción
  const DescriptionArea({super.key, required this.desc});

  // Método para construir la interfaz de usuario de la descripción
  @override
  Widget build(BuildContext context) {
    // Retorna un widget Text
    return Text(
      // Si la descripción no es nula, la muestra. Si es nula, muestra un mensaje predeterminado
      desc != null
          ? desc.toString()
          : 'No hay una descripcion disponible 😶‍🌫️',
      // Define el estilo del texto
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
