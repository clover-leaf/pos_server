import 'package:dart_frog/dart_frog.dart';
import 'package:pos_server/server/middleware/server_provider.dart';

Handler middleware(Handler handler) => handler
    .use(orderProvider)
    .use(deliveryProvider)
    .use(waitingProvider)
    .use(readyProvider)
    .use(supabaseProvider)
    .use(espProvider)
    .use(requestLogger());
