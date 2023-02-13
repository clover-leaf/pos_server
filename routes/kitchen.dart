import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/server/server.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      // A new client has connected to our server.
      // Subscribe the new client to receive notifications
      // whenever the cubit state changes.
      final cubit = context.read<KitchenCubit>()..subscribe(channel);

      // Listen for messages from the client.
      channel.stream.listen(
        print,
        // The client has disconnected.
        // Unsubscribe the channel.
        onDone: () => cubit.unsubscribe(channel),
      );
    },
  );

  return handler(context);
}
