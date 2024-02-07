// Importa las librerías necesarias
import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

// Define un botón personalizado como un StatelessWidget
class Btn extends StatelessWidget {
  // Declara un icono y una función onPressed para el botón
  final Icon icon;
  final void Function() onPressed;

  // Constructor que inicializa el icono y la función onPressed
  const Btn({super.key, required this.icon, required this.onPressed});

  // Método para construir la interfaz de usuario del botón
  @override
  Widget build(BuildContext context) {
    // Retorna un Container con una decoración y un IconButton como hijo
    return Container(
      // Define la decoración del Container
      decoration: BoxDecoration(
        // Añade una sombra al Container
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(62, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(0, 1), // Posición de la sombra
          ),
        ],
        // Define el color de fondo del Container
        color: AppColors.secondaryColor,
        // Redondea las esquinas del Container
        borderRadius: BorderRadius.circular(50.0),
      ),
      // Define el IconButton como hijo del Container
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
