import 'package:farmer_market/src/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseStyles {
  static double get borderRadius => 15.0;

  static double get borderRadiusSocial => 25.0;

  static double get borderWidth => 2.0;

  static double get animationOffset => 2.0;

  static double get listFieldHorizontal => 25.0;

  static double get listFieldVertical => 8.0;

  static EdgeInsets get listPadding => EdgeInsets.symmetric(
      vertical: listFieldVertical, horizontal: listFieldHorizontal);

  static List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
          color: AppColors.darkGrey.withOpacity(.5),
          offset: Offset(1.0, 2.0),
          blurRadius: 2.0)
    ];
  }

  static List<BoxShadow> get boxShadowPressed {
    return [
      BoxShadow(
          color: AppColors.darkGrey.withOpacity(.5),
          offset: Offset(1.0, 1.0),
          blurRadius: 1.0)
    ];
  }
  static Widget iconPrefix(IconData icon) => Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Icon(
      icon,
      size: 30,
      color: AppColors.lightBlue,
    ),
  );
}
