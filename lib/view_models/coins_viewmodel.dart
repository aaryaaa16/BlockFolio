import 'package:block_folio/models/coin.dart';
import 'package:block_folio/models/coin_detail.dart';
import 'package:block_folio/models/graph_data.dart';
import 'package:block_folio/services/coin_gecko.dart';
import 'package:flutter/material.dart';

class CoinsViewModel with ChangeNotifier {
  CoinGecko coinGecko = CoinGecko();
  int pageNumber = 1;
  bool isLoading = false;
  List<Coin> coins = [];
  CoinDetail? currentCoin;
  GraphData? graphData;
  String selectedRange = '7';

  void setRange(String? newRange) async {
    selectedRange = newRange ?? '7';
    notifyListeners();
    graphData = await coinGecko.getCoinGraphData(
        currentCoin?.id ?? "bitcoin", selectedRange);
    notifyListeners();
  }

  Future<void> viewDetail(BuildContext context, String coinID) async {
    Navigator.pushNamed(context, '/coinInfo');
    isLoading = true;
    notifyListeners();
    currentCoin = await coinGecko.getCoinDetail(coinID);
    graphData = await coinGecko.getCoinGraphData(coinID, selectedRange);
    isLoading = false;
    notifyListeners();
  }

  CoinsViewModel() {
    initialize();
  }

  void addPage() async {
    if (pageNumber < 10) {
      pageNumber++;
      isLoading = true;
      notifyListeners();
      final newCoins = await coinGecko.getCoins(pageNo: pageNumber.toString());
      print("Called");
      coins.addAll(newCoins);
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
