import 'package:farmer_market/src/blocs/auth_bloc.dart';
import 'package:farmer_market/src/blocs/customer_bloc.dart';
import 'package:farmer_market/src/blocs/product_bloc.dart';
import 'package:farmer_market/src/blocs/vendor_bloc.dart';
import 'package:farmer_market/src/routes.dart';
import 'package:farmer_market/src/screens/landing.dart';
import 'package:farmer_market/src/screens/login.dart';
import 'package:farmer_market/src/services/firestore_service.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AuthBloc authBloc = AuthBloc();
final productBloc = ProductBloc();
final customerBloc = CustomerBloc();
final vendorBloc = VendorBloc();
FireStoreService fireStoreService = FireStoreService();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => authBloc),
      Provider(
        create: (context) => productBloc,
      ),
      Provider(
        create: (context) => customerBloc,
      ),
      Provider(
        create: (context) => vendorBloc,
      ),
      StreamProvider(
        create: (context) => fireStoreService.fetchUnitTypes(),
      ),
      FutureProvider(
        create: (context) => authBloc.isLoggedIn(),
      )
    ], child: PlatFormApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
    productBloc.dispose();
    customerBloc.dispose();
    vendorBloc.dispose();
    super.dispose();
  }
}

class PlatFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider.of<bool>(context);
    if (Platform.isIOS) {
      return CupertinoApp(
        home: (isLoggedIn == null)
            ? loadingScreen(true) 
            : (isLoggedIn == true) ? Landing() : Login(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                CupertinoTextThemeData(tabLabelTextStyle: TextStyles.body)),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (isLoggedIn == null)
            ? loadingScreen(false)
            : (isLoggedIn == true) ? Landing() : Login(),
        onGenerateRoute: Routes.materialRoutes,
        theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme()),
      );
    }
  }

  Widget loadingScreen(bool isIOS) {
    return (isIOS)
        ? CupertinoPageScaffold(
            child: Center(child: CupertinoActivityIndicator()))
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
