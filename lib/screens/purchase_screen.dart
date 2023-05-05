import 'package:block_folio/models/coin_detail.dart';
import 'package:block_folio/models/user_model.dart';
import 'package:block_folio/view_models/auth_viewmodel.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:block_folio/view_models/portfolio_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context, listen: true);
    final portfolioVM = Provider.of<PortfolioViewModel>(context, listen: true);
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);
    if (coinsVM.currentCoin == null) {
      Navigator.pop(context);
    }
    final coinDetail = coinsVM.currentCoin!;
    final currentPrice =
        coinDetail.marketData?.currentPrice?['usd']?.toDouble() ?? 0.0;
    final purchasedCoin = PurchasedCoin(
      purchaseDate: DateTime.now(),
      coinId: coinDetail.id,
      quantity: 0,
      purchasePrice: currentPrice,
    );

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
                final val = double.tryParse(value);
                purchasedCoin.quantity = (val ?? 0.0) / currentPrice;
              },
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    child: Text("Purchase"),
                    onPressed: () {
                      if (loginVM.currentUser == null) {
                        Navigator.pushNamed(context, '/profile');
                        return;
                      }
                      purchasedCoin.purchasePrice = currentPrice;
                      portfolioVM.purchaseCoins(
                          purchasedCoin, loginVM.currentUser!.id ?? "none");
                    },
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
