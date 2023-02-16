// import 'dart:convert';

// import 'package:broadcast_bloc/broadcast_bloc.dart';
// import 'package:pos_server/server/server.dart';

// class OrderCubit extends BroadcastCubit<String> {
//   // Create an instance with an initial state of 0.
//   OrderCubit() : super('');

//   void placeOrder(Order order) {
//     final orders = (jsonDecode(state) as List<dynamic>)
//         .map((order) => Order.fromJson(order as Map<String, dynamic>))
//         .toList()
//       ..add(order);
//     emit(jsonEncode(orders));
//   }
// }
