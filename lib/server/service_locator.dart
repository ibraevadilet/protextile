import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:protextile/core/constants/app_text_constants.dart';
import 'package:protextile/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:protextile/features/auth/domain/repo/auth_repo.dart';
import 'package:protextile/features/auth/presentation/auth_screen/cubits/auth_cubit/auth_cubit.dart';
import 'package:protextile/features/auth/presentation/registaration_screen/cubits/register_cubit/register_cubit.dart';
import 'package:protextile/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:protextile/features/profile/data/repo_impls/edit_profile_repo_impl.dart';
import 'package:protextile/features/profile/data/repo_impls/get_currant_user_data_repo_impl.dart';
import 'package:protextile/features/profile/domain/repos/edit_profile_repo.dart';
import 'package:protextile/features/profile/domain/repos/get_currant_user_data_repo.dart';
import 'package:protextile/features/profile/presentation/edit_profile_screen/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:protextile/features/profile/presentation/profile_main_screen/profile_cubit/profile_cubit.dart';
import 'package:protextile/features/splash/splash_cubit/splash_cubit.dart';
import 'package:protextile/routes/mobile_auto_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

// ignore: long-method
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Supabase.initialize(
    url: AppTextConstants.supabaseUrl,
    anonKey: AppTextConstants.anonKey,
  );
  final supabase = Supabase.instance.client;

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerLazySingleton<SupabaseClient>(() => supabase);

  /// Repository
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(supabase: sl()));
  sl.registerFactory<GetCurrantUserDataRepo>(
      () => GetCurrantUserDataRepoImpl(supabase: sl()));
  sl.registerFactory<EditProfileRepo>(
      () => EditProfileRepoImpl(supabase: sl()));

  /// UseCases

  /// BLoCs / Cubits

  sl.registerFactory<SplashCubit>(() => SplashCubit(supabsae: sl()));
  sl.registerLazySingleton<BottomNavigatorCubit>(() => BottomNavigatorCubit());
  sl.registerFactory<AuthCubit>(() => AuthCubit(repo: sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(repo: sl()));
  sl.registerFactory<ProfileCubit>(
      () => ProfileCubit(repo: sl(), supabase: sl()));
  sl.registerFactory<EditProfileCubit>(() => EditProfileCubit(repo: sl()));
}
