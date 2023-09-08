import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';

class FilterSelectWidget extends StatelessWidget {
  const FilterSelectWidget({
    required this.title,
    required this.onPressed,
    this.selected = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white,
          border: Border.all(
            width: 1,
            color: selected ? AppColors.color4CAF50 : AppColors.colorEFEFEF,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.s16W500(),
              ),
            ),
            Icon(
              selected ? Icons.check : Icons.navigate_next,
              size: 24,
              color: selected ? AppColors.color4CAF50 : AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
