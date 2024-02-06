import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_challenge/features/products/presentation/providers/product_repository_provider.dart';

import '../../domain/domain.dart';
///Permite suscribirse al estado y recibir notificaciones en tiempo real de los cambios
final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(productsRepository: ref.watch(productRepositoryProvider));
});

///Clase que representa un estado el cual notifica constantemente al recibir cambios en el estado de los productos
class ProductsNotifier extends StateNotifier<ProductsState> {
  final ProductsRepository productsRepository;

  ProductsNotifier({required this.productsRepository}) : super(ProductsState()) {
    loadNextPage();
  }
  ///Método encargado de iniciar la carga de los productos
  void loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;
    state = state.copyWith(isLoading: true);
    final products = await productsRepository.getProductsByPage(page: state.page);
    if (products.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isLastPage: true,
      );
      return;
    }
    state = state.copyWith(
      isLoading: false,
      products: [...state.products, ...products],
      page: state.page + 1,
      isLastPage: false,
    );
  }
}

///Clase que representa el estado de la lista de productos en la interfaz gráfica
class ProductsState {
  final bool isLastPage;
  final int page;
  final bool isLoading;
  final List<Product> products;

  ProductsState({
    this.isLastPage = false,
    this.page = 0,
    this.isLoading = false,
    this.products = const [],
  });

  ProductsState copyWith({
    bool? isLastPage,
    int? page,
    int? offset,
    bool? isLoading,
    List<Product>? products,
  }) =>
      ProductsState(
        isLastPage: isLastPage ?? this.isLastPage,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products,
      );
}
