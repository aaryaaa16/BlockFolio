import 'package:block_folio/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinListTile extends StatelessWidget {
  CoinListTile({super.key, required this.coin});

  Coin coin;
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              coin.image,
              height: 48,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coin.name,
              ),
              Text(
                coin.symbol.toUpperCase(),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatCurrency.format(coin.currentPrice),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        coin.priceChangePercentage24H >= 0
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        color: coin.priceChangePercentage24H >= 0
                            ? Colors.green
                            : Colors.red,
                        size: 14,
                      ),
                      Text(
                        coin.priceChangePercentage24H.abs().toStringAsFixed(2) +
                            "%",
                        style: TextStyle(
                          color: coin.priceChangePercentage24H >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
