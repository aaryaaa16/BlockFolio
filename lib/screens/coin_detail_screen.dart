import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../view_models/coins_viewmodel.dart';


class CoinDetailScreen extends StatefulWidget {
  CoinDetailScreen({super.key});

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  get rangeOptions => null;

  // _launchURLBrowser() async {
  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);

    if (!coinsVM.isLoading && coinsVM.currentCoin == null) {
      Navigator.pop(context);
    }

    String? name = coinsVM.currentCoin?.name;
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
    String? imageURL = coinsVM.currentCoin?.image?.large;
    String? liquidityScore = coinsVM.currentCoin?.liquidityScore?.toString();
    String? communityScore = coinsVM.currentCoin?.communityScore?.toString();

    String getChange() {
      double? initialPrice = coinsVM.graphData?.prices.first[1];
      double? finalPrice = coinsVM.graphData?.prices.last[1];
      if (initialPrice == null || finalPrice == null) {
        return "0.00";
      } else {
        double change = finalPrice - initialPrice;
        return change.toStringAsFixed(2);
      }
    }

    String getChangePercentage() {
      double? initialPrice = coinsVM.graphData?.prices.first[1];
      double? finalPrice = coinsVM.graphData?.prices.last[1];
      if (initialPrice == null || finalPrice == null) {
        return "0.00";
      } else {
        double change = finalPrice - initialPrice;
        double percentage = (change / initialPrice) * 100;
        return percentage.toStringAsFixed(2) + "%";
      }
    }

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

    Color lineColor() {
      double begin = coinsVM.graphData?.prices.first[1] ?? 0.0;
      double end = coinsVM.graphData?.prices.last[1] ?? 0.0;
      if (begin <= end) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    LinearGradient areaGradient() {
      double begin = coinsVM.graphData?.prices.first[1] ?? 0.0;
      double end = coinsVM.graphData?.prices.last[1] ?? 0.0;
      if (begin <= end) {
        return LinearGradient(colors: [
          Colors.green.withOpacity(0.5),
          Colors.green.withOpacity(0.0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
      } else {
        return LinearGradient(colors: [
          Colors.red.withOpacity(0.5),
          Colors.red.withOpacity(0.0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
      }
    }

    Widget header() => Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      imageURL ?? "",
                      width: 64,
                      height: 64,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          symbol!.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),
                        Text(
                          "\$ $currentPrice",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              getChange(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: lineColor(),
                                  ),
                            ),
                            Text(
                              getChangePercentage(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: lineColor(),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "#" + coinsVM.currentCoin!.marketCapRank.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [],
                ),
              ],
            ),
          ),
        );

    Widget footer() => Container(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('24H L'),
                        Text(
                          low24!,
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('24H H'),
                        Text(
                          high24!,
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Total Volume'),
                        Text(
                          totalVolume!,
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Market Cap'),
                        Text(
                          marketCap!,
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Liquidity Score'),
                        Text(liquidityScore!)
                      ],
                    ),
                    Row(
                      children: [
                        Text('Community Score'),
                        Text(communityScore!)
                      ],
                    ),
                  ],
                ),
              )),
        );

    Widget volumesChart() => coinsVM.graphData == null
        ? Text("No Graph Data")
        : Container(
            padding: EdgeInsets.only(left: 48),
            height: 50,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.auto,
                isVisible: false,
              ),
              primaryYAxis: NumericAxis(isVisible: false),
              series: <ChartSeries>[
                ColumnSeries<List<double>, DateTime>(
                  dataSource: coinsVM.graphData!.totalVolumes,
                  xValueMapper: (List<double> data, _) =>
                      DateTime.fromMillisecondsSinceEpoch(data[0].toInt()),
                  yValueMapper: (List<double> data, _) => data[1],
                ),
              ],
            ),
          );

    Widget graph() => coinsVM.graphData == null
        ? Text("No graph data")
        : Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Duration: ",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        ),
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
                            return OutlinedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Text(
                                      coinsVM.selectedRange,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            // fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                          ),
                                    ),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
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
                  ),
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        SfCartesianChart(
                          primaryXAxis: DateTimeAxis(
                            intervalType: DateTimeIntervalType.auto,
                          ),
                          zoomPanBehavior: ZoomPanBehavior(
                              enablePinching: true, enablePanning: true),
                          series: <ChartSeries>[
                            LineSeries<List<double>, DateTime>(
                              dataSource: coinsVM.graphData!.prices,
                              color: lineColor(),
                              xValueMapper: (List<double> data, _) =>
                                  DateTime.fromMillisecondsSinceEpoch(
                                      data[0].toInt()),
                              yValueMapper: (List<double> data, _) => data[1],
                            ),
                          ],
                        ),
                        SfCartesianChart(
                          trackballBehavior: _trackballBehavior,
                          primaryXAxis: DateTimeAxis(
                            intervalType: DateTimeIntervalType.auto,
                          ),
                          series: <ChartSeries>[
                            AreaSeries<List<double>, DateTime>(
                              dataSource: coinsVM.graphData!.prices,
                              xValueMapper: (List<double> data, _) =>
                                  DateTime.fromMillisecondsSinceEpoch(
                                      data[0].toInt()),
                              yValueMapper: (List<double> data, _) => data[1],
                              gradient: areaGradient(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? "Loading..."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart_rounded),
      ),
      body: coinsVM.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                graph(),
                volumesChart(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: footer(),
                )
              ],
            ),
    );
  }
}
