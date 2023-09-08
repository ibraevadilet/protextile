import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protextile/core/formatters/input_borders.dart';
import 'package:protextile/theme/app_colors.dart';
import 'package:protextile/theme/app_text_styles.dart';

class TextFildWithClean extends StatefulWidget {
  const TextFildWithClean({
    required this.controller,
    required this.labelText,
    this.validator,
    this.prefixText,
    this.inputFormatters,
    this.keyboardType,
    this.autofocus = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool autofocus;

  @override
  State<TextFildWithClean> createState() => _TextFildWithCleanState();
}

class _TextFildWithCleanState extends State<TextFildWithClean> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      cursorColor: AppColors.color4CAF50,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      style: AppTextStyles.s16W400(),
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixText: widget.prefixText,
        prefixStyle: AppTextStyles.s16W400(),
        suffix: InkWell(
          onTap: () => setState(() {
            widget.controller.clear();
          }),
          child: const Icon(
            Icons.close,
            color: AppColors.color4CAF50,
          ),
        ),
        border: InputBorders.outlineBorderColorE5E5E5Width1Radius10,
        enabledBorder: InputBorders.outlineBorderColorE5E5E5Width1Radius10,
        focusedBorder: InputBorders.outlineBorderColorGreenWidth2Radius10,
        errorBorder: InputBorders.outlineBordercolorF68080Width2Radius10,
      ),
    );
  }
}
