import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:protextile/theme/app_text_styles.dart';
import 'package:protextile/widgets/spaces.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/translations/locale_keys.g.dart';
import 'package:protextile/widgets/custom_button.dart';

class AppErrorText extends StatelessWidget {
  const AppErrorText({
    required this.error,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final String error;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              error,
              style: AppTextStyles.s16W400(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            onPress != null
                ? CustomButton(
                    width: null,
                    text: LocaleKeys.retry.tr(),
                    color: AppColors.color65C130,
                    onPress: onPress!,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
