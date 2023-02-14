import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/server/server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final orderCubit = context.read<OrderCubit>()..subscribe(channel);

    // Listen for messages from the client.
    channel.stream.listen(
      (event) {
        final data = jsonDecode(event as String) as Map<String, dynamic>;
        switch (data['type']) {
          case 'place_order':
            final order = Order.fromJson(data['order'] as Map<String, dynamic>);
            orderCubit.placeOrder(order);
            break;
          default:
            break;
        }
      },
    );
  });

  return handler(context);
}
