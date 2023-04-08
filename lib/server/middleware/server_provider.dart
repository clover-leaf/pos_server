import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/server/server.dart';
import 'package:supabase/supabase.dart';

/// Provide the menu instance via `RequestContext`.
final _menu = MenuCubit();
final menuProvider = provider<MenuCubit>((_) => _menu);

/// Provide the order instance via `RequestContext`.
final _order = OrderCubit();
final orderProvider = provider<OrderCubit>((_) => _order);

/// Provide the order instance via `RequestContext`.
final _delivery = DeliveryCubit();
final deliveryProvider = provider<DeliveryCubit>((_) => _delivery);

final _esp = EspCubit();
final espProvider = provider<EspCubit>((_) => _esp);

/// Provide the Supabase Client instance via `RequestContext`.
// ignore: lines_longer_than_80_chars
final _supabase = SupabaseClient(
  'https://tsbogigejoytrqsybqyh.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzYm9naWdlam95dHJxc3licXloIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NjQzNzU1MiwiZXhwIjoxOTkyMDEzNTUyfQ.7B_cWs2g63QgwN9hbx-gsuZ9pei94fP0RiCei2W5erg',
);
final supabaseProvider = provider<SupabaseClient>((_) => _supabase);
