// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/pos_server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final deliveryCubit = context.read<DeliveryCubit>();
    final orderCubit = context.read<OrderCubit>()..subscribe(channel);
    final espCubit = context.read<EspCubit>();

    channel.stream.listen(
      (message) {
        print(message);
        final data = jsonDecode(message as String) as Map<String, dynamic>;
        print(data);
        if (data['type'] == Message.deliveryOrder.value) {
          // espCubit.toTable(data['table_id'] as int);
          espCubit.toTable('d958b814');
          final rawIds = data['dishes_id'] as List<dynamic>;
          deliveryCubit.delivery(rawIds.map((e) => e as String).toList());
        }
        orderCubit.forwardMessage(message);
      },
    );
  });

  return handler(context);
}
