import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/pos_server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    // final deliveryCubit = context.read<DeliveryCubit>();
    final orderCubit = context.read<OrderCubit>();
    final espCubit = context.read<EspCubit>();

    channel.sink.add('${espCubit.state}');

    channel.stream.listen(
      (_) {
        final message = {
          'type': Message.reviewOrder.value,
          'table_id': espCubit.state
          // 'invoice_dishes_id': deliveryCubit.state,
        };
        orderCubit.forwardMessage(jsonEncode(message));
        // deliveryCubit.reset();
      },
    );
  });

  return handler(context);
}
