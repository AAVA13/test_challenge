// Importa las librerías necesarias
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define un campo de entrada de cantidad como un StatelessWidget
class QtyInput extends StatelessWidget {
  // Declara un controlador para el campo de entrada y una cantidad máxima
  final TextEditingController qtyController;
  final num maxQty;

  // Constructor que inicializa el controlador y la cantidad máxima
  const QtyInput(
      {super.key, required this.qtyController, required this.maxQty});

  // Método para construir la interfaz de usuario del campo de entrada
  @override
  Widget build(BuildContext context) {
    // Inicializa la cantidad máxima redondeada a 0
    var roundedMaxQty = 0;
    // Si la cantidad máxima no es nula, la redondea hacia abajo
    if (maxQty != null) {
      roundedMaxQty = maxQty!.floor();
    }
    // Retorna un TextField
    return TextField(
      // Define la decoración del TextField
      decoration: InputDecoration(
        // Define el texto de sugerencia del TextField
        hintText: 'Cantidad a comprar',
        // Define la etiqueta del TextField
        labelText: maxQty != null
            ? 'EL stock maximo es $roundedMaxQty'
            : 'Stock ilimitado',
        // Define el borde del TextField
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      // Define el tipo de teclado del TextField
      keyboardType: TextInputType.number,
      // Asigna el controlador al TextField
      controller: qtyController,
      // Define la función a ejecutar cuando cambia el valor del TextField
      onChanged: (val) {
        if (val.isNotEmpty) {
          if (int.parse(val) >= maxQty! && maxQty != null) {
            qtyController.text = maxQty.toString();
          }
        }
      },
      // Define los formateadores de entrada del TextField
      inputFormatters: [
        // Permite solo dígitos
        FilteringTextInputFormatter.digitsOnly,
        // Limita la longitud del texto a 3
        LengthLimitingTextInputFormatter(3),
      ],
    );
  }
}
