import 'package:block_folio/models/coin.dart';
import 'package:block_folio/services/coin_gecko.dart';
import 'package:flutter/material.dart';

class CoinsViewModel with ChangeNotifier {
  CoinGecko coinGecko = CoinGecko();
  int pageNumber = 1;
  bool isLoading = false;
  List<Coin> coins = [];
  CoinsViewModel() {
    initialize();
  }

  void incrementPage() async {
    if (pageNumber < 10) {
      pageNumber++;
      isLoading = true;
      notifyListeners();
      coins = await coinGecko.getCoins(pageNo: pageNumber.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();
    coins = await coinGecko.getCoins();
    isLoading = false;
    notifyListeners();
  }
}
