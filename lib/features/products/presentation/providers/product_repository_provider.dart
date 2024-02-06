import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_challenge/features/products/infrastructure/datasources/products_datasource_impl.dart';
import 'package:test_challenge/features/products/infrastructure/repositories/products_repository_impl.dart';

///Se encarga de inicializar el repositorio y exponer su instancia
final productRepositoryProvider = Provider((ref) => ProductsRepositoryImpl(datasource: ProductsDatasourceImpl()));
