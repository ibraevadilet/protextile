// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:protextile/features/auth/presentation/auth_screen/auth_screen.dart'
    as _i1;
import 'package:protextile/features/auth/presentation/registaration_screen/register_screen.dart'
    as _i4;
import 'package:protextile/features/bottom_navigator/presentation/bottom_navigator_screen.dart'
    as _i2;
import 'package:protextile/features/profile/domain/entity/user_entity.dart'
    as _i8;
import 'package:protextile/features/profile/presentation/edit_profile_screen/profile_edit_screen.dart'
    as _i3;
import 'package:protextile/features/splash/splash_screen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    BottomNavigatorRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavigatorScreen(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileEditRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProfileEditScreen(
          key: args.key,
          currantUserData: args.currantUserData,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavigatorScreen]
class BottomNavigatorRoute extends _i6.PageRouteInfo<void> {
  const BottomNavigatorRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BottomNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigatorRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProfileEditScreen]
class ProfileEditRoute extends _i6.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i7.Key? key,
    required _i8.UserEntity currantUserData,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProfileEditRoute.name,
          args: ProfileEditRouteArgs(
            key: key,
            currantUserData: currantUserData,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static const _i6.PageInfo<ProfileEditRouteArgs> page =
      _i6.PageInfo<ProfileEditRouteArgs>(name);
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({
    this.key,
    required this.currantUserData,
  });

  final _i7.Key? key;

  final _i8.UserEntity currantUserData;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, currantUserData: $currantUserData}';
  }
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
