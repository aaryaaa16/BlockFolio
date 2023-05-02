import 'package:block_folio/services/coin_gecko.dart';
import 'package:flutter/material.dart';

class CoinsViewModel with ChangeNotifier {
  CoinGecko _coinGecko = CoinGecko();

  CoinsViewModel() {
    print("Initialized COinsViewModel");
    _coinGecko.getCoins();
  }
}
