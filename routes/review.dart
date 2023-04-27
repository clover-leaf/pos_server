import 'dart:convert';

import 'package:dart_frog/dart_frog.dart' as frog;
import 'package:supabase/supabase.dart';

// ?id=uuid&star=4
Future<frog.Response> onRequest(frog.RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == frog.HttpMethod.get.value) {
    final params = request.uri.queryParameters;

    final dishId = params['id']!;
    final rating = int.parse(params['rating']!);

    final supabase = context.read<SupabaseClient>();

    await supabase.from('review').insert({'dish_id': dishId, 'rating': rating});
    return frog.Response(
      body: jsonEncode({
        'status': 'success',
      }),
    );
  }

  return frog.Response(statusCode: 404);
}
