part of 'products_bloc.dart';

sealed class ProductsState {
  final int pages;
  final int currentPage;
  ProductsState({required this.pages,required this.currentPage});
}

final class ProductsInitial extends ProductsState {
  ProductsInitial() : super(pages: 0, currentPage: 0);
}

final class ProductsLoading extends ProductsState {
  ProductsLoading() : super(pages: 0, currentPage: 0);
}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> productModel;
  ProductsLoaded(this.productModel , {required int pages,required int currentPage}) : super(pages: pages, currentPage: currentPage);
}

final class ProductsError extends ProductsState {
  ProductsError() : super(pages: 0, currentPage: 0);
}
