import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:test_challenge/ui/pages/product.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: state.cart.length,
        itemBuilder: (context, index) {
          final cartItem = state.cart[index];
          final product = cartItem['product'];
          final quantity = cartItem['quantity'];

          return GestureDetector(
            onTap: () {
              BlocProvider.of<ProductBloc>(context).add(
                SelectProduct(product),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductView(),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  product['images'][0]['image'],
                  width: 100,
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: Text(product['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.clip)),
                    ),
                    Text('Cantidad: $quantity'),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(62, 0, 0, 0),
                        blurRadius: 5,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<ProductBloc>()
                          .add(RemoveFromCart(product['_id']));
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
