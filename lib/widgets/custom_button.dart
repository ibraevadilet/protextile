import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';
import 'package:protextile/widgets/app_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    required this.color,
    required this.onPress,
    Key? key,
    this.width = double.infinity,
    this.isFullFilled = true,
    this.isLoading = false,
    this.padding = 14.0,
    this.height = 56,
    this.radius = 12.0,
    this.textStyle,
    this.child,
    this.isNotFullColor,
    this.textColor = Colors.white,
    this.indicatorColor = AppColors.colore30611Red,
  }) : super(key: key);

  final double? width;
  final double height;
  final double padding;
  final Color color;
  final Color textColor;
  final Color? isNotFullColor;
  final bool isFullFilled;
  final double radius;
  final bool isLoading;
  final TextStyle? textStyle;
  final String? text;
  final Function() onPress;
  final Widget? child;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isLoading ? null : onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isFullFilled ? color : isNotFullColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: color,
          ),
        ),
        child: isLoading
            ? AppIndicator(color: indicatorColor)
            : child ??
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      AppTextStyles.s17W600(
                        color: textColor,
                      ),
                ),
      ),
    );
  }
}
