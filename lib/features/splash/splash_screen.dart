import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protextile/core/images/app_images.dart';
import 'package:protextile/features/splash/splash_cubit/splash_cubit.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/theme/app_colors.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colore30611Red,
      body: BlocProvider<SplashCubit>(
        create: (context) => sl<SplashCubit>(),
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset(
                    AppImages.appLogo,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
