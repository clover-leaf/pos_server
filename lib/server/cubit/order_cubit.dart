import 'package:broadcast_bloc/broadcast_bloc.dart';

class OrderCubit extends BroadcastCubit<String> {
  // Create an instance with an initial state of empty String.
  OrderCubit() : super('');

  void forwarrdOrder(String order) => emit(order);
}
