import 'package:flutter/material.dart';
import 'package:protextile/core/formatters/input_borders.dart';
import 'package:protextile/theme/app_colors.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    required this.onChanged,
    this.keyboardType,
    Key? key,
  }) : super(key: key);
  final Function(String) onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        keyboardType: keyboardType,
        cursorColor: AppColors.color4CAF50,
        decoration: const InputDecoration(
          hintText: 'Поиск',
          enabledBorder: InputBorders.outlineBorderColorE5E5E5Width1Radius10,
          focusedBorder: InputBorders.outlineBorderColorGreenWidth2Radius10,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
