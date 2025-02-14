part of 'product_screen_bloc.dart';

sealed class ProductScreenState extends Equatable {
  const ProductScreenState();

  @override
  List<Object> get props => [];
}

final class ProductScreenLoading extends ProductScreenState {}

final class ProductScreenSuccess extends ProductScreenState {}

final class ProductScreenError extends ProductScreenState {}
