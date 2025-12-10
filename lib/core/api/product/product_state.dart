part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductResponse productResponse;

  ProductLoaded({required this.productResponse});
  @override
  List<Object?> get props => [productResponse];
}

class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
  @override
  List<Object?> get props => [message];
}
