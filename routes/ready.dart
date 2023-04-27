// ignore_for_file: avoid_print

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/pos_server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    context.read<ReadyCubit>().subscribe(channel);

    channel.stream.listen(
      (message) {},
    );
  });

  return handler(context);
}
