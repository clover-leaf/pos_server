import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/pos_server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final deliveryCubit = context.read<DeliveryCubit>();
    final orderCubit = context.read<OrderCubit>();
    final waitingCubit = context.read<WaitingCubit>();
    final readyCubit = context.read<ReadyCubit>();
    final espCubit = context.read<EspCubit>()..subscribe(channel);

    channel.stream.listen(
      (msg) {
        final value = int.parse(msg as String);
        print(value);
        switch (value) {
          // no food on robot
          case 0:
            readyCubit.update(value);
            break;
          // food on robot, start deliver
          case 1:
            // inform to app
            readyCubit.update(value);
            orderCubit.forwardMessage(waitingCubit.state);
            break;
          // robot is delivering and cannot not start new deliver
          case 2:
            readyCubit.update(value);
            break;
          // done deliver
          case 3:
            final message = {
              'type': Message.reviewOrder.value,
              'table_id': espCubit.state,
              'invoice_dishes_id': deliveryCubit.state,
            };
            orderCubit.forwardMessage(jsonEncode(message));
            print('del');
            // deliveryCubit.reset();
            break;
          default:
        }
      },
    );
  });

  return handler(context);
}
