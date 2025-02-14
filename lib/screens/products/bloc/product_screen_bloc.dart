import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_screen_event.dart';
part 'product_screen_state.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  ProductScreenBloc() : super(ProductScreenLoading()) {
    on<ProductScreenEvent>((event, emit) async {
      if (event is ProductScreenStarted) {
        emit(ProductScreenLoading());
        await Future.delayed(Duration(milliseconds: 3000));
        emit(ProductScreenSuccess());
      }
    });
  }
}
