import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_challenge/constants/color.dart';
import 'package:test_challenge/provider/cart_provider.dart';
import 'package:test_challenge/screens/dashboard.dart';
import 'package:test_challenge/shared/navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shopping App Demo',
            theme: ThemeData(
              primarySwatch: themeWhite,
            ),
            home: const Scaffold(
              body: Dashboard(),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Navbar(
                  title: '',
                ),
              ),
            ));
      }),
    );
  }
}
