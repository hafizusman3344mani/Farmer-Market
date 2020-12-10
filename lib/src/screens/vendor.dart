import 'dart:async';

import 'package:farmer_market/src/blocs/auth_bloc.dart';
import 'package:farmer_market/src/blocs/vendor_bloc.dart';
import 'package:farmer_market/src/widgets/navbar.dart';
import 'package:farmer_market/src/widgets/orders.dart';
import 'package:farmer_market/src/widgets/products.dart';
import 'package:farmer_market/src/widgets/profile.dart';
import 'package:farmer_market/src/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Vendor extends StatefulWidget {

  @override
  _VendorState createState() => _VendorState();
}

class _VendorState extends State<Vendor> {
  StreamSubscription _userSubscription;
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      final authBloc = Provider.of<AuthBloc>(context,listen: false);
      final vendorBloc = Provider.of<VendorBloc>(context,listen: false);
      vendorBloc.fetchVendor(authBloc.userId).then((vendor) => vendorBloc.changeVendor(vendor));
     _userSubscription =  authBloc.user.listen((user) {
        if(user == null){
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      });

    });
        super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                AppNavBar.cupertinoNavBar(
                    title: 'Vendor Name',context: context)
              ];
            },
            body: VendorScaffold.cupertinoScaffold),
      );
    } else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[
                AppNavBar.materialNavBar(
                    title: 'Vendor Name', tabBar: VendorScaffold.materialTabBar)
              ];
            },
            body: TabBarView(
              children: <Widget>[Products(), Orders(), Profile()],
            ),
          ),
        ),
      );
    }
  }
}
