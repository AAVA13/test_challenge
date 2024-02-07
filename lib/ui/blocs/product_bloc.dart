import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_challenge/domain/use_case.dart';

// Enumeración para el estado del producto
enum ProductStatus { loading, success, failed }

// Clase base para los eventos del producto
abstract class ProductEvent {}

// Evento para obtener productos
class FetchProducts extends ProductEvent {
  FetchProducts();
}

// Evento para cambiar de página
class ChangePage extends ProductEvent {
  final int page;

  ChangePage(this.page);
}

// Evento para seleccionar un producto
class SelectProduct extends ProductEvent {
  final Map<String, dynamic>? product;

  SelectProduct(this.product);
}

// Evento para agregar un producto al carrito
class AddToCart extends ProductEvent {
  final Map<String, dynamic>? product;
  final int quantity;

  AddToCart(this.product, this.quantity);
}

// Evento para eliminar un producto del carrito
class RemoveFromCart extends ProductEvent {
  final String productId;

  RemoveFromCart(this.productId);
}

// Clase para el estado del producto
class ProductState {
  final List<dynamic> products;
  final Map<String, dynamic>? selectedProduct;
  final List<dynamic> cart;
  final ProductStatus status;
  final int page;

  ProductState({
    this.products = const [],
    this.selectedProduct,
    this.cart = const [],
    required this.status,
    this.page = 1,
  });

  // Método para copiar el estado del producto
  ProductState copyWith({
    List<dynamic>? products,
    Map<String, dynamic>? selectedProduct,
    List<dynamic>? cart,
    ProductStatus? status,
    int? page,
  }) {
    return ProductState(
      products: products ?? this.products,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      cart: cart ?? this.cart,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }
}

// Clase para el bloque del producto
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final UseCase _useCase;

  ProductBloc(this._useCase)
      : super(ProductState(status: ProductStatus.loading)) {
    // Manejador para el evento FetchProducts
    on<FetchProducts>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.loading));
      try {
        final products = await _useCase.getProductDemo(state.page);
        emit(state.copyWith(status: ProductStatus.success, products: products));
      } catch (_) {
        emit(state.copyWith(status: ProductStatus.failed));
      }
    });

    // Manejador para el evento SelectProduct
    on<SelectProduct>((event, emit) {
      emit(state.copyWith(
          products: state.products, selectedProduct: event.product));
    });

    // Manejador para el evento ChangePage
    on<ChangePage>((event, emit) {
      if (event.page > 0) {
        emit(state.copyWith(page: event.page));
        add(FetchProducts());
      }
    });

    // Manejador para el evento AddToCart
    on<AddToCart>((event, emit) {
      final existingProduct = state.cart.firstWhere(
        (item) => item['product']['_id'] == event.product!['_id'],
        orElse: () => {},
      );

      if (existingProduct.isNotEmpty) {
        existingProduct['quantity'] =
            event.quantity + existingProduct['quantity'];
        Fluttertoast.showToast(
          msg: "Producto actualizado en el carrito",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        final store = event.product!['store'];
        final hasOtherStore =
            state.cart.any((item) => item['product']['store'] != store);

        if (hasOtherStore) {
          Fluttertoast.showToast(
            msg: "No puedes agregar productos de diferentes tiendas",
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        } else {
          emit(state.copyWith(
            products: state.products,
            selectedProduct: state.selectedProduct,
            cart: List.from(state.cart)
              ..add({'product': event.product, 'quantity': event.quantity}),
          ));
          Fluttertoast.showToast(
            msg: "Producto añadido al carrito",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        }
      }
    });

    // Manejador para el evento RemoveFromCart
    on<RemoveFromCart>((event, emit) {
      emit(state.copyWith(
        products: state.products,
        selectedProduct: state.selectedProduct,
        cart: List.from(state.cart)
          ..removeWhere((item) => item['product']['_id'] == event.productId),
      ));
    });
  }
}
