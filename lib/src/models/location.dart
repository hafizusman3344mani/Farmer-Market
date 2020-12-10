import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Location {
  final String name;
  final String address;
  final String city;
  final String state;
  final GeoPoint geo;
  final String placeId;

  Location({
    @required this.name,
    @required this.address,
    @required this.city,
    @required this.state,
    this.geo,
    this.placeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'geo': geo,
      'placeId': placeId,
    };
  }

  Location.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        address = firestore['address'],
        city = firestore['city'],
        state = firestore['state'],
        geo = firestore['geo'] ?? null,
        placeId = firestore['placeId'] ?? null;
}
