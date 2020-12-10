import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/buttons.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AppDropDownButton extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final IconData cupertinoIcon;
  final IconData materialIcon;
  final bool isIos;
  final String value;
  final Function(String) onChanged;
  AppDropDownButton(
      {@required this.items,
      @required this.hintText,
      this.materialIcon,
      this.cupertinoIcon,
      this.isIos,
      this.value,
      this.onChanged});
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
              border: Border.all(
                  color: AppColors.straw, width: BaseStyles.borderWidth)),
          child: Row(
            children: [
              BaseStyles.iconPrefix(
                isIos ? cupertinoIcon : materialIcon,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    child: (value == null)
                        ? Text(
                            hintText,
                            style: TextStyles.suggestion,
                          )
                        : Text(
                            value,
                            style: TextStyles.body,
                          ),
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return _selectIos(context, items, value);
                          });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
              border: Border.all(
                  color: AppColors.straw, width: BaseStyles.borderWidth)),
          child: Row(
            children: [
              BaseStyles.iconPrefix(
                isIos ? cupertinoIcon : materialIcon,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 25),
                  child: DropdownButton(
                    items: buildMaterialItems(items),
                    value: value,
                    hint: Text(
                      hintText,
                      style: TextStyles.suggestion,
                    ),
                    style: TextStyles.body,
                    underline: Container(),
                    iconEnabledColor: AppColors.straw,
                    onChanged: (value) => onChanged(value),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items) {
    return (items != null) ? items
        .map((item) => DropdownMenuItem<String>(
              child: Text(
                item,
                textAlign: TextAlign.center,
              ),
              value: item,
            ))
        .toList():[];
  }

  List<Widget> buildCupertinoItems(List<String> items) {
    return  items
        .map(
          (item) => Text(
            item,
            textAlign: TextAlign.center,
            style: TextStyles.body,
          ),
        )
        .toList();
  }

  _selectIos(BuildContext context, List<String> items, String value) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
          color: Colors.white,
          height: 200,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
                initialItem: items.indexWhere((item) => item == value)),
            itemExtent: 45.0,
            children: buildCupertinoItems(items),
            diameterRatio: 1.0,
            onSelectedItemChanged: (int index) => onChanged(items[index]),
          )),
    );
  }
}
