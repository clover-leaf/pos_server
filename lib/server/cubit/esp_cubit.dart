import 'package:broadcast_bloc/broadcast_bloc.dart';

class EspCubit extends BroadcastCubit<int> {
  EspCubit() : super(-1);

  void toTable(int tableId) {
    emit(tableId);
  }
}
