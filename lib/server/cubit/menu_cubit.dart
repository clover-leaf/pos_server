import 'dart:convert';

import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:pos_server/server/server.dart';

class MenuCubit extends BroadcastCubit<String> {
  // Create an instance with an initial state of 0.
  MenuCubit() : super('');

  void initial() {
    final menu = [
      Item(name: 'lemonade', price: 1.99),
      Item(name: 'latte', price: 3.99),
      Item(name: 'smoothie', price: 4.99),
      Item(name: 'water', price: 0.99),
    ];
    emit(jsonEncode(menu));
  }
}
