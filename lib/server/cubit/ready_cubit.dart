import 'package:broadcast_bloc/broadcast_bloc.dart';

class ReadyCubit extends BroadcastCubit<int> {
  // Create an instance with an initial state of empty String.
  ReadyCubit() : super(0);

  void update(int isReady) {
    emit(isReady);
  }
}
