import 'dart:convert';

class Coin {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  num marketCap;
  num marketCapRank;
  num? fullyDilutedValuation;
  double totalVolume;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? marketCapChange24H;
  double? marketCapChangePercentage24H;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  DateTime athDate;
  double atl;
  double atlChangePercentage;
  DateTime atlDate;
  DateTime lastUpdated;
  Sparkline sparkline;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    this.fullyDilutedValuation,
    required this.totalVolume,
    this.high24H,
    this.low24H,
    required this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.lastUpdated,
    required this.sparkline,
  });

  factory Coin.fromRawJson(String str) => Coin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"]?.toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"]?.toDouble(),
        high24H: json["high_24h"]?.toDouble(),
        low24H: json["low_24h"]?.toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble(),
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble(),
        circulatingSupply: json["circulating_supply"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        maxSupply: json["max_supply"]?.toDouble(),
        ath: json["ath"]?.toDouble(),
        athChangePercentage: json["ath_change_percentage"]?.toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"]?.toDouble(),
        atlChangePercentage: json["atl_change_percentage"]?.toDouble(),
        atlDate: DateTime.parse(json["atl_date"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        sparkline: Sparkline.fromJson(json["sparkline_in_7d"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate.toIso8601String(),
        "last_updated": lastUpdated.toIso8601String(),
        "sparkline_in_7d": sparkline.toJson(),
      };
}

class Sparkline {
  List<double> price;

  Sparkline({
    required this.price,
  });

  factory Sparkline.fromRawJson(String str) =>
      Sparkline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sparkline.fromJson(Map<String, dynamic> json) => Sparkline(
        price: List<double>.from(json["price"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "price": List<dynamic>.from(price.map((x) => x)),
      };
}
