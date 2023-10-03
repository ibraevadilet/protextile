import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protextile/features/profile/presentation/profile_main_screen/profile_cubit/profile_cubit.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/widgets/custom_button.dart';
import 'package:protextile/widgets/spaces.dart';

Future<void> exitDialog(BuildContext mainContext) async {
  await showDialog(
    context: mainContext,
    builder: (context) => SizedBox(
      width: context.width,
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        title: const Text(
          'Вы действительно хотите выйти?',
          textAlign: TextAlign.center,
        ),
        content: Row(
          children: [
            Expanded(
              child: CustomButton(
                color: AppColors.color65C130,
                onPress: () {
                  Navigator.pop(context);
                },
                text: 'Нет',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                color: AppColors.colore30611Red,
                onPress: () {
                  mainContext.read<ProfileCubit>().signout();
                  Navigator.pop(context);
                },
                text: 'Да',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
