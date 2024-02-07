import "package:flutter/material.dart";
import "package:test_challenge/constants/color.dart";
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:test_challenge/provider/cart_provider.dart';
import 'package:test_challenge/screens/cart.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required String title,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return AppBar(
      centerTitle: false,
      title: const Text("MERCAPP"),
      elevation: 0,
      backgroundColor: themeColorLight,
      actions: [
        badges.Badge(
          badgeContent: Consumer<CartProvider>(
            builder: (context, value, child) {
              return Text(
                value.getCounter().toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
          ),
          position: const badges.BadgePosition(start: 30, bottom: 30),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
      ],
    );
  }
}
