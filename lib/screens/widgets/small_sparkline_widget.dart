import 'package:block_folio/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SmallSparkline extends StatelessWidget {
  SmallSparkline({super.key, required this.sparkline});

  Sparkline sparkline;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfSparkLineChart(
          data: sparkline.price,
          axisLineWidth: 0,
          color: sparkline.price.first < sparkline.price.last
              ? Colors.green
              : Colors.red,
          width: 1,
        ),
        Container(
          child: SfSparkAreaChart(
            data: sparkline.price,
            axisLineWidth: 0,
            color: sparkline.price.first < sparkline.price.last
                ? Colors.green.withOpacity(0.2)
                : Colors.red.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
