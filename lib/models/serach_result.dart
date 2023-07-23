import 'dart:convert';

class SearchResult {
    List<CoinSearchResult>? coins;

    SearchResult({
        this.coins,
    });

    factory SearchResult.fromRawJson(String str) => SearchResult.fromJson(json.decode(str));

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        coins: json["coins"] == null ? [] : List<CoinSearchResult>.from(json["coins"]!.map((x) => CoinSearchResult.fromJson(x))),
    );
}

class CoinSearchResult {
    String? id;
    String? name;
    String? apiSymbol;
    String? symbol;
    int? marketCapRank;
    String? thumb;
    String? large;

    CoinSearchResult({
        this.id,
        this.name,
        this.apiSymbol,
        this.symbol,
        this.marketCapRank,
        this.thumb,
        this.large,
    });

    factory CoinSearchResult.fromRawJson(String str) => CoinSearchResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CoinSearchResult.fromJson(Map<String, dynamic> json) => CoinSearchResult(
        id: json["id"],
        name: json["name"],
        apiSymbol: json["api_symbol"],
        symbol: json["symbol"],
        marketCapRank: json["market_cap_rank"],
        thumb: json["thumb"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "api_symbol": apiSymbol,
        "symbol": symbol,
        "market_cap_rank": marketCapRank,
        "thumb": thumb,
        "large": large,
    };
}
