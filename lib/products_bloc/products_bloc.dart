import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {});

    on<LoadProducts>((event, emit) async {
      emit(ProductsLoading());

      await Future.delayed(const Duration(seconds: 2));

      emit(ProductsLoaded());
    });
  }
}
