import 'dart:async';
import 'dart:io';

import 'package:farmer_market/src/blocs/auth_bloc.dart';
import 'package:farmer_market/src/blocs/vendor_bloc.dart';
import 'package:farmer_market/src/models/vendor.dart';
import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:farmer_market/src/widgets/button.dart';
import 'package:farmer_market/src/widgets/dropdown_button.dart';
import 'package:farmer_market/src/widgets/sliver_scaffold.dart';
import 'package:farmer_market/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditVendor extends StatefulWidget {
  final String vendorId;

  EditVendor({this.vendorId});

  @override
  _EditVendorState createState() => _EditVendorState();
}

class _EditVendorState extends State<EditVendor> {
  StreamSubscription _savedSubscription;

  @override
  void initState() {
    var vendorBloc = Provider.of<VendorBloc>(context, listen: false);
    _savedSubscription = vendorBloc.vendorSaved.listen((saved) {
      if (saved != null && saved == true && context != null) {
        Fluttertoast.showToast(
            msg: "Vendor saved",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: AppColors.lightBlue,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pop();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _savedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var vendorBloc = Provider.of<VendorBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    return StreamBuilder<Vendor>(
      stream: vendorBloc.vendor,
      builder: (context, snapshot) {
        if (!snapshot.hasData && widget.vendorId != null) {
          return Scaffold(
            body: Center(
                child: (Platform.isIOS)
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator()),
          );
        }

        Vendor vendor = snapshot.data;
        if (vendor != null) {
          //Edit logic here
          loadValues(vendorBloc, vendor, authBloc.userId);
        } else {
          //Add logic here
          loadValues(vendorBloc, null, authBloc.userId);
        }
        return (Platform.isIOS)
            ? AppSliverScaffold.cupertinoSliverScaffold(
                navTitle: '',
                pageBody: pageBody(true, vendorBloc, context, vendor),
                context: context)
            : AppSliverScaffold.materialSliverScaffold(
                navTitle: '',
                pageBody: pageBody(false, vendorBloc, context, vendor),
                context: context);
      },
    );
  }

  Widget pageBody(bool isIos, VendorBloc vendorBloc, BuildContext context,
      Vendor existingVendor) {
    var pageLabel = (existingVendor == null) ? 'Add Profile' : 'Edit Profile';
    return ListView(
      children: [
        Text(
          pageLabel,
          style: TextStyles.subTitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Divider(
            color: AppColors.darkBlue,
          ),
        ),
        StreamBuilder<String>(
            stream: vendorBloc.name,
            builder: (context, snapshot) {
              return AppTextField(
                hintText: 'Vendor Name',
                cupertinoIcon: FontAwesomeIcons.sign,
                materialIcon: FontAwesomeIcons.sign,
                isIOS: isIos,
                errorText: snapshot.error,
                initialText:
                    (existingVendor != null) ? existingVendor.name : null,
                onChanged: vendorBloc.changeName,
              );
            }),
        StreamBuilder<String>(
            stream: vendorBloc.description,
            builder: (context, snapshot) {
              return AppTextField(
                hintText: 'Description',
                cupertinoIcon: FontAwesomeIcons.book,
                materialIcon: FontAwesomeIcons.book,
                isIOS: isIos,
                maxLines: 7,
                errorText: snapshot.error,
                initialText: (existingVendor != null)
                    ? existingVendor.description
                    : null,
                onChanged: vendorBloc.changeDescription,
              );
            }),
        Divider(
          height: 15,
        ),
        StreamBuilder<bool>(
          stream: vendorBloc.isUploading,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == false) return Container();
            return Center(
              child: (Platform.isIOS)
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(),
            );
          },
        ),
        StreamBuilder<String>(
            stream: vendorBloc.imageUrl,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == "")
                return AppButton(
                  buttonType: ButtonType.Straw,
                  title: "Add Image",
                  onPressed: vendorBloc.pickImage,
                );
              return Column(
                children: [
                  Padding(
                    padding: BaseStyles.listPadding,
                    child: Image.network(snapshot.data),
                  ),
                  AppButton(
                    buttonType: ButtonType.Straw,
                    title: "Change Image",
                    onPressed: vendorBloc.pickImage,
                  ),
                ],
              );
            }),
        StreamBuilder<bool>(
            stream: vendorBloc.isValid,
            builder: (context, snapshot) {
              return AppButton(
                buttonType: (snapshot.data != true)
                    ? ButtonType.DarkBlue
                    : ButtonType.Disabled,
                title: 'Save Profile',
                onPressed: vendorBloc.saveVendor,
              );
            })
      ],
    );
  }

  loadValues(VendorBloc vendorBloc, Vendor vendor, String vendorId) {
    vendorBloc.changeVendorId(vendorId);
    if (vendor != null) {
      //Edit product
      vendorBloc.changeName(vendor.name);
      vendorBloc.changeDescription(vendor.description);
      vendorBloc.changeImageUrl(vendor.imageUrl ?? '');
    } else {
      //Add product
      vendorBloc.changeName(null);
      vendorBloc.changeDescription(null);
      vendorBloc.changeImageUrl('');
    }
  }
}
