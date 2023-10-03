import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protextile/core/formatters/input_borders.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isOutline = true,
    this.maxLines = 1,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isOutline;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        border: isOutline
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.unOutlineBorderColorE5E5E5Width1,
        enabledBorder: isOutline == true
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.outlineBorderColorE5E5E5Width1Radius10,
        focusedBorder: isOutline == true
            ? InputBorders.outlineBorderColorGreenWidth2Radius10
            : InputBorders.unOutlineBorderColorGreenWidth2,
        focusedErrorBorder: isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
        errorBorder: isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
      ),
    );
  }
}
