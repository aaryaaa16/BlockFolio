import 'package:block_folio/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SmallSparkline extends StatelessWidget {
  SmallSparkline(
      {super.key, required this.givenSparkline, required this.color});

  Sparkline givenSparkline;
  Color color;
  @override
  Widget build(BuildContext context) {
    int len = givenSparkline.price.length;
    Sparkline sparkline = Sparkline(
      price: givenSparkline.price.sublist((len * 6 / 7).toInt(), len),
    );
    return Stack(
      children: [
        if (sparkline.price.isNotEmpty)
          SfSparkLineChart(
            data: sparkline.price,
            axisLineWidth: 0,
            color: color,
            width: 1,
          ),
        if (sparkline.price.isNotEmpty)
          Container(
            child: SfSparkAreaChart(
              data: sparkline.price,
              axisLineWidth: 0,
              color: color.withOpacity(0.2),
            ),
          ),
      ],
    );
  }
}
