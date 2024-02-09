import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_challenge/models/product_card_model.dart';
import 'package:test_challenge/models/product_model.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartInitial(products: [])) {
    on<ShoppingCartEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<AddProduct>((event, emit) {
      // TODO: implement event handler
      List<ProductCardModel> list = state.products;

      list.add(ProductCardModel(
        product: event.product, 
        count: event.count,
        sku: event.sku,
      ));

      emit(ShoppingCartInitial(products: list));
    });

    
  }
}
