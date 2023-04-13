import 'package:broadcast_bloc/broadcast_bloc.dart';

class DeliveryCubit extends Cubit<List<String>> {
  // Create an instance with an initial state of empty String.
  DeliveryCubit() : super(<String>[]);

  void delivery(List<String> deliveryDishesID) {
    emit(deliveryDishesID);
  }

  void reset() => emit(<String>[]);
}
