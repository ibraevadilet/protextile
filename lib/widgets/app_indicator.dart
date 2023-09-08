import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    Key? key,
    this.color = AppColors.color4CAF50,
    this.strokeWidth = 2.5,
    this.radius = 24,
  }) : super(key: key);
  final Color? color;
  final double strokeWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: radius,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
