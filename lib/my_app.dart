import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_challenge/ui/pages/home.dart';
import 'package:test_challenge/domain/use_case.dart';
import 'package:test_challenge/ui/widgets/constants/constants.dart';
import 'package:test_challenge/ui/widgets/organisms/nav_bar.dart';
import 'ui/widgets/organisms/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  final UseCase useCase;

  const MyApp({required this.useCase});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'test_challenge Deep Company',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
          ),
          useMaterial3: true,
        ),
        home: HomeView());
  }
}
