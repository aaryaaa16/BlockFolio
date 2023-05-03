import 'package:block_folio/models/coin.dart';
import 'package:block_folio/screens/widgets/coin_list_tile_widget.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockfolio'),
        elevation: 2,
      ),
      body: coinsVM.coins.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children:
                    coinsVM.coins.map((e) => CoinListTile(coin: e)).toList(),
              ),
            ),
    );
  }
}
