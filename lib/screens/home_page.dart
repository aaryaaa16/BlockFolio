import 'package:block_folio/screens/widgets/coin_list_tile_widget.dart';
import 'package:block_folio/view_models/auth_viewmodel.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:block_folio/screens/coin_detail_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockfolio'),
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/profile");
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 16),
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.transparent)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 64,
                      ),
                      SizedBox(height: 8),
                      if (loginVM.currentUser != null)
                        Text(
                          loginVM.currentUser!.name!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      if (loginVM.currentUser != null) SizedBox(height: 4),
                      if (loginVM.currentUser != null)
                        Text(
                          loginVM.currentUser!.email!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      if (loginVM.currentUser == null)
                        Text(
                          "Log In",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Find a Bus"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/routes");
              },
            ),
            ListTile(
              title: Text("Make a Payment"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/payment");
              },
            ),
            ListTile(
              title: Text("Travel History"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/history");
              },
            ),
          ],
        ),
      ),
      body: coinsVM.coins.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CoinDetail())
                      );
                    },
                  child: Text(
                    'coinPage'
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        margin: EdgeInsets.all(8.0),
                        width: 48,
                        child: Text(
                          'Icon',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        ),
                      ),
                      Text(
                        'Name',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '24h',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              width: 96,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '7d',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: coinsVM.coins
                          .map((e) => CoinListTile(coin: e))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
