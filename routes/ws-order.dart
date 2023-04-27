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
    final waitingCubit = context.read<WaitingCubit>();

    channel.stream.listen(
      (message) {
        final data = jsonDecode(message as String) as Map<String, dynamic>;
        if (data['type'] == Message.deliveryOrder.value) {
          waitingCubit.setWaitingMsg(message);
          // espCubit.toTable("${data['table_id'] as int}");
          espCubit.toTable('d958b814');
          final rawIds = data['dishes_id'] as List<dynamic>;
          deliveryCubit.delivery(rawIds.map((e) => e as String).toList());
        } else {
          orderCubit.forwardMessage(message);
        }
      },
    );
  });

  return handler(context);
}
