import 'package:broadcast_bloc/broadcast_bloc.dart';

class ReadyCubit extends BroadcastCubit<bool> {
  // Create an instance with an initial state of empty String.
  ReadyCubit() : super(false);

  void update({required bool isReady}) {
    emit(isReady);
  }
}
