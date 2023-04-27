import 'package:broadcast_bloc/broadcast_bloc.dart';

class WaitingCubit extends Cubit<String> {
  // Create an instance with an initial state of empty String.
  WaitingCubit() : super('');

  void setWaitingMsg(String msg) {
    emit(msg);
  }
}
