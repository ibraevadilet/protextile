import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/features/auth/domain/repo/auth_repo.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/widgets/styled_toasts.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repo}) : super(const AuthState.initial());
  final AuthRepo repo;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> auth() async {
    if (formKey.currentState!.validate()) {
      emit(const AuthState.loading());
      try {
        await repo.getAuth(
          login: loginController.text,
          password: passwordController.text,
        );
        AppRoutes.pushAndPopUntilFunction(const BottomNavigatorRoute());
      } catch (e) {
        showErrorSnackBar(e.toString());
        emit(AuthState.error(e.toString()));
      }
    }
  }
}
