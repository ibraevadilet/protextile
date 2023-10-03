import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protextile/core/constants/shared_keys.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.supabsae}) : super(const SplashState.initial()) {
    getAuth();
  }

  final SupabaseClient supabsae;

  Future<void> getAuth() async {
     final session = supabsae.auth.currentSession;
    await Future.delayed(const Duration(seconds: 2));

    if (session == null) {
      AppRoutes.pushAndPopUntilFunction(const AuthRoute());
    } else {
      AppRoutes.pushAndPopUntilFunction(const BottomNavigatorRoute());
    }
  }
}
