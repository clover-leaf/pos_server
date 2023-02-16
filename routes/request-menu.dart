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
    final dishOption =
        await supabase.from('dish_option').select<List<Map<String, dynamic>>>();
    final option =
        await supabase.from('option').select<List<Map<String, dynamic>>>();
    return Response(
      body: jsonEncode({
        'category': category,
        'dish': dish,
        'dish_option': dishOption,
        'option': option,
      }),
    );
  }

  return Response(body: jsonEncode({'message': 'error'}));
}
