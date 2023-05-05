import 'package:block_folio/models/coin_detail.dart';
import 'package:block_folio/models/user_model.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context, listen: true);
    if (coinsVM.currentCoin == null) {
      Navigator.pop(context);
    }
    final coinDetail = coinsVM.currentCoin!;
    final purchasedCoin = PurchasedCoin(
        purchaseDate: DateTime.now(),
        coinId: coinDetail.id,
        purchasePrice:
            coinDetail.marketData?.currentPrice?['usd']?.toDouble() ?? 0.0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase"),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  (coinDetail.name ?? "Unknown"),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Current Price: ",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                Text(
                  (coinDetail.marketData?.currentPrice?['usd']?.toString() ??
                      "0.0"),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter ammont',
              ),
              onChanged: (value) {
                purchasedCoin.purchasePrice = double.parse(value);
              },
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    child: Text("Purchase"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
