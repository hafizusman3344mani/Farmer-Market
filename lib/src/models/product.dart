import 'package:flutter/cupertino.dart';

class Product {
  final String productName;
  final String unitType;
  final double unitPrice;
  final int availableUnits;
  final bool approved;
  final String imageUrl;
  final String note;
  final String productId;
  final String vendorId;

  Product(
      {@required this.productName,
      @required this.unitType,
      @required this.unitPrice,
      @required this.availableUnits,
      @required this.approved,
      this.imageUrl = '',
      this.note = '',
      @required this.productId,
      @required this.vendorId});

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productId': productId,
      'unitType': unitType,
      'unitPrice': unitPrice,
      'availableUnits': availableUnits,
      'approved': approved,
      'imageUrl': imageUrl,
      'note': note,
      'vendorId': vendorId
    };
  }

  Product.fromFirestore (Map<String,dynamic> firestore)
    :productName = firestore['productName'],
        productId = firestore['productId'],
        unitType = firestore['unitType'],
        unitPrice = firestore['unitPrice'],
        availableUnits = firestore['availableUnits'],
        approved = firestore['approved'],
        imageUrl = firestore['imageUrl'],
        note = firestore['note'],
        vendorId = firestore['vendorId'];

}
