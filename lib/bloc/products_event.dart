part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  ProductsEvent();
  @override
  List<Object> get props => [];
}
class ProductsLoadedEvent extends Equatable {
  @override
  List<Object> get props => [];

}
