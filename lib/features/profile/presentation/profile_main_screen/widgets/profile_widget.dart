import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';
import 'package:protextile/widgets/spaces.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          child: Container(
            width: context.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.colore30611Red,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: AppTextStyles.s16W400(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
