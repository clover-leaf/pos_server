import 'dart:convert';

import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:pos_server/server/server.dart';

class MenuCubit extends BroadcastCubit<String> {
  // Create an instance with an initial state of 0.
  MenuCubit() : super('');

  void initial() {
    final menu = [
      Item(name: 'lemonade', price: 1.99, inStock: true),
      Item(name: 'latte', price: 3.99, inStock: true),
      Item(name: 'smoothie', price: 4.99, inStock: true),
      Item(name: 'water', price: 0.99, inStock: true),
    ];
    emit(jsonEncode(menu));
  }

  void updateItem(Item item) {
    final menu = (jsonDecode(state) as List<dynamic>)
        .map((item) => Item.fromJson(item as Map<String, dynamic>))
        .toList();
    final index = menu.indexWhere((item_) => item_.id == item.id);
    if (index != -1) {
      menu[index] = item;
      emit(jsonEncode(menu));
    }
  }
}
