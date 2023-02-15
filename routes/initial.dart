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

    final cSideDish = Category(name: 'Side dish');
    final cSpaghetti = Category(name: 'Spaghetti');
    final cFish = Category(name: 'Fish');

    final dSteamedRice = Dish(
      name: 'Steamed Rice',
      categoryId: cSideDish.id,
      price: 3.75,
      description:
          'Steamed grain rice never sticks together after boiling, it also '
          'remains the same tasty and crisp, even after re-heating meals.',
    );
    final dFrenchFries = Dish(
      name: 'French Fries',
      categoryId: cSideDish.id,
      price: 3.5,
      description: 'They aren’t just incredibly delicious, they’re also 100%'
          ' vegan without chemicals, toxic preservatives or other nasties. ',
    );

    final doSteamedRiceSize = DishOption(
      dishId: dSteamedRice.id,
      name: 'Size',
      type: OptionType.singleChoice,
    );
    final doSteamedRiceIngridients = DishOption(
      dishId: dSteamedRice.id,
      name: 'Ingridients',
      type: OptionType.multiChoice,
    );

    final oSteamedRiceSizeSmall = Option(
      dishOptionId: doSteamedRiceSize.id,
      name: 'Small',
      additionalCharge: 0,
    );
    final oSteamedRiceSizeMedium = Option(
      dishOptionId: doSteamedRiceSize.id,
      name: 'Medium',
      additionalCharge: 5,
    );
    final oSteamedRiceSizeBig = Option(
      dishOptionId: doSteamedRiceSize.id,
      name: 'Big',
      additionalCharge: 10,
    );

    final oSteamedRiceIngridientsSpicy = Option(
      dishOptionId: doSteamedRiceIngridients.id,
      name: 'Spicy',
      additionalCharge: 0,
    );
    final oSteamedRiceIngridientsSauce = Option(
      dishOptionId: doSteamedRiceIngridients.id,
      name: 'Sauce',
      additionalCharge: 0,
    );
    final oSteamedRiceIngridientsSpecial = Option(
      dishOptionId: doSteamedRiceIngridients.id,
      name: 'Special',
      additionalCharge: 0,
    );
    final oSteamedRiceIngridientsBread = Option(
      dishOptionId: doSteamedRiceIngridients.id,
      name: 'Bread',
      additionalCharge: 0,
    );
    final oSteamedRiceIngridientsGalic = Option(
      dishOptionId: doSteamedRiceIngridients.id,
      name: 'Galic',
      additionalCharge: 0,
    );

    // insert data
    await supabase.from('category').insert([
      cSideDish.toJson(),
      cSpaghetti.toJson(),
      cFish.toJson(),
    ]);

    await supabase.from('dish').insert([
      dSteamedRice.toJson(),
      dFrenchFries.toJson(),
    ]);

    await supabase.from('dish_option').insert([
      doSteamedRiceSize.toJson(),
      doSteamedRiceIngridients.toJson(),
    ]);

    await supabase.from('option').insert([
      oSteamedRiceSizeSmall.toJson(),
      oSteamedRiceSizeMedium.toJson(),
      oSteamedRiceSizeBig.toJson(),
      oSteamedRiceIngridientsBread.toJson(),
      oSteamedRiceIngridientsGalic.toJson(),
      oSteamedRiceIngridientsSpecial.toJson(),
      oSteamedRiceIngridientsSauce.toJson(),
      oSteamedRiceIngridientsSpicy.toJson(),
    ]);

    return Response(body: 'success');
  }

  return Response(body: 'Error');
}
