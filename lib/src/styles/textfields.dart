import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class TextFieldStyles {
  static double get textBoxHorizontal => BaseStyles.listFieldHorizontal;

  static double get textBoxVertical => BaseStyles.listFieldVertical;

  static TextStyle get text => TextStyles.body;

  static TextStyle get placeholder => TextStyles.suggestion;

  static Color get cursorColor => AppColors.darkBlue;

  static Widget iconPrefix(IconData icon) => BaseStyles.iconPrefix(icon);
  static TextAlign get textAlign => TextAlign.left;

  static BoxDecoration get cupertinoDecoration => BoxDecoration(
      border: Border.all(
        color: AppColors.straw,
        width: BaseStyles.borderWidth,
      ),
      borderRadius: BorderRadius.circular(BaseStyles.borderRadius));

  static BoxDecoration get cupertinoErrorDecoration => BoxDecoration(
      border: Border.all(
        color: AppColors.red,
        width: BaseStyles.borderWidth,
      ),
      borderRadius: BorderRadius.circular(BaseStyles.borderRadius));


  static InputDecoration materialDecoration(String hintText, IconData icon,String errorText) =>
      InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: hintText,
          hintStyle: TextFieldStyles.placeholder,
          errorText: errorText,
          errorStyle: TextStyles.error,
          border: InputBorder.none,
          errorBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.red,
              width: BaseStyles.borderWidth,
            ),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
        focusedErrorBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.straw,
            width: BaseStyles.borderWidth,
          ),
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
        ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.straw,
              width: BaseStyles.borderWidth,
            ),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.straw,
              width: BaseStyles.borderWidth,
            ),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          prefixIcon: iconPrefix(icon),
      );
}
