part of 'products_bloc.dart';

sealed class ProductsState {
  final int page;

  ProductsState(this.page);
}

final class ProductsInitial extends ProductsState {
  ProductsInitial(super.page);
}

final class ProductsLoading extends ProductsState {
  ProductsLoading(super.page);
}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> productModel;
  ProductsLoaded(this.productModel,super.page);
}

final class ProductsError extends ProductsState {
  ProductsError(super.page);
}
