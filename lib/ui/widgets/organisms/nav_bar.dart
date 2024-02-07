import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_challenge/ui/pages/cart.dart';
import 'package:test_challenge/ui/pages/home.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';

// Creating a StatelessWidget for a general button
class OwnNavBar extends StatelessWidget {
  final String currentPage;

  const OwnNavBar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Row(
          mainAxisSize: MainAxisSize.values[1],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );
              },
              icon: Icon(Icons.home),
              color: currentPage == 'HomeView'
                  ? AppColors.secondaryColor
                  : Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartView(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart_sharp),
              color: currentPage == 'CartView'
                  ? AppColors.secondaryColor
                  : Colors.white,
            ),
          ]),
    ));
  }
}
