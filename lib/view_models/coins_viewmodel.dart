import 'package:block_folio/models/coin.dart';
import 'package:block_folio/services/coin_gecko.dart';
import 'package:flutter/material.dart';

class CoinsViewModel with ChangeNotifier {
  CoinGecko _coinGecko = CoinGecko();
  bool isLoading = false;
  List<Coin> coins = [];
  CoinsViewModel() {
    initialize();
  }

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();
    coins = await _coinGecko.getCoins();
    isLoading = false;
    notifyListeners();
  }
}
