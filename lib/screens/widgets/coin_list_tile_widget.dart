import 'package:block_folio/models/coin.dart';
// import 'package:block_folio/models/coin_detail.dart';
import 'package:block_folio/screens/widgets/small_sparkline_widget.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CoinListTile extends StatelessWidget {
  CoinListTile({super.key, required this.coin});

  Coin coin;
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context, listen: false);
    return Column(
      children: [
        
        InkWell(
          onTap: () async {
            await coinsVM.viewDetail(context, coin.id);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  coin.image,
                  height: 48,
                  width: 48,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      coin.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    coin.symbol.toUpperCase(),
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formatCurrency.format(coin.currentPrice),
                            style: TextStyle(
                              color: (coin.priceChangePercentage24H ?? 0.0) >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                (coin.priceChangePercentage24H ?? 0.0) >= 0
                                    ? Icons.arrow_upward_rounded
                                    : Icons.arrow_downward_rounded,
                                color:
                                    (coin.priceChangePercentage24H ?? 0.0) >= 0
                                        ? Colors.green
                                        : Colors.red,
                                size: 14,
                              ),
                              Text(
                                (coin.priceChangePercentage24H ?? 0.0)
                                        .abs()
                                        .toStringAsFixed(2) +
                                    "%",
                                style: TextStyle(
                                  color:
                                      (coin.priceChangePercentage24H ?? 0.0) >=
                                              0
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          height: 48,
                          width: 96,
                          child: SmallSparkline(
                            givenSparkline: coin.sparkline,
                            color: (coin.priceChangePercentage24H ?? 0.0) >= 0
                                ? Colors.green
                                : Colors.red,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          indent: 15,
          endIndent: 15,
        )
      ],
    );
  }
}
