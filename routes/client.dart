import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/server/server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    // final kitchenCubit = context.read<KitchenCubit>();
    final menuCubit = context.read<MenuCubit>()..subscribe(channel);

    // Listen for messages from the client.
    channel.stream.listen(
      (event) {
        final data = jsonDecode(event as String) as Map<String, dynamic>;
        switch (data['type']) {
          case Message.requestMenu:
            channel.sink.add(menuCubit.state);
            break;
          default:
            break;
        }
      },
    );
  });

  return handler(context);
}
