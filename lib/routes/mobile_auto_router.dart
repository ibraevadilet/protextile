import 'package:auto_route/auto_route.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: BottomNavigatorRoute.page),
        AutoRoute(page: ProfileEditRoute.page),
      ];
}
