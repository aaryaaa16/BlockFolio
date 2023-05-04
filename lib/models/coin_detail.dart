// To parse this JSON data, do
//
//     final coinDetail = coinDetailFromJson(jsonString);

import 'dart:convert';

class CoinDetail {
    String? id;
    String? symbol;
    String? name;
    dynamic assetPlatformId;
    num? blockTimeInMinutes;
    String? hashingAlgorithm;
    List<String>? categories;
    dynamic publicNotice;
    List<dynamic>? additionalNotices;
    Description? description;
    Links? links;
    Image? image;
    String? countryOrigin;
    DateTime? genesisDate;
    num? sentimentVotesUpPercentage;
    num? sentimentVotesDownPercentage;
    num? watchlistPortfolioUsers;
    num? marketCapRank;
    num? coingeckoRank;
    num? coingeckoScore;
    num? developerScore;
    num? communityScore;
    num? liquidityScore;
    num? publicnumerestScore;
    MarketData? marketData;
    List<dynamic>? statusUpdates;
    DateTime? lastUpdated;

    CoinDetail({
        this.id,
        this.symbol,
        this.name,
        this.assetPlatformId,
        this.blockTimeInMinutes,
        this.hashingAlgorithm,
        this.categories,
        this.publicNotice,
        this.additionalNotices,
        this.description,
        this.links,
        this.image,
        this.countryOrigin,
        this.genesisDate,
        this.sentimentVotesUpPercentage,
        this.sentimentVotesDownPercentage,
        this.watchlistPortfolioUsers,
        this.marketCapRank,
        this.coingeckoRank,
        this.coingeckoScore,
        this.developerScore,
        this.communityScore,
        this.liquidityScore,
        this.publicnumerestScore,
        this.marketData,
        this.statusUpdates,
        this.lastUpdated,
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
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices: json["additional_notices"] == null ? [] : List<dynamic>.from(json["additional_notices"]!.map((x) => x)),
        description: json["description"] == null ? null : Description.fromJson(json["description"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: json["genesis_date"] == null ? null : DateTime.parse(json["genesis_date"]),
        sentimentVotesUpPercentage: json["sentiment_votes_up_percentage"],
        sentimentVotesDownPercentage: json["sentiment_votes_down_percentage"],
        watchlistPortfolioUsers: json["watchlist_portfolio_users"],
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"],
        developerScore: json["developer_score"],
        communityScore: json["community_score"],
        liquidityScore: json["liquidity_score"],
        publicnumerestScore: json["public_numerest_score"],
        marketData: json["market_data"] == null ? null : MarketData.fromJson(json["market_data"]),
        statusUpdates: json["status_updates"] == null ? [] : List<dynamic>.from(json["status_updates"]!.map((x) => x)),
        lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices": additionalNotices == null ? [] : List<dynamic>.from(additionalNotices!.map((x) => x)),
        "description": description?.toJson(),
        "links": links?.toJson(),
        "image": image?.toJson(),
        "country_origin": countryOrigin,
        "genesis_date": "${genesisDate!.year.toString().padLeft(4, '0')}-${genesisDate!.month.toString().padLeft(2, '0')}-${genesisDate!.day.toString().padLeft(2, '0')}",
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "watchlist_portfolio_users": watchlistPortfolioUsers,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_numerest_score": publicnumerestScore,
        "market_data": marketData?.toJson(),
        "status_updates": statusUpdates == null ? [] : List<dynamic>.from(statusUpdates!.map((x) => x)),
        "last_updated": lastUpdated?.toIso8601String(),
    };
}

class Description {
    String? en;

    Description({
        this.en,
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
    String? thumb;
    String? small;
    String? large;

    Image({
        this.thumb,
        this.small,
        this.large,
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

class Links {
    List<String>? homepage;
    List<String>? blockchainSite;
    List<String>? officialForumUrl;
    List<String>? chatUrl;
    List<String>? announcementUrl;
    String? twitterScreenName;
    String? facebookUsername;
    dynamic bitconumalkThreadIdentifier;
    String? telegramChannelIdentifier;
    String? subredditUrl;

    Links({
        this.homepage,
        this.blockchainSite,
        this.officialForumUrl,
        this.chatUrl,
        this.announcementUrl,
        this.twitterScreenName,
        this.facebookUsername,
        this.bitconumalkThreadIdentifier,
        this.telegramChannelIdentifier,
        this.subredditUrl,
    });

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: json["homepage"] == null ? [] : List<String>.from(json["homepage"]!.map((x) => x)),
        blockchainSite: json["blockchain_site"] == null ? [] : List<String>.from(json["blockchain_site"]!.map((x) => x)),
        officialForumUrl: json["official_forum_url"] == null ? [] : List<String>.from(json["official_forum_url"]!.map((x) => x)),
        chatUrl: json["chat_url"] == null ? [] : List<String>.from(json["chat_url"]!.map((x) => x)),
        announcementUrl: json["announcement_url"] == null ? [] : List<String>.from(json["announcement_url"]!.map((x) => x)),
        twitterScreenName: json["twitter_screen_name"],
        facebookUsername: json["facebook_username"],
        bitconumalkThreadIdentifier: json["bitconumalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
    );

    Map<String, dynamic> toJson() => {
        "homepage": homepage == null ? [] : List<dynamic>.from(homepage!.map((x) => x)),
        "blockchain_site": blockchainSite == null ? [] : List<dynamic>.from(blockchainSite!.map((x) => x)),
        "official_forum_url": officialForumUrl == null ? [] : List<dynamic>.from(officialForumUrl!.map((x) => x)),
        "chat_url": chatUrl == null ? [] : List<dynamic>.from(chatUrl!.map((x) => x)),
        "announcement_url": announcementUrl == null ? [] : List<dynamic>.from(announcementUrl!.map((x) => x)),
        "twitter_screen_name": twitterScreenName,
        "facebook_username": facebookUsername,
        "bitconumalk_thread_identifier": bitconumalkThreadIdentifier,
        "telegram_channel_identifier": telegramChannelIdentifier,
        "subreddit_url": subredditUrl,
    };
}

class MarketData {
    Map<String, num>? currentPrice;
    dynamic totalValueLocked;
    dynamic mcapToTvlRatio;
    dynamic fdvToTvlRatio;
    dynamic roi;
    Map<String, num>? ath;
    Map<String, num>? athChangePercentage;
    Map<String, DateTime>? athDate;
    Map<String, num>? atl;
    Map<String, num>? atlChangePercentage;
    Map<String, DateTime>? atlDate;
    Map<String, num>? marketCap;
    num? marketCapRank;
    Map<String, num>? fullyDilutedValuation;
    Map<String, num>? totalVolume;
    Map<String, num>? high24H;
    Map<String, num>? low24H;
    num? priceChange24H;
    num? priceChangePercentage24H;
    num? priceChangePercentage7D;
    num? priceChangePercentage14D;
    num? priceChangePercentage30D;
    num? priceChangePercentage60D;
    num? priceChangePercentage200D;
    num? priceChangePercentage1Y;
    num? marketCapChange24H;
    num? marketCapChangePercentage24H;
    Map<String, num>? priceChange24HInCurrency;
    Map<String, num>? priceChangePercentage1HInCurrency;
    Map<String, num>? priceChangePercentage24HInCurrency;
    Map<String, num>? priceChangePercentage7DInCurrency;
    Map<String, num>? priceChangePercentage14DInCurrency;
    Map<String, num>? priceChangePercentage30DInCurrency;
    Map<String, num>? priceChangePercentage60DInCurrency;
    Map<String, num>? priceChangePercentage200DInCurrency;
    Map<String, num>? priceChangePercentage1YInCurrency;
    Map<String, num>? marketCapChange24HInCurrency;
    Map<String, num>? marketCapChangePercentage24HInCurrency;
    num? totalSupply;
    num? maxSupply;
    num? circulatingSupply;
    DateTime? lastUpdated;

    MarketData({
        this.currentPrice,
        this.totalValueLocked,
        this.mcapToTvlRatio,
        this.fdvToTvlRatio,
        this.roi,
        this.ath,
        this.athChangePercentage,
        this.athDate,
        this.atl,
        this.atlChangePercentage,
        this.atlDate,
        this.marketCap,
        this.marketCapRank,
        this.fullyDilutedValuation,
        this.totalVolume,
        this.high24H,
        this.low24H,
        this.priceChange24H,
        this.priceChangePercentage24H,
        this.priceChangePercentage7D,
        this.priceChangePercentage14D,
        this.priceChangePercentage30D,
        this.priceChangePercentage60D,
        this.priceChangePercentage200D,
        this.priceChangePercentage1Y,
        this.marketCapChange24H,
        this.marketCapChangePercentage24H,
        this.priceChange24HInCurrency,
        this.priceChangePercentage1HInCurrency,
        this.priceChangePercentage24HInCurrency,
        this.priceChangePercentage7DInCurrency,
        this.priceChangePercentage14DInCurrency,
        this.priceChangePercentage30DInCurrency,
        this.priceChangePercentage60DInCurrency,
        this.priceChangePercentage200DInCurrency,
        this.priceChangePercentage1YInCurrency,
        this.marketCapChange24HInCurrency,
        this.marketCapChangePercentage24HInCurrency,
        this.totalSupply,
        this.maxSupply,
        this.circulatingSupply,
        this.lastUpdated,
    });

    factory MarketData.fromRawJson(String str) => MarketData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json["current_price"]!).map((k, v) => MapEntry<String, num>(k, v)),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Map.from(json["ath"]!).map((k, v) => MapEntry<String, num>(k, v)),
        athChangePercentage: Map.from(json["ath_change_percentage"]!).map((k, v) => MapEntry<String, num>(k, v)),
        athDate: Map.from(json["ath_date"]!).map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"]!).map((k, v) => MapEntry<String, num>(k, v)),
        atlChangePercentage: Map.from(json["atl_change_percentage"]!).map((k, v) => MapEntry<String, num>(k, v)),
        atlDate: Map.from(json["atl_date"]!).map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"]!).map((k, v) => MapEntry<String, num>(k, v)),
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: Map.from(json["fully_diluted_valuation"]!).map((k, v) => MapEntry<String, num>(k, v)),
        totalVolume: Map.from(json["total_volume"]!).map((k, v) => MapEntry<String, num>(k, v)),
        high24H: Map.from(json["high_24h"]!).map((k, v) => MapEntry<String, num>(k, v)),
        low24H: Map.from(json["low_24h"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChange24H: json["price_change_24h"],
        priceChangePercentage24H: json["price_change_percentage_24h"],
        priceChangePercentage7D: json["price_change_percentage_7d"],
        priceChangePercentage14D: json["price_change_percentage_14d"],
        priceChangePercentage30D: json["price_change_percentage_30d"],
        priceChangePercentage60D: json["price_change_percentage_60d"],
        priceChangePercentage200D: json["price_change_percentage_200d"],
        priceChangePercentage1Y: json["price_change_percentage_1y"],
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"],
        priceChange24HInCurrency: Map.from(json["price_change_24h_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage1HInCurrency: Map.from(json["price_change_percentage_1h_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage24HInCurrency: Map.from(json["price_change_percentage_24h_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage7DInCurrency: Map.from(json["price_change_percentage_7d_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage14DInCurrency: Map.from(json["price_change_percentage_14d_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage30DInCurrency: Map.from(json["price_change_percentage_30d_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage60DInCurrency: Map.from(json["price_change_percentage_60d_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage200DInCurrency: Map.from(json["price_change_percentage_200d_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage1YInCurrency: Map.from(json["price_change_percentage_1y_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        marketCapChange24HInCurrency: Map.from(json["market_cap_change_24h_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        marketCapChangePercentage24HInCurrency: Map.from(json["market_cap_change_percentage_24h_in_currency"]!).map((k, v) => MapEntry<String, num>(k, v)),
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"],
        lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "current_price": Map.from(currentPrice!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_value_locked": totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio,
        "roi": roi,
        "ath": Map.from(ath!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_change_percentage": Map.from(athChangePercentage!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_date": Map.from(athDate!).map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "atl": Map.from(atl!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_change_percentage": Map.from(atlChangePercentage!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_date": Map.from(atlDate!).map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "market_cap": Map.from(marketCap!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": Map.from(fullyDilutedValuation!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_volume": Map.from(totalVolume!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "high_24h": Map.from(high24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "low_24h": Map.from(low24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
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
        "price_change_24h_in_currency": Map.from(priceChange24HInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency": Map.from(priceChangePercentage1HInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency": Map.from(priceChangePercentage24HInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency": Map.from(priceChangePercentage7DInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency": Map.from(priceChangePercentage14DInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency": Map.from(priceChangePercentage30DInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency": Map.from(priceChangePercentage60DInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency": Map.from(priceChangePercentage200DInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency": Map.from(priceChangePercentage1YInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency": Map.from(marketCapChange24HInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency": Map.from(marketCapChangePercentage24HInCurrency!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "last_updated": lastUpdated?.toIso8601String(),
    };
}
