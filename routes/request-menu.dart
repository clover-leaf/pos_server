import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

Future<Response> onRequest(RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == HttpMethod.get.value) {
    final supabase = context.read<SupabaseClient>();

    final category =
        await supabase.from('category').select<List<Map<String, dynamic>>>();
    final dish =
        await supabase.from('dish').select<List<Map<String, dynamic>>>();
    return Response(
      body: jsonEncode({
        'category': category,
        'dish': dish,
      }),
    );
  }

  return Response(body: jsonEncode({'message': 'error'}));
}
