import 'dart:convert';

class CoinDetail {
    String id;
    String symbol;
    String name;
    dynamic assetPlatformId;
    int blockTimeInMinutes;
    String? hashingAlgorithm;
    List<String> categories;
    dynamic publicNotice;
    List<dynamic> additionalNotices;
    Description description;
    Image image;
    String countryOrigin;
    DateTime? genesisDate;
    double sentimentVotesUpPercentage;
    double sentimentVotesDownPercentage;
    int watchlistPortfolioUsers;
    int marketCapRank;
    int coingeckoRank;
    double coingeckoScore;
    double developerScore;
    double communityScore;
    double liquidityScore;
    double publicInterestScore;
    MarketData marketData;
    List<dynamic> statusUpdates;
    DateTime lastUpdated;

    CoinDetail({
        required this.id,
        required this.symbol,
        required this.name,
        this.assetPlatformId,
        required this.blockTimeInMinutes,
        required this.hashingAlgorithm,
        required this.categories,
        this.publicNotice,
        required this.additionalNotices,
        required this.description,
        required this.image,
        required this.countryOrigin,
        required this.genesisDate,
        required this.sentimentVotesUpPercentage,
        required this.sentimentVotesDownPercentage,
        required this.watchlistPortfolioUsers,
        required this.marketCapRank,
        required this.coingeckoRank,
        required this.coingeckoScore,
        required this.developerScore,
        required this.communityScore,
        required this.liquidityScore,
        required this.publicInterestScore,
        required this.marketData,
        required this.statusUpdates,
        required this.lastUpdated,
    });

