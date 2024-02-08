import 'package:bloc/bloc.dart';
import 'package:test_challenge/api/products_api.dart';
import 'package:test_challenge/models/product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial(1)) {
    on<ProductsEvent>((event, emit) {});

    on<LoadProducts>((event, emit) async {
      emit(ProductsLoading(1));
      
      //await Future.delayed(const Duration(seconds: 2));
      List<ProductModel> products = await ProductsApiImpl().getProducts(event.index);

      emit(ProductsLoaded(products,1));


    });
  }
}
