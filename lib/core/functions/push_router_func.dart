import 'package:auto_route/auto_route.dart';
import 'package:protextile/routes/mobile_auto_router.dart';
import 'package:protextile/server/service_locator.dart';

pushFunction(PageRouteInfo<dynamic> route) {
  sl<AppRouter>().push(route);
}

pushAndPopUntilFunction(PageRouteInfo<dynamic> route) {
  sl<AppRouter>().pushAndPopUntil(
    route,
    predicate: (route) => false,
  );
}
