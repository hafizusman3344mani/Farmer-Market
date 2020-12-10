import 'package:farmer_market/src/models/product.dart';
import 'package:farmer_market/src/services/firestore_service.dart';
import 'package:farmer_market/src/models/market.dart';

class CustomerBloc {
  final db = FireStoreService();

  // Getting markets from firestore class
  Stream<List<Market>> get fetchUpcomingMarkets => db.upComingMarkets();

  Stream<List<Product>> get fetchAvailableProducts =>
      db.fetchAvailableProducts();

  dispose() {}
}
