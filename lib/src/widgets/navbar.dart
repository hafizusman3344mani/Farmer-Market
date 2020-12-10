import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavBar {
  static CupertinoSliverNavigationBar cupertinoNavBar({String title,@required BuildContext context}) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(
        title,
        style: TextStyles.navTitle,
      ),
      backgroundColor: Colors.transparent,
      border: null,
      leading: GestureDetector(child:Icon(CupertinoIcons.back,color: Colors.white,),onTap: ()=>Navigator.of(context).pop(),),
    );
  }

  static SliverAppBar materialNavBar(
      {@required String title, TabBar tabBar, bool pinned}) {
    return SliverAppBar(
        floating: true,
        pinned: (pinned == null) ? true : pinned,
        snap: true,
        title: Text(title, style: TextStyles.navTitleMaterial),
        backgroundColor: AppColors.straw,
        bottom: tabBar,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ));
  }
}
