import 'package:farmer_market/src/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppSliverScaffold {
  static CupertinoPageScaffold cupertinoSliverScaffold(
      {String navTitle, Widget pageBody,BuildContext context}) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return <Widget>[
            AppNavBar.cupertinoNavBar(title: navTitle,context: context)
          ];
        },
        body: pageBody,
      ),
    );
  }

  static Scaffold materialSliverScaffold({String navTitle, Widget pageBody,BuildContext context}) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxScrolled) {
          return <Widget>[AppNavBar.materialNavBar(title: navTitle,pinned: false)];
        },
        body: pageBody,
      ),
    );
  }
}
