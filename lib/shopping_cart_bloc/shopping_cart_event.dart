part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartEvent {}


class AddProduct extends ShoppingCartEvent {
  final ProductModel product;
  final String sku;
  final int count;
  AddProduct({required this.product, required this.sku, required this.count});
}