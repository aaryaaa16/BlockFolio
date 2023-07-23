import 'package:block_folio/models/serach_result.dart';
import 'package:block_folio/screens/widgets/coin_list_tile_widget.dart';
import 'package:block_folio/view_models/auth_viewmodel.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:block_folio/screens/coin_detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  Widget searchItemTile(CoinSearchResult coin) {
    return Row(
      children: [
        Image.network(
          coin.large ?? "",
          width: 48,
          height: 48,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                coin.id ?? "Unknown",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                maxLines: 2,
              ),
            ),
            Text(
              (coin.symbol ?? "Unknown").toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);

    void handleScrolling() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        if (!coinsVM.isLoading) {
          coinsVM.addPage();
        }
      }
    }

    scrollController.addListener(handleScrolling);

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
              title: Text("View Portfolio"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/history");
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 4, 12, 8),
              child: SizedBox(
                height: 50,
                child: TextField(
                  onChanged: coinsVM.updateSearchQuery,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    coinsVM.search();
                  },
                  onSubmitted: (value) {
                    coinsVM.search();
                  },
                  enableSuggestions: true,
                  cursorWidth: 1.4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          if (coinsVM.searchQuery.isEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CoinListTile(coin: coinsVM.coins[index]);
                },
                childCount: coinsVM.coins.length,
              ),
            ),
          if (coinsVM.searchQuery.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return searchItemTile(coinsVM.searchResults[index]);
                },
                childCount: coinsVM.searchResults.length,
              ),
            ),
          if (coinsVM.isLoading)
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
