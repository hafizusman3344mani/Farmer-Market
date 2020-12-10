import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final String productName;
  final String unitType;
  final double price;
  final int availableUnits;
  final String imageUrl;
  final String note;

  final formatCurrency = NumberFormat.simpleCurrency();

  AppCard(
      {Key key,
      @required this.productName,
      @required this.unitType,
      @required this.price,
      @required this.availableUnits,
        this.imageUrl,
      this.note = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseStyles.listPadding,
      padding: BaseStyles.listPadding,
      decoration: BoxDecoration(
          boxShadow: BaseStyles.boxShadow,
          color: Colors.white,
          border: Border.all(
              width: BaseStyles.borderWidth, color: AppColors.darkBlue),
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, bottom: 10, top: 10),
                child:(imageUrl==''|| imageUrl==null) ?Image.asset(
                  'assets/images/vegetables.png',
                  width: 100,
                  height: 100,
                ):
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                  ),
                )
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  productName,
                  style: TextStyles.subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  '${formatCurrency.format(price)}/$unitType',
                  style: TextStyles.body,
                ),
                (availableUnits > 0)
                    ? Text(
                        'In Stock',
                        style: TextStyles.bodyLightBlue,
                      )
                    : Text(
                        'Currently Unavailable',
                        style: TextStyles.bodyRed,
                        softWrap: true,
                      ),
              ])
            ],
          ),
          Text(
            'This is note for Product.',
            style: TextStyles.body,
          )
        ],
      ),
    );
  }
}
