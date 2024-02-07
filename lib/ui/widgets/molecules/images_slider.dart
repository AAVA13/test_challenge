// Importa las librerías necesarias
import 'package:flutter/material.dart';

// Define un deslizador de imágenes como un StatelessWidget
class ImageSlider extends StatelessWidget {
  // Declara una lista para las imágenes
  final List<dynamic> images;

  // Constructor que inicializa las imágenes
  const ImageSlider({required this.images});

  // Método para construir la interfaz de usuario del deslizador de imágenes
  @override
  Widget build(BuildContext context) {
    // Retorna un ClipRRect con un Container como hijo
    return ClipRRect(
      // Redondea las esquinas del ClipRRect
      borderRadius: BorderRadius.circular(40.0),
      // Define el Container como hijo del ClipRRect
      child: Container(
        // Define el ancho del Container igual al ancho de la pantalla
        width: MediaQuery.of(context).size.width,
        // Define la altura del Container
        height: 300,
        // Define un PageView.builder como hijo del Container
        child: PageView.builder(
          // Define la cantidad de elementos del PageView.builder
          itemCount: images.length,
          // Define la función para construir cada elemento del PageView.builder
          itemBuilder: (context, index) {
            // Retorna una imagen de la red para cada elemento
            return Image.network(
              // Define la URL de la imagen
              images[index]['image'],
              // Ajusta la imagen para cubrir todo el espacio disponible
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
