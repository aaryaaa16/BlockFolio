import 'dart:convert';

class SearchResult {
    List<List<double>>? prices;
    List<List<double>>? marketCaps;
    List<List<double>>? totalVolumes;

    SearchResult({
        this.prices,
        this.marketCaps,
        this.totalVolumes,
    });

    factory SearchResult.fromRawJson(String str) => SearchResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        prices: json["prices"] == null ? [] : List<List<double>>.from(json["prices"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        marketCaps: json["market_caps"] == null ? [] : List<List<double>>.from(json["market_caps"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        totalVolumes: json["total_volumes"] == null ? [] : List<List<double>>.from(json["total_volumes"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
    );

    Map<String, dynamic> toJson() => {
        "prices": prices == null ? [] : List<dynamic>.from(prices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "market_caps": marketCaps == null ? [] : List<dynamic>.from(marketCaps!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "total_volumes": totalVolumes == null ? [] : List<dynamic>.from(totalVolumes!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
