part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  ProductsState();
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductsModel> productsModel;
  ProductsLoadedState(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

class ProductsErrorState extends ProductsState {
  final String errorMessage;
  ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
