import 'package:block_folio/models/coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/coins_viewmodel.dart';

class CoinInfo extends StatelessWidget {
  CoinInfo({super.key, required this.coinDetail});

  CoinDetail coinDetail = CoinDetail.testCoin;

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);

    return Container(
      child: ElevatedButton(
        onPressed: () async {
          print(coinDetail.countryOrigin);
        },
        child: Text('Coin Info'),
      ),
    );
  }
}
