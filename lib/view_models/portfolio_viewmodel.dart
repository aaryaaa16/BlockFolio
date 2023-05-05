import 'package:block_folio/models/user_model.dart';
import 'package:block_folio/services/firebase_manager.dart';
import 'package:flutter/material.dart';

class PortfolioViewModel with ChangeNotifier {
  void purchaseCoins(PurchasedCoin coin, String uid) async {
    final ref = FirebaseManager.firestore
        .collection('users')
        .doc(uid)
        .collection('portfolio');

    final doc = await ref.doc(coin.coinId).get();
    print(coin.purchasePrice);
    print(coin.quantity);
    if (doc.exists) {
      final oldCoin = PurchasedCoin.fromFirestore(doc, null);
      double newPrice = (oldCoin.purchasePrice ?? 0.0) +
          (coin.purchasePrice ?? 0.0) * (coin.quantity ?? 0.0);
      double newQuantity = (oldCoin.quantity ?? 0.0) + (coin.quantity ?? 0.0);
      ref.doc(coin.coinId).update({
        'purchasePrice': newPrice,
        'quantity': newQuantity,
      });
    } else {
      final purchasePrice = coin.purchasePrice;
      final quantity = coin.quantity;
      coin.purchasePrice = (purchasePrice ?? 0) * (quantity ?? 0);
      ref.doc(coin.coinId).set(coin.toFirestore());
    }
  }

  Future<List<PurchasedCoin>> getPortfolio(String uid) async {
    final ref = FirebaseManager.firestore
        .collection('users')
        .doc(uid)
        .collection('portfolio');

    final snapshot = await ref.get();
    final coins = snapshot.docs
        .map((doc) => PurchasedCoin.fromFirestore(doc, null))
        .toList();
    for (final coin in coins) {
      print(coin.coinId);
      print(coin.quantity);
    }
    return coins;
  }
}
