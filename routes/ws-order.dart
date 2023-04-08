import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/pos_server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final orderCubit = context.read<OrderCubit>()..subscribe(channel);
    final espCubit = context.read<EspCubit>()..subscribe(channel);

    // Listen for messages from the client.
    channel.stream.listen(
      (message) {
        final data = jsonDecode(message as String) as Map<String, dynamic>;
        if (data['type'] == Message.deliveryOrder.value) {
          espCubit.toTable(int.parse(data['table_id'] as String));
        }
        orderCubit.forwardMessage(message);
      },
    );
  });

  return handler(context);
}
