import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view_models/coins_viewmodel.dart';
import 'package:url_launcher/link.dart';

class CoinDetailScreen extends StatelessWidget {
  CoinDetailScreen({super.key});

  get rangeOptions => null;

  // _launchURLBrowser() async {
  //   var url = website;
  //   if (await canLaunch(url!)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);

    if (!coinsVM.isLoading && coinsVM.currentCoin == null) {
      Navigator.pop(context);
    }

    String? name = coinsVM.currentCoin?.name;
    print(name);
    String? symbol = coinsVM.currentCoin?.symbol;
    String? currentPrice =
        coinsVM.currentCoin?.marketData?.currentPrice!['usd']?.toString();
    String? totalVolume =
        coinsVM.currentCoin?.marketData?.totalVolume!['usd']?.toString();
    String? high24 =
        coinsVM.currentCoin?.marketData?.high24H!['usd']?.toString();
    String? low24 = coinsVM.currentCoin?.marketData?.low24H!['usd']?.toString();
    String? marketCap =
        coinsVM.currentCoin?.marketData?.marketCap!['usd']?.toString();
    String? website = coinsVM.currentCoin?.links?.homepage![0]?.toString();
    String? imageURL = coinsVM.currentCoin?.image?.thumb?.toString();

    _launchURLApp() async {
      var url = website;
      if (await canLaunch(url!)) {
        await launch(url, forceSafariVC: true, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    List<List<double>> prices = [
      [1682967657190, 28171.60655909179],
      [1682971251205, 27892.437319554825],
      [1682974810496, 27740.332253000946],
      [1682978406729, 28013.592969040943],
      [1682982012049, 28007.360195708872],
      [1682985606595, 28125.501155636823],
      [1682989206485, 28099.747789189736],
      [1682992803989, 28011.58808678877],
      [1682996459973, 27999.89784922244],
      [1683000059022, 28029.23641973025],
      [1683003634625, 27974.18817870787],
      [1683007267485, 28000.6177745973],
      [1683010806272, 28002.239483655878],
      [1683014427446, 28030.141380509038],
      [1683018010314, 28043.644977077103],
      [1683021672716, 27996.19326596321],
      [1683025222719, 28024.76710826783],
      [1683028853117, 28073.41150317945],
      [1683032438033, 28163.199242190058],
      [1683036010281, 28011.987254151092],
      [1683039643968, 28470.55539908227],
      [1683043258601, 28528.537485217974],
      [1683046882397, 28482.582111875538],
      [1683050405876, 28599.969298825374],
      [1683054003958, 28725.894198521066],
      [1683057623815, 28748.042943001867],
      [1683061222944, 28706.92346797802],
      [1683064846570, 28675.05800276479],
      [1683068505128, 28777.605218075783],
      [1683072089637, 28654.390133326717],
      [1683075603035, 28619.059219824012],
      [1683079201124, 28542.667469803946],
      [1683082878596, 28522.6998550533],
      [1683086427565, 28531.103614134492],
      [1683090015325, 28526.836496395514],
      [1683093629367, 28480.278495073115],
      [1683097205927, 28616.142974697006],
      [1683100825570, 28663.727712396598],
      [1683104450122, 28733.4319728726],
      [1683108006237, 28665.88859502708],
      [1683111643672, 28663.80893264078],
      [1683115205060, 28609.887497548385],
      [1683118891473, 28402.58177797949],
      [1683122478551, 28326.55934195484],
      [1683126062238, 28255.902587948047],
      [1683129671296, 28337.46391936188],
      [1683133256810, 28396.598344559814],
      [1683136830321, 28576.620707641123],
      [1683140468678, 28435.09833343794],
      [1683144021915, 28382.60560068505],
      [1683147660372, 28395.19443551921],
      [1683151293866, 28965.927272881996],
      [1683154857506, 29081.325675810822],
      [1683158459449, 28988.320996249273],
      [1683162049482, 29088.144016544065],
      [1683165642302, 29042.288848721226],
      [1683169251626, 29050.827890734534],
      [1683172867200, 29106.65001871619],
      [1683176437641, 29111.885410176983],
      [1683180008866, 29200.31858051141],
      [1683183657181, 29176.598225915513],
      [1683187251487, 29078.472181376357],
      [1683190853439, 29087.861031094635],
      [1683194474793, 29069.40363420366],
      [1683198042986, 29254.716934816213],
      [1683201645724, 29167.57369162784],
      [1683205269210, 29083.836681572473],
      [1683208839241, 28802.76354147552],
      [1683212403698, 28857.00705990738],
      [1683216070620, 28879.36144570229],
      [1683219644665, 28928.724358922926],
      [1683223201178, 28854.970014956503],
      [1683225493000, 28769.70541103912]
    ];

    List<List<String>> rangeOptions = [
      ["1", "1D"],
      ["3", "3D"],
      ["7", "7D"],
      ["30", "1M"],
      ["90", "3M"],
      ["180", "6M"],
      ["365", "1Y"],
      ["max", "MAX"],
    ];

    Widget header() => Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 60.0, 8.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(imageURL!),
                    Text(
                      name!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                    ),
                  ],
                ),
                Text(
                  symbol!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                TextButton(
                    onPressed: _launchURLApp,
                    child: Text(
                      website!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    )),
                Divider(
                  height: 20,
                ),
                Text(
                  "\$ $currentPrice",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                )
              ],
            ),
          ),
        );
    Widget footer() => Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('24H High'), Text(high24!)],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('24H Low'), Text(low24!)],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Total Volume'), Text(totalVolume!)],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Market Cap'), Text(marketCap!)],
                    )
                  ],
                )
              ],
            ),
          ),
        );

    Widget graph() => coinsVM.graphData == null
        ? Text("No graph data")
        : Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Duration: "),
                      MenuAnchor(
                        menuChildren: rangeOptions
                            .map(
                              (e) => RadioMenuButton<String>(
                                value: e[0],
                                groupValue: coinsVM.selectedRange,
                                onChanged: coinsVM.setRange,
                                child: Text(e[1]),
                              ),
                            )
                            .toList(),
                        builder: (context, controller, child) {
                          return TextButton(
                            child: Row(
                              children: [
                                Text(coinsVM.selectedRange),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                  Container(
                    height: 300,
                    child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(
                        intervalType: DateTimeIntervalType.auto,
                      ),
                      series: <ChartSeries>[
                        LineSeries<List<double>, DateTime>(
                          dataSource: coinsVM.graphData!.prices,
                          xValueMapper: (List<double> data, _) =>
                              DateTime.fromMillisecondsSinceEpoch(
                                  data[0].toInt()),
                          yValueMapper: (List<double> data, _) => data[1],
                        ),
                        AreaSeries<List<double>, DateTime>(
                            dataSource: coinsVM.graphData!.prices,
                            xValueMapper: (List<double> data, _) =>
                                DateTime.fromMillisecondsSinceEpoch(
                                    data[0].toInt()),
                            yValueMapper: (List<double> data, _) => data[1],
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.5),
                                  Colors.blue.withOpacity(0.0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );

    return Scaffold(
      body: coinsVM.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [header(), graph(), footer()],
            ),
    );
  }
}
