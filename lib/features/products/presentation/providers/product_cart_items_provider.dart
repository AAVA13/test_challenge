import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_challenge/features/products/domain/domain.dart';

///Calcula el precio total de los productos en el carrito
final totalPriceProvider = Provider<double>((ref) {
  double total = 0.0;
  ref.watch(productCartItemsProvider).forEach((element) {
    total += element.quantity * element.product.regularPrice;
  });
  return total;
});

///Calcula el numero de items total de los productos en el carrito
final totalItemsProvider = Provider<int>((ref) {
  int total = 0;
  ref.watch(productCartItemsProvider).forEach((element) {
    total += element.quantity;
  });
  return total;
});

final productCartItemsProvider = StateNotifierProvider<ProductCartItemsNotifier, List<ProductCartItem>>((ref) {
  return ProductCartItemsNotifier();
});

class ProductCartItemsNotifier extends StateNotifier<List<ProductCartItem>> {
  ProductCartItemsNotifier() : super([]);

  ///Agrega un item al carrito.
  void addToCart(ProductCartItem productCartItem) {
    final isProductInCar = state.any((item) => item.product.id == productCartItem.product.id);
    if (!isProductInCar) {
      state = [...state, productCartItem];
      return;
    }
    state = [
      for (final product in state)
        if (product.product.id == productCartItem.product.id)
          product.copyWith(quantity: product.quantity + productCartItem.quantity)
        else
          product
    ];
  }

  ///Elimina el item del carrito
  void removeToCart(ProductCartItem productCartItem) {
    state = state.where((element) => element.product.id != productCartItem.product.id).toList();
  }

  ///decrementa el contador del producto en la vista Shopping_cart
  void decrementCount(ProductCartItem productCartItem) {
    state = [
      for (final product in state)
        if (product.product.id == productCartItem.product.id)
          product.copyWith(quantity: product.quantity - 1)
        else
          product
    ];
  }

  ///Incrementa el contador del producto en la vista Shopping_cart
  void incrementCount(ProductCartItem productCartItem) {
    state = [
      for (final product in state)
        if (product.product.id == productCartItem.product.id)
          product.copyWith(quantity: product.quantity + 1)
        else
          product
    ];
  }
}

///Permite suscribirse al estado y recibir notificaciones en tiempo real de los cambios
final productCartItemProvider = StateNotifierProvider.family<ProductCartItemNotifier, ProductCartItem, Product>(
  (ref, product) => ProductCartItemNotifier(product: product),
);

///Clase que representa un estado el cual notifica constantemente al recibir cambios
class ProductCartItemNotifier extends StateNotifier<ProductCartItem> {
  final Product product;

  ProductCartItemNotifier({required this.product}) : super(ProductCartItem(product: product));

  ///Incrementa el contador del producto en la vista ProductScreen
  void incrementCount() {
    state = state.copyWith(product: product, quantity: state.quantity + 1);
  }

  ///Decrementa el contador del producto en la vista ProductScreen
  void decrementCount() {
    if (state.quantity == 0) return;
    state = state.copyWith(product: product, quantity: state.quantity - 1);
  }
}

///Clase que representa el estado de un producto el cual fue agregado al carrito en la interfaz gráfica
class ProductCartItem {
  final Product product;
  final int quantity;

  ProductCartItem({required this.product, this.quantity = 0});

  ProductCartItem copyWith({
    Product? product,
    int? quantity,
  }) =>
      ProductCartItem(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
      );
}
