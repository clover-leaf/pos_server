// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/ws-order.dart' as ws_order;
import '../routes/request-menu.dart' as request_menu;
import '../routes/initial.dart' as initial;
import '../routes/esp.dart' as esp;

import '../routes/_middleware.dart' as middleware;

void main() => createServer();

Future<HttpServer> createServer() async {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final handler = Cascade().add(buildRootHandler()).handler;
  final server = await serve(handler, address, port);
  print('\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');
  return server;
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/ws-order', (context) => ws_order.onRequest(context,))..all('/request-menu', (context) => request_menu.onRequest(context,))..all('/initial', (context) => initial.onRequest(context,))..all('/esp', (context) => esp.onRequest(context,));
  return pipeline.addHandler(router);
}
