import 'dart:convert';

import 'package:dart_frog/dart_frog.dart' as frog;
import 'package:supabase/supabase.dart';

Future<frog.Response> onRequest(frog.RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == frog.HttpMethod.get.value) {
    final supabase = context.read<SupabaseClient>();

    final category =
        await supabase.from('category').select<List<Map<String, dynamic>>>();
    final dish =
        await supabase.from('dish').select<List<Map<String, dynamic>>>();
    return frog.Response(
      body: jsonEncode({
        'category': category,
        'dish': dish,
      }),
    );
  }

  return frog.Response(body: jsonEncode({'message': 'error'}));
}
