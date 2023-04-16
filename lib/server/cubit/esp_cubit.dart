import 'package:broadcast_bloc/broadcast_bloc.dart';

class EspCubit extends BroadcastCubit<String> {
  EspCubit() : super('');

  void toTable(String tableId) {
    emit(tableId);
  }
}
