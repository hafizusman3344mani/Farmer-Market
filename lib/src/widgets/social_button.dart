import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/buttons.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppSocialButton extends StatelessWidget {
  final SocialType socialType;
  final Function onTap;
  AppSocialButton({@required this.socialType, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color iconColor;
    IconData icon;
    switch (socialType) {
      case SocialType.Facebook:
        iconColor = Colors.white;
        buttonColor = AppColors.facebook;
        icon = FontAwesomeIcons.facebookF;
        break;
      case SocialType.Google:
        iconColor = Colors.white;
        buttonColor = AppColors.google;
        icon = FontAwesomeIcons.google;
        break;

      default:
        iconColor = Colors.white;
        buttonColor = AppColors.facebook;
        icon = FontAwesomeIcons.facebookF;
        break;
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ButtonStyles.buttonHeight,
        width: ButtonStyles.buttonHeight,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(BaseStyles.borderRadiusSocial),
            boxShadow: BaseStyles.boxShadow),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}

enum SocialType { Facebook, Google }
