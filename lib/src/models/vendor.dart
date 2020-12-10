import 'package:farmer_market/src/services/firebase_storage_service.dart';

class Vendor {
  final String vendorId;
  final String name;
  final String imageUrl;
  final String description;

  Vendor({this.vendorId, this.name, this.imageUrl, this.description});

  Map<String, dynamic> toMap() {
    return {
      'vendorId': vendorId,
      'name': name,
      'imageUrl': imageUrl,
      'description': description
    };
  }

  factory Vendor.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore == null) return null;
    return Vendor(
      vendorId: firestore['vendorId'],
      name: firestore['name'],
      imageUrl: firestore['imageUrl'],
      description: firestore['description'],
    );
  }
}
