import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/server/server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    print('connected');

    // final kitchenCubit = context.read<KitchenCubit>();
    final menuCubit = context.read<MenuCubit>()..subscribe(channel);

    // Listen for messages from the client.
    channel.stream.listen(
      (event) {
        final data = jsonDecode(event as String) as Map<String, dynamic>;
        switch (data['type']) {
          case 'request_menu':
            channel.sink.add(menuCubit.state);
            break;
          case 'update_menu':
            final menu = (data['menu'] as List<dynamic>)
                .map((item) => Item.fromJson(item as Map<String, dynamic>))
                .toList();
            menuCubit.update(menu);
            break;
          default:
            break;
        }
      },
    );
  });

  return handler(context);
}
