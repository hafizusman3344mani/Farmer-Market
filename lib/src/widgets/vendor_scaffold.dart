import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/tabbar.dart';
import 'package:farmer_market/src/widgets/orders.dart';
import 'package:farmer_market/src/widgets/products.dart';
import 'package:farmer_market/src/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class VendorScaffold {
  static CupertinoTabScaffold get cupertinoScaffold {
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar,
      tabBuilder: (context, index) {
       return _pageSelecion(index);
      },
    );
  }

  static get _cupertinoTabBar {
    return CupertinoTabBar(
      activeColor: Colors.black,
      backgroundColor: AppColors.straw,
      inactiveColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.create), title: Text('Products')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), title: Text('Orders')),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), title: Text('Profile')),
      ],
    );
  }

  static Widget _pageSelecion(int index) {
    if (index == 0) {
      return Products();
    }
    if (index == 1) {
      return Orders();
    } else {
      return Profile();
    }
  }

  static TabBar get materialTabBar{
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor:TabBarStyles.indicatorColor ,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.list),),
        Tab(icon: Icon(Icons.shopping_cart),),
        Tab(icon: Icon(Icons.person),)
      ],
    );
  }
}
