import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:protextile/features/profile/domain/entity/user_entity.dart';
import 'package:protextile/features/profile/domain/repos/get_currant_user_data_repo.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/widgets/styled_toasts.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required this.repo,
    required this.supabase,
  }) : super(const ProfileState.loading()) {
    getProfile();
  }

  final GetCurrantUserDataRepo repo;
  final SupabaseClient supabase;

  Future<void> getProfile() async {
    try {
      emit(
        ProfileState.success(
          await repo.getCurrantUserData(),
        ),
      );
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> signout() async {
    try {
      emit(const ProfileState.loading());
      await supabase.auth.signOut();
      AppRoutes.pushAndPopUntilFunction(const AuthRoute());
      sl<BottomNavigatorCubit>().getCurrentPage(0);
    } catch (e) {
      showErrorSnackBar(e.toString());
    }
  }
}
