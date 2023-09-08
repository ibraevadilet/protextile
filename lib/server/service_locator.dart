import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:protextile/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:protextile/server/dio_settings.dart';
import 'package:protextile/features/splash/splash_cubit/splash_cubit.dart';
import 'package:protextile/routes/mobile_auto_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

// ignore: long-method
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => DioSettings(prefs: sl()).dio);
  sl.registerSingleton<AppRouter>(AppRouter());

  /// Repository

  /// UseCases

  /// BLoCs / Cubits

  sl.registerFactory<SplashCubit>(() => SplashCubit(prefs: sl()));
  sl.registerFactory<BottomNavigatorCubit>(() => BottomNavigatorCubit());
}