    factory CoinDetail.fromRawJson(String str) => CoinDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CoinDetail.fromJson(Map<String, dynamic> json) => CoinDetail(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        blockTimeInMinutes: json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices: List<dynamic>.from(json["additional_notices"].map((x) => x)),
        description: Description.fromJson(json["description"]),
        image: Image.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: DateTime.parse(json["genesis_date"]),
        sentimentVotesUpPercentage: json["sentiment_votes_up_percentage"]?.toDouble(),
        sentimentVotesDownPercentage: json["sentiment_votes_down_percentage"]?.toDouble(),
        watchlistPortfolioUsers: json["watchlist_portfolio_users"],
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"]?.toDouble(),
        developerScore: json["developer_score"]?.toDouble(),
        communityScore: json["community_score"]?.toDouble(),
        liquidityScore: json["liquidity_score"]?.toDouble(),
        publicInterestScore: json["public_interest_score"]?.toDouble(),
        marketData: MarketData.fromJson(json["market_data"]),
        statusUpdates: List<dynamic>.from(json["status_updates"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices": List<dynamic>.from(additionalNotices.map((x) => x)),
        "description": description.toJson(),
        "image": image.toJson(),
        "country_origin": countryOrigin,
        "genesis_date": "${genesisDate?.year.toString().padLeft(4, '0')}-${genesisDate?.month.toString().padLeft(2, '0')}-${genesisDate?.day.toString().padLeft(2, '0')}",
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "watchlist_portfolio_users": watchlistPortfolioUsers,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_interest_score": publicInterestScore,
        "market_data": marketData.toJson(),
        "status_updates": List<dynamic>.from(statusUpdates.map((x) => x)),
        "last_updated": lastUpdated.toIso8601String(),
    };
}

class Description {
    String en;

    Description({
        required this.en,
    });

    factory Description.fromRawJson(String str) => Description.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

class Image {
    String thumb;
    String small;
    String large;

    Image({
        required this.thumb,
        required this.small,
        required this.large,
    });

    factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
    };
}

class MarketData {
    Map<String, double> currentPrice;
    dynamic totalValueLocked;
    dynamic mcapToTvlRatio;
    dynamic fdvToTvlRatio;
    dynamic roi;
    Map<String, double> ath;
    Map<String, double> athChangePercentage;
    Map<String, DateTime> athDate;
    Map<String, double> atl;
    Map<String, double> atlChangePercentage;
    Map<String, DateTime> atlDate;
    Map<String, double> marketCap;
    num marketCapRank;
    Map<String, double> fullyDilutedValuation;
    Map<String, double> totalVolume;
    Map<String, double> high24H;
    Map<String, double> low24H;
    double priceChange24H;
    double priceChangePercentage24H;
    double priceChangePercentage7D;
    double priceChangePercentage14D;
    double priceChangePercentage30D;
    double priceChangePercentage60D;
    double priceChangePercentage200D;
    double priceChangePercentage1Y;
    num marketCapChange24H;
    double marketCapChangePercentage24H;
    Map<String, double> priceChange24HInCurrency;
    Map<String, double> priceChangePercentage1HInCurrency;
    Map<String, double> priceChangePercentage24HInCurrency;
    Map<String, double> priceChangePercentage7DInCurrency;
    Map<String, double> priceChangePercentage14DInCurrency;
    Map<String, double> priceChangePercentage30DInCurrency;
    Map<String, double> priceChangePercentage60DInCurrency;
    Map<String, double> priceChangePercentage200DInCurrency;
    Map<String, double> priceChangePercentage1YInCurrency;
    Map<String, double> marketCapChange24HInCurrency;
    Map<String, double> marketCapChangePercentage24HInCurrency;
    num totalSupply;
    num maxSupply;
    num circulatingSupply;
    DateTime lastUpdated;

    MarketData({
        required this.currentPrice,
        this.totalValueLocked,
        this.mcapToTvlRatio,
        this.fdvToTvlRatio,
        this.roi,
        required this.ath,
        required this.athChangePercentage,
        required this.athDate,
        required this.atl,
        required this.atlChangePercentage,
        required this.atlDate,
        required this.marketCap,
        required this.marketCapRank,
        required this.fullyDilutedValuation,
        required this.totalVolume,
        required this.high24H,
        required this.low24H,
        required this.priceChange24H,
        required this.priceChangePercentage24H,
        required this.priceChangePercentage7D,
        required this.priceChangePercentage14D,
        required this.priceChangePercentage30D,
        required this.priceChangePercentage60D,
        required this.priceChangePercentage200D,
        required this.priceChangePercentage1Y,
        required this.marketCapChange24H,
        required this.marketCapChangePercentage24H,
        required this.priceChange24HInCurrency,
        required this.priceChangePercentage1HInCurrency,
        required this.priceChangePercentage24HInCurrency,
        required this.priceChangePercentage7DInCurrency,
        required this.priceChangePercentage14DInCurrency,
        required this.priceChangePercentage30DInCurrency,
        required this.priceChangePercentage60DInCurrency,
        required this.priceChangePercentage200DInCurrency,
        required this.priceChangePercentage1YInCurrency,
        required this.marketCapChange24HInCurrency,
        required this.marketCapChangePercentage24HInCurrency,
        required this.totalSupply,
        required this.maxSupply,
        required this.circulatingSupply,
        required this.lastUpdated,
    });

    factory MarketData.fromRawJson(String str) => MarketData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json["current_price"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Map.from(json["ath"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        athChangePercentage: Map.from(json["ath_change_percentage"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        athDate: Map.from(json["ath_date"]).map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        atlChangePercentage: Map.from(json["atl_change_percentage"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        atlDate: Map.from(json["atl_date"]).map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: Map.from(json["fully_diluted_valuation"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        totalVolume: Map.from(json["total_volume"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        high24H: Map.from(json["high_24h"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        low24H: Map.from(json["low_24h"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H: json["price_change_percentage_24h"]?.toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"]?.toDouble(),
        priceChangePercentage14D: json["price_change_percentage_14d"]?.toDouble(),
        priceChangePercentage30D: json["price_change_percentage_30d"]?.toDouble(),
        priceChangePercentage60D: json["price_change_percentage_60d"]?.toDouble(),
        priceChangePercentage200D: json["price_change_percentage_200d"]?.toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"]?.toDouble(),
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"]?.toDouble(),
        priceChange24HInCurrency: Map.from(json["price_change_24h_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage1HInCurrency: Map.from(json["price_change_percentage_1h_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage24HInCurrency: Map.from(json["price_change_percentage_24h_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage7DInCurrency: Map.from(json["price_change_percentage_7d_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage14DInCurrency: Map.from(json["price_change_percentage_14d_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage30DInCurrency: Map.from(json["price_change_percentage_30d_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage60DInCurrency: Map.from(json["price_change_percentage_60d_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage200DInCurrency: Map.from(json["price_change_percentage_200d_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage1YInCurrency: Map.from(json["price_change_percentage_1y_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCapChange24HInCurrency: Map.from(json["market_cap_change_24h_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCapChangePercentage24HInCurrency: Map.from(json["market_cap_change_percentage_24h_in_currency"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"],
        lastUpdated: DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "current_price": Map.from(currentPrice).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_value_locked": totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio,
        "roi": roi,
        "ath": Map.from(ath).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_change_percentage": Map.from(athChangePercentage).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_date": Map.from(athDate).map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "atl": Map.from(atl).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_change_percentage": Map.from(atlChangePercentage).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_date": Map.from(atlDate).map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "market_cap": Map.from(marketCap).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": Map.from(fullyDilutedValuation).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_volume": Map.from(totalVolume).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "high_24h": Map.from(high24H).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "low_24h": Map.from(low24H).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "price_change_percentage_7d": priceChangePercentage7D,
        "price_change_percentage_14d": priceChangePercentage14D,
        "price_change_percentage_30d": priceChangePercentage30D,
        "price_change_percentage_60d": priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D,
        "price_change_percentage_1y": priceChangePercentage1Y,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "price_change_24h_in_currency": Map.from(priceChange24HInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency": Map.from(priceChangePercentage1HInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency": Map.from(priceChangePercentage24HInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency": Map.from(priceChangePercentage7DInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency": Map.from(priceChangePercentage14DInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency": Map.from(priceChangePercentage30DInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency": Map.from(priceChangePercentage60DInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency": Map.from(priceChangePercentage200DInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency": Map.from(priceChangePercentage1YInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency": Map.from(marketCapChange24HInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency": Map.from(marketCapChangePercentage24HInCurrency).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "last_updated": lastUpdated.toIso8601String(),
    };
}