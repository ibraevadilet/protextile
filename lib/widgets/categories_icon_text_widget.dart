import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protextile/core/images/app_images.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';

class CategoriesIconTextWidget extends StatelessWidget {
  const CategoriesIconTextWidget({
    required this.title,
    required this.onPressed,
    this.prfixText,
    this.subTitle,
    this.icon = AppImages.appLogo,
    this.padding = 24,
    this.selected = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? prfixText;
  final String icon;
  final Function() onPressed;
  final double padding;
  final bool selected;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      pressedOpacity: 0.5,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: selected ? AppColors.color65C130 : AppColors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFB9B8B8),
              offset: Offset(0, 2),
              blurRadius: 2,
            )
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.s16W500(
                      color: selected ? AppColors.white : null,
                    ),
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Text(
                      subTitle ?? '',
                      style: AppTextStyles.s14W400(),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: prfixText != null,
              child: Text(
                prfixText ?? '',
                style: AppTextStyles.s16W500(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
