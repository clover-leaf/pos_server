import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/server/server.dart';

/// Provide the menu instance via `RequestContext`.
final _menu = MenuCubit()..initial();
final menuProvider = provider<MenuCubit>((_) => _menu);

/// Provide the kitchen instance via `RequestContext`.
final _kitchen = KitchenCubit();
final kitchenProvider = provider<KitchenCubit>((_) => _kitchen);
