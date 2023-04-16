import 'package:dart_frog/dart_frog.dart' as frog;
import 'package:pos_server/server/server.dart';
import 'package:supabase/supabase.dart';

Future<frog.Response> onRequest(frog.RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == frog.HttpMethod.get.value) {
    final supabase = context.read<SupabaseClient>();

    const c0 = Category(id: 0, name: 'Breakfast');
    const c1 = Category(id: 1, name: 'Sides');
    const c2 = Category(id: 2, name: 'Mains');
    const c3 = Category(id: 3, name: 'Salads');
    const c4 = Category(id: 4, name: 'Drinks');

    final breakfastDishes = [
      Dish(
        name: 'Fluffy Pancakes',
        categoryId: c0.id,
        price: 6.99,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Berry Yogurt',
        categoryId: c0.id,
        price: 4.49,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Roasted Potato',
        categoryId: c0.id,
        price: 4.99,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Poppy Seed Muffins',
        categoryId: c0.id,
        price: 3.49,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Sandwiches',
        categoryId: c0.id,
        price: 4.99,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Roasted Potato',
        categoryId: c0.id,
        price: 4.99,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Pineapple Smoothie',
        categoryId: c0.id,
        price: 3.49,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'French Toast',
        categoryId: c0.id,
        price: 6.49,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
      Dish(
        name: 'Omelet ',
        categoryId: c0.id,
        price: 3.59,
        url:
            'https://drive.google.com/uc?export=view&id=1sF2S6XACwPqDgxKQubE3Huwj7TDEPFUr',
      ),
    ];

    await supabase.from('dish').insert(breakfastDishes.map(toJson).toList());

    return frog.Response(body: 'success');
  }

  return frog.Response(body: 'Error');
}
