import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_challenge/data/repository.dart';
import 'package:test_challenge/data/endpoints.dart';
import 'package:test_challenge/domain/use_case.dart';
import 'my_app.dart';
import 'package:test_challenge/ui/blocs/product_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegúrate de que los widgets estén inicializados
  await initializeDateFormatting(); // Inicializa los datos de formato de fecha
  final networkService = NetworkService();
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final repository = RepositoryImpl(networkService);
  final useCase = UseCase(repository);
  final bloc = ProductBloc(useCase);
  FlutterNativeSplash.remove();

  runApp(
    BlocProvider(
      create: (context) => bloc,
      child: MyApp(useCase: useCase),
    ),
  );
}
