// Importa las librerías necesarias
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:test_challenge/ui/widgets/atoms/price_area.dart';
import 'package:test_challenge/ui/widgets/organisms/cart_list.dart';
import 'package:test_challenge/ui/widgets/organisms/layout.dart';

// Define la vista del carrito
class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna un Layout con la página actual y un hijo BlocBuilder
    return Layout(
      currentPage: 'CartView',
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          // Inicializa el total y el total en dólares a 0
          double total = 0;
          double totalUsd = 0;
          // Itera sobre cada producto en el carrito
          state.cart.forEach((item) {
            // Suma el precio de la oferta o el precio regular al total
            total += item['product']!['offer_price'] != null
                ? item['product']['offer_price']
                : item['product']['regular_price'] * item['quantity'];
            // Suma el precio de la oferta en dólares o el precio regular en dólares al total en dólares
            totalUsd += item['product']!['offer_usd'] != null
                ? item['product']['offer_usd']
                : item['product']['regular_usd'] * item['quantity'];
          });

          // Retorna un SizedBox con un ancho igual al ancho de la pantalla
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            // El hijo es una Column con CartList y PriceArea como hijos
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CartList(),
              PriceArea(bolivares: total, dolares: totalUsd),
            ]),
          );
        },
      ),
    );
  }
}
