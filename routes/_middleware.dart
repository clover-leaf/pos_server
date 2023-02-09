import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/kitchen/middleware/kitchen_provider.dart';
import 'package:pos_server/menu/middleware/menu_provider.dart';

Handler middleware(Handler handler) => handler
  ..use(kitchenProvider)
  ..use(menuProvider);
