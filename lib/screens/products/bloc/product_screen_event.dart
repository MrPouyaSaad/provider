part of 'product_screen_bloc.dart';

sealed class ProductScreenEvent extends Equatable {
  const ProductScreenEvent();

  @override
  List<Object> get props => [];
}

class ProductScreenStarted extends ProductScreenEvent {}
