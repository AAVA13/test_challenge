import 'package:bloc/bloc.dart';
import 'package:test_challenge/api/products_api.dart';
import 'package:test_challenge/models/product_model.dart';
import 'package:test_challenge/models/request_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {});

    on<LoadProducts>((event, emit) async {
      emit(ProductsLoading());
      
      //await Future.delayed(const Duration(seconds: 2));
      RequestModel request = await ProductsApiImpl().getProducts(event.index);

      emit(ProductsLoaded(
        request.products,
        currentPage: event.index,
        pages: request.pages,
      ));


    });
  }
}
