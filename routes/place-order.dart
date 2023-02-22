import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/server/cubit/order_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == HttpMethod.post.value) {
    final orderCubit = context.read<OrderCubit>();
    final message = await request.body();
    orderCubit.forwarrdOrder(message);
    return Response(body: jsonEncode({'message': 'success'}));
  }

  return Response(body: jsonEncode({'message': 'error'}));
}
