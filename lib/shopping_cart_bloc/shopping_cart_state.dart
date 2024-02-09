part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartState {
  final List<ProductCardModel> products;
  ShoppingCartState({required this.products});
}

final class ShoppingCartInitial extends ShoppingCartState {
  ShoppingCartInitial({required super.products});
}
