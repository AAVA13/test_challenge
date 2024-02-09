import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/home/page/home_page.dart';
import 'package:test_challenge/products_bloc/products_bloc.dart';
import 'package:test_challenge/shopping_cart_bloc/shopping_cart_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsBloc()..add(LoadProducts(index: 0))),
        BlocProvider(create: (context) => ShoppingCartBloc()),
      ],
      child: MaterialApp(
        initialRoute: 'home',
        routes: {
          'home' :(context) => const HomePage(),
        },
      ),
    );
  }
}