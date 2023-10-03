import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protextile/core/formatters/validators.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/features/auth/presentation/auth_screen/cubits/auth_cubit/auth_cubit.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/widgets/app_unfocuser.dart';
import 'package:protextile/widgets/custom_app_bar.dart';
import 'package:protextile/widgets/custom_text_fields.dart';
import 'package:protextile/widgets/custom_button.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Авторизация'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Builder(
              builder: (context) => Form(
                key: context.read<AuthCubit>().formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      labelText: 'Email',
                      controller: context.read<AuthCubit>().loginController,
                      validator: InputValidators.emptyValidator,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Пароль',
                      controller: context.read<AuthCubit>().passwordController,
                      validator: InputValidators.emptyValidator,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                          isLoading: state.isLoading,
                          isFullFilled: false,
                          color: AppColors.colore30611Red,
                          textColor: AppColors.colore30611Red,
                          onPress: () => context.read<AuthCubit>().auth(),
                          text: 'Войти',
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        // Действие по восстановлению пароля
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      child: const Text('Забыли пароль?'),
                    ),
                    const SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () =>
                          AppRoutes.pushFunction(const RegisterRoute()),
                      child: const Text('Регистрация'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
