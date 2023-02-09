import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/kitchen/kitchen.dart';

final _kitchen = KitchenCubit();

/// Provide the kitchen instance via `RequestContext`.
final kitchenProvider = provider<KitchenCubit>((_) => _kitchen);
