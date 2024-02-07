// Importa las librerías necesarias
import 'package:flutter/material.dart';

// Define una burbuja como un StatelessWidget
class Bubble extends StatelessWidget {
  // Declara una variable para el hijo de la burbuja
  final Widget child;

  // Constructor que inicializa el hijo de la burbuja
  Bubble({required this.child});

  // Método para construir la interfaz de usuario de la burbuja
  @override
  Widget build(BuildContext context) {
    // Retorna un Container
    return Container(
      // Define la decoración del Container
      decoration: BoxDecoration(
        // Define el color de fondo del Container
        color: Color(0xFFF3F7FE),
        // Redondea las esquinas del Container
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      // Define el hijo del Container
      child: Padding(
        // Añade un padding alrededor del hijo
        padding: EdgeInsets.all(7.0),
        // Define el hijo del Padding
        child: this.child,
      ),
    );
  }
}
