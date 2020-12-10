import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/buttons.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final ButtonType buttonType;
  final void Function() onPressed;
  AppButton({@required this.title, this.onPressed, this.buttonType});

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle;
    Color buttonColor;
    switch (widget.buttonType) {
      case ButtonType.Straw:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.straw;
        break;
      case ButtonType.LightBlue:
        fontStyle = TextStyles.buttonTextDark;
        buttonColor = AppColors.lightBlue;
        break;
      case ButtonType.DarkBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkBlue;
        break;
      case ButtonType.Disabled:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightGrey;
        break;
      case ButtonType.DarkGrey:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkGrey;
        break;

      default:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightBlue;
        break;
    }
    return AnimatedContainer(
      padding: EdgeInsets.only(
          top: (pressed)
              ? BaseStyles.listFieldVertical + BaseStyles.animationOffset
              : BaseStyles.listFieldVertical,
          bottom: (pressed)
              ? BaseStyles.listFieldVertical - BaseStyles.animationOffset
              : BaseStyles.listFieldVertical,
          left: BaseStyles.listFieldHorizontal,
          right: BaseStyles.listFieldHorizontal),
      child: GestureDetector(
        onTap: () {
          //Login logic
          if (widget.buttonType != ButtonType.Disabled) {
            widget.onPressed();
          }
        },
        onTapDown: (details) {
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTapUp: (details) {
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
              boxShadow: (pressed)
                  ? BaseStyles.boxShadowPressed
                  : BaseStyles.boxShadow),
          child: Center(child: Text(widget.title, style: fontStyle)),
        ),
      ),
      duration: Duration(milliseconds: 20),
    );
  }
}

enum ButtonType { LightBlue, Straw, DarkGrey, Disabled, DarkBlue }
