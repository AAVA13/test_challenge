import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_challenge/features/products/presentation/providers/product_repository_provider.dart';

import '../../domain/domain.dart';

///Permite suscribirse al estado y recibir notificaciones en tiempo real de los cambios
final productProvider =
    StateNotifierProvider.autoDispose.family<ProductNotifier, ProductState, String>((ref, productId) {
  return ProductNotifier(productsRepository: ref.watch(productRepositoryProvider), productId: productId);
});

///Clase que representa un estado el cual notifica constantemente al recibir cambios en el estado del producto
class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepository productsRepository;

  ProductNotifier({
    required String productId,
    required this.productsRepository,
  }) : super(ProductState(id: productId)) {
    loadProduct();
  }

  ///Método encargado de iniciar la carga de un producto
  Future<void> loadProduct() async {
    try {
      final product = await productsRepository.getProductById(state.id);
      state = state.copyWith(
        product: product,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: true,
        errorMessage: e.toString(),
      );
    }
  }
}

///Clase que representa el estado de un producto en la interfaz gráfica
class ProductState {
  final String id;
  final Product? product;
  final bool isLoading;
  final bool error;
  final String errorMessage;

  ProductState({
    required this.id,
    this.product,
    this.isLoading = true,
    this.error = false,
    this.errorMessage = '',
  });

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? error,
    String? errorMessage,
  }) =>
      ProductState(
        id: id ?? this.id,
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
