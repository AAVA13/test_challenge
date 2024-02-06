part of 'products_bloc.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> productModel;
  ProductsLoaded(this.productModel);
}

final class ProductsError extends ProductsState {}
