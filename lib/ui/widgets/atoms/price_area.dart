// Importa las librerías necesarias
import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

// Define una área de precio como un StatelessWidget
class PriceArea extends StatelessWidget {
  // Declara dos variables para los precios en bolívares y dólares
  final double bolivares;
  final double dolares;

  // Constructor que inicializa los precios
  const PriceArea({super.key, required this.bolivares, required this.dolares});

  // Método para construir la interfaz de usuario de la área de precio
  @override
  Widget build(BuildContext context) {
    // Retorna una fila con dos filas de hijos
    return Row(
      // Centra los hijos en el espacio disponible
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Primera fila de hijos con un icono de dinero y el precio en dólares
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.attach_money_outlined,
              color: AppColors.secondaryColor,
              size: 25,
            ),
            Text(
              dolares.toStringAsFixed(2),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        // Segunda fila de hijos con el texto 'Bs.' y el precio en bolívares
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bs.',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              bolivares.toStringAsFixed(2),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}
