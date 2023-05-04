import 'package:block_folio/models/coin.dart';
import 'package:block_folio/models/coin_detail.dart';
import 'package:block_folio/models/graph_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinGecko {
  String baseURL = "https://api.coingecko.com/api/v3/";

  Future<List<Coin>> getCoins(
      {String currency = 'usd', String pageNo = '1'}) async {
    String finalURL = baseURL + "coins/markets";
    Map<String, String> queryArguments = {
      "vs_currency": currency,
      "per_page": "20",
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

  Future<CoinDetail> getCoinDetail(String id) async {
    String finalURL = baseURL + "coins/" + id;
    Map<String, String> queryArguments = {
      "localization": "false",
      "tickers": "false",
      "market_data": "true",
      "community_data": "false",
      "developer_data": "false",
      "sparkline": "false",
    };
    Uri uri = Uri.parse(finalURL).replace(queryParameters: queryArguments);
    final resopnse = await http.get(uri);
    var responseData = json.decode(resopnse.body);
    CoinDetail coin = CoinDetail.fromJson(responseData);
    return coin;
  }

  Future<GraphData> getCoinGraphData(String id, String days) async {
    String finalURL = baseURL + "coins/" + id + "/market_chart";
    Map<String, String> queryArguments = {
      "vs_currency": "usd",
      "days": days,
    };
    Uri uri = Uri.parse(finalURL).replace(queryParameters: queryArguments);
    final response = await http.get(uri);
    var responseData = json.decode(response.body);
    GraphData graphData = GraphData.fromJson(responseData);
    return graphData;
  }
}
