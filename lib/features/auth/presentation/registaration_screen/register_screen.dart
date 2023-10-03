import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protextile/core/formatters/validators.dart';
import 'package:protextile/features/auth/presentation/registaration_screen/cubits/register_cubit/register_cubit.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/widgets/app_unfocuser.dart';
import 'package:protextile/widgets/custom_app_bar.dart';
import 'package:protextile/widgets/custom_text_fields.dart';
import 'package:protextile/widgets/custom_button.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: BlocProvider(
        create: (context) => sl<RegisterCubit>(),
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Регистрация'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Builder(
              builder: (context) => Form(
                key: context.read<RegisterCubit>().formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      labelText: 'Имя',
                      controller: context.read<RegisterCubit>().nameController,
                      validator: InputValidators.emptyValidator,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Email',
                      controller: context.read<RegisterCubit>().loginController,
                      validator: InputValidators.emptyValidator,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      obscureText: true,
                      labelText: 'Пароль',
                      controller:
                          context.read<RegisterCubit>().passwordController,
                      validator: InputValidators.emptyValidator,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      obscureText: true,
                      labelText: 'Повторить пароль',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Поле обязательно для заполнения';
                        } else if (context
                                .read<RegisterCubit>()
                                .passwordController
                                .text !=
                            value) {
                          return 'Проли не совпадают';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return CustomButton(
                          isLoading: state.isLoading,
                          isFullFilled: false,
                          color: AppColors.colore30611Red,
                          textColor: AppColors.colore30611Red,
                          onPress: () => context.read<RegisterCubit>().auth(),
                          text: 'Зарегистрироваться',
                        );
                      },
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
