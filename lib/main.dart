// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:protextile/core/constants/app_text_constants.dart';
import 'package:protextile/routes/mobile_auto_router.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/theme/app_theme.dart';
import 'package:protextile/widgets/app_scroll_behavior.dart';
import 'package:protextile/widgets/init_widget.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = sl<AppRouter>();

void main() async {
  await Future.wait([
    init(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]);
  runApp(const Main());
  
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(
        builder: (context) => MaterialApp.router(
          scrollBehavior: AppScrollBehavior(),
          scaffoldMessengerKey: scaffoldKey,
          theme: lightTheme,
          title: AppTextConstants.appTitle,
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(appRouter),
          routeInformationProvider: appRouter.routeInfoProvider(),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
        ),
      ),
    );
  }
}
