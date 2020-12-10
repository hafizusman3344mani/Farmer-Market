import 'package:farmer_market/src/styles/text.dart';
import 'package:farmer_market/src/styles/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscure;
  final Function(String) onChanged;
  final String errorText;
  final String initialText;
  final int maxLines;
  AppTextField(
      {@required this.isIOS,
      @required this.hintText,
      @required this.materialIcon,
      @required this.cupertinoIcon,
      this.textInputType,
      this.obscure,
      this.onChanged,
      this.errorText,
      this.initialText,
      this.maxLines = 1,
      });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode _node;
  bool displayCupertinoErrorBorder;
  TextEditingController _controller;
  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    _controller = TextEditingController();

    if (widget.initialText != null) _controller.text = widget.initialText;

    displayCupertinoErrorBorder = false;
    super.initState();
  }

  void _handleFocusChange() {
    if (_node.hasFocus && widget.errorText != null) {
      displayCupertinoErrorBorder = true;
    } else {
      displayCupertinoErrorBorder = false;
    }
    widget.onChanged(_controller.text);
  }

  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: TextFieldStyles.textBoxVertical,
            horizontal: TextFieldStyles.textBoxHorizontal),
        child: Column(
          children: <Widget>[
            CupertinoTextField(
              obscureText: widget.obscure != null ? widget.obscure : false,
              keyboardType: widget.textInputType != null
                  ? widget.textInputType
                  : TextInputType.text,
              padding: EdgeInsets.all(12),
              placeholder: widget.hintText,
              placeholderStyle: TextFieldStyles.placeholder,
              style: TextFieldStyles.text,
              cursorColor: TextFieldStyles.cursorColor,
              textAlign: TextFieldStyles.textAlign,
              maxLines: widget.maxLines,
              decoration: (displayCupertinoErrorBorder)
                  ? TextFieldStyles.cupertinoErrorDecoration
                  : TextFieldStyles.cupertinoDecoration,
              prefix: TextFieldStyles.iconPrefix(widget.cupertinoIcon),
              onChanged: widget.onChanged,
              controller: _controller,
            ),
            (widget.errorText != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.errorText,
                          style: TextStyles.error,
                        )
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: TextFieldStyles.textBoxVertical,
            horizontal: TextFieldStyles.textBoxHorizontal),
        child: TextFormField(
          controller: _controller,
          obscureText: widget.obscure != null ? widget.obscure : false,
          keyboardType: widget.textInputType != null
              ? widget.textInputType
              : TextInputType.text,
          maxLines: widget.maxLines,
          cursorColor: TextFieldStyles.cursorColor,
          style: TextFieldStyles.text,
          textAlign: TextFieldStyles.textAlign,
          decoration: TextFieldStyles.materialDecoration(
              widget.hintText, widget.materialIcon, widget.errorText),
          onChanged: widget.onChanged,
        ),
      );
    }
  }
}
