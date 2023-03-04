import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/pos_server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final cubit = context.read<OrderCubit>()..subscribe(channel);
    // Listen for messages from the client.
    channel.stream.listen(
      (message) {
        cubit.forwardMessage(message as String);
      },
    );
  });

  return handler(context);
}
