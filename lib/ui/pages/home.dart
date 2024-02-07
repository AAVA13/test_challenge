// Importa las librerías necesarias
import 'package:flutter/material.dart';
import 'package:test_challenge/ui/widgets/organisms/layout.dart';
import 'package:test_challenge/ui/widgets/organisms/products_area.dart';
import 'package:test_challenge/ui/widgets/organisms/paginator.dart';

// Define la vista de inicio como un StatefulWidget
class HomeView extends StatefulWidget {
  @override
  // Crea una instancia del estado de la vista de inicio
  _HomeViewState createState() => _HomeViewState();
}

// Define el estado de la vista de inicio
class _HomeViewState extends State<HomeView> {
  @override
  // Construye la interfaz de usuario de la vista de inicio
  Widget build(BuildContext context) {
    // Retorna un Layout con la página actual y un hijo Column
    return Layout(
      currentPage: 'HomeView',
      child: Column(
        children: <Widget>[
          // Añade un Paginator al principio de la Column
          Paginator(),
          // Añade un espacio de 20.0 píxeles después del Paginator
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              // Añade un ProductsArea después del espacio
              child: ProductsArea()),
        ],
      ),
    );
  }
}
