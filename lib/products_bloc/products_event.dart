part of 'products_bloc.dart';


sealed class ProductsEvent {}

class LoadProducts extends ProductsEvent {
  final int index;
  LoadProducts({required this.index});
}