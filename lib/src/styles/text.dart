import 'package:farmer_market/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get title => GoogleFonts.poppins(
      textStyle: TextStyle(
          color: AppColors.straw,
          fontWeight: FontWeight.bold,
          fontSize: 40.0));

  static TextStyle get subTitle =>
   GoogleFonts.economica(
    textStyle: TextStyle(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.bold,
      fontSize: 30

    )
  );

  static TextStyle get listTitle =>
      GoogleFonts.economica(
          textStyle: TextStyle(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.bold,
              fontSize: 25

          )
      );

  static TextStyle get navTitle => GoogleFonts.poppins(
      textStyle:
          TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold));

  static TextStyle get navTitleMaterial => GoogleFonts.poppins(
      textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));

  static TextStyle get body => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.darkGrey, fontSize: 16.0));
  static TextStyle get bodyLightBlue => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.lightBlue, fontSize: 16.0));
  static TextStyle get bodyRed => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.red, fontSize: 16.0));

  static TextStyle get link => GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.straw, fontSize: 16.0, fontWeight: FontWeight.bold));

  static TextStyle get suggestion => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.lightGrey, fontSize: 14.0));

  static TextStyle get error => GoogleFonts.roboto(
      textStyle: TextStyle(color: AppColors.red, fontSize: 10.0));

  static TextStyle get buttonTextLight {
    return GoogleFonts.roboto(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle get buttonTextDark {
    return GoogleFonts.roboto(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  }
}
