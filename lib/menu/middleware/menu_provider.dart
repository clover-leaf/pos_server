import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/menu/menu.dart';

final _menu = MenuCubit()..initial();

/// Provide the menu instance via `RequestContext`.
final menuProvider = provider<MenuCubit>((_) => _menu);
