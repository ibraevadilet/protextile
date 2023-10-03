import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/features/auth/domain/repo/auth_repo.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/widgets/styled_toasts.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.repo}) : super(const RegisterState.initial());

  final AuthRepo repo;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> auth() async {
    if (formKey.currentState!.validate()) {
      emit(const RegisterState.loading());
      try {
        await repo.register(
          login: loginController.text,
          password: passwordController.text,
          name: nameController.text,
        );
        AppRoutes.pushAndPopUntilFunction(const BottomNavigatorRoute());
      } catch (e) {
        showErrorSnackBar(e.toString());
        emit(RegisterState.error(e.toString()));
      }
    }
  }
}
