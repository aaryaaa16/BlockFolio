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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to Blockfolio',
            ),
          ],
        ),
      ),
    );
  }
}
