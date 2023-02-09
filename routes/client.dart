import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:pos_server/kitchen/kitchen.dart';
import 'package:pos_server/menu/cubit/menu_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final kitchenCubit = context.read<KitchenCubit>();
    final menuCubit = context.read<MenuCubit>()..subscribe(channel);

    // Listen for messages from the client.
    channel.stream.listen(
      (orders) => kitchenCubit.update(orders.toString()),
    );
  });

  return handler(context);
}
