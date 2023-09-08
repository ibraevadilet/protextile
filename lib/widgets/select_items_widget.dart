import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';

class SelectItemsWidget extends StatelessWidget {
  const SelectItemsWidget({
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
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(19),
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
                style: AppTextStyles.s17W600(),
              ),
            ),
            Visibility(
              visible: selected,
              child: const Icon(
                Icons.check,
                size: 24,
                color: AppColors.color4CAF50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
