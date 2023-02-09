import 'package:broadcast_bloc/broadcast_bloc.dart';

class KitchenCubit extends BroadcastCubit<String> {
  // Create an instance with an initial state of 0.
  KitchenCubit() : super('');

  void update(String orders) => emit(orders);
}
