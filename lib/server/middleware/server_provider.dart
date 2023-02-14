import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/server/server.dart';

/// Provide the menu instance via `RequestContext`.
final _menu = MenuCubit()..initial();
final menuProvider = provider<MenuCubit>((_) => _menu);

/// Provide the order instance via `RequestContext`.
final _order = OrderCubit();
final orderProvider = provider<OrderCubit>((_) => _order);
