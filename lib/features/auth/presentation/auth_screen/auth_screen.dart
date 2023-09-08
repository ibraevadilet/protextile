import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';
import 'package:protextile/widgets/custom_text_fields.dart';
import 'package:protextile/widgets/default_button.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Авторизация',
              style: AppTextStyles.s28W900(
                color: AppColors.colore30611Red,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              labelText: 'Логин',
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              labelText: 'Пароль',
            ),
            const SizedBox(height: 20),
            CustomButton(
              isFullFilled: false,
              color: AppColors.colore30611Red,
              textColor: AppColors.colore30611Red,
              onPress: () {
                pushAndPopUntilFunction(const BottomNavigatorRoute());
              },
              text: 'Войти',
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
              onPressed: () {
                pushFunction(const RegisterRoute());
              },
              child: const Text('Регистрация'),
            ),
          ],
        ),
      ),
    );
  }
}
