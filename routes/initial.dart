import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/server/server.dart';
import 'package:supabase/supabase.dart';

Future<Response> onRequest(RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == HttpMethod.get.value) {
    final supabase = context.read<SupabaseClient>();

    const c0 = Category(id: 0, name: 'Breakfast');
    const c1 = Category(id: 1, name: 'Sides');
    const c2 = Category(id: 2, name: 'Mains');
    const c3 = Category(id: 3, name: 'Salads');
    const c4 = Category(id: 4, name: 'Drinks');

    final d0 = Dish(
      name: 'Bacon & Eggs',
      categoryId: c0.id,
      price: 5.49,
      url:
          'https://drive.google.com/file/d/1r43zXyYw5Y3_Ycx9kgE8EP8wIAb-Htz4/view?usp=sharing',
    );
    final d1 = Dish(
      name: 'French fries',
      categoryId: c1.id,
      price: 1.99,
      url:
          'https://drive.google.com/file/d/1as9MGcWzr9jQIVdQRffJyU4YOAvUAk6X/view?usp=sharing',
    );
    final d2 = Dish(
      name: 'Baked Lamb Chops',
      categoryId: c2.id,
      price: 15.99,
      url:
          'https://drive.google.com/file/d/1xJusbRJs5WRrueX7c62u1B4OWgsQsY64/view?usp=sharing',
    );
    final d3 = Dish(
      name: 'Shrimp Salad',
      categoryId: c3.id,
      price: 7.99,
      url:
          'https://drive.google.com/file/d/1nxl5qWCPA5rHaj5d9yEwIRvGgwQsEs1S/view?usp=sharing',
    );

    final d4 = Dish(
      name: 'Cappuccino',
      categoryId: c4.id,
      price: 3.99,
      url:
          'https://drive.google.com/file/d/1nPSfH_1C4AsABE_Xe2tP0LbYknyEim09/view?usp=sharing',
    );

    // insert data
    await supabase.from('category').insert([
      c0.toJson(),
      c1.toJson(),
      c2.toJson(),
      c3.toJson(),
      c4.toJson(),
    ]);

    await supabase.from('dish').insert([
      d0.toJson(),
      d1.toJson(),
      d2.toJson(),
      d3.toJson(),
      d4.toJson(),
    ]);

    return Response(body: 'success');
  }

  return Response(body: 'Error');
}
