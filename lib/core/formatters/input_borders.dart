import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';

class InputBorders {
  static const OutlineInputBorder outlineBorderColorE5E5E5Width1Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorE5E5E5,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const OutlineInputBorder outlineBorderColorGreenWidth2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const OutlineInputBorder outlineBordercolorF68080Width2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorF68080,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );

  static const UnderlineInputBorder unOutlineBorderColorE5E5E5Width1 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorE5E5E5,
      width: 1,
    ),
  );
  static const UnderlineInputBorder unOutlineBorderColorGreenWidth2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
  );
  static const UnderlineInputBorder unOutlineBordercolorF68080Width2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorF68080,
      width: 2,
    ),
  );
}
