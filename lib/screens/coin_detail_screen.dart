import 'package:flutter/material.dart';
import 'package:block_folio/models/coin_detail.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/coin.dart';
import '../view_models/coins_viewmodel.dart';

class CoinDetailScreen extends StatelessWidget {
  CoinDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coinsVM = Provider.of<CoinsViewModel>(context);

    if (!coinsVM.isLoading && coinsVM.currentCoin == null) {
      Navigator.pop(context);
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

    Widget header() => Container(
          height: 200,
          width: 400,
          child: Column(
            children: [
              Text(''),
            ],
          ),
        );

    Widget footer() => Text('Footer');

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
                            child: Text(coinsVM.selectedRange),
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
