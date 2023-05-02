import 'package:block_folio/models/coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinGecko {
  String baseURL = "https://api.coingecko.com/api/v3/";

  Future<List<Coin>> getCoins(
      {String currency = 'usd', String pageNo = '1'}) async {
    String finalURL = baseURL + "coins/markets";
    Map<String, String> queryArguments = {
      "vs_currency": currency,
      "per_page": "100",
      "page": pageNo,
      "sparkline": "true",
    };
    Uri uri = Uri.parse(finalURL).replace(queryParameters: queryArguments);
    final response = await http.get(uri);
    var responseData = json.decode(response.body);
    List<Coin> coins = [];
    for (var coin in responseData) {
      coins.add(Coin.fromJson(coin));
    }
    return coins;
  }
}
