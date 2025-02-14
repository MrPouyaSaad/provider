import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersLoading()) {
    on<OrdersEvent>((event, emit) async {
      if (event is OrdersStarted) {
        emit(OrdersLoading());
        await Future.delayed(Duration(milliseconds: 3000));
        emit(OrdersSuccess());
      }
    });
  }
}
