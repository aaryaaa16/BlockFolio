import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  List<List<double>> getChartData() {
    final chartData = [
      27401.61839408216,
      27286.461797523487,
      27323.735169214182,
      27325.63780854558,
      27342.899192880897,
      27381.15193627067,
      27376.739889090284,
      27339.719607992924,
      27275.587743884887,
      27346.48669340079,
      27385.658439889994,
      27446.727590809125,
      27646.02023449623,
      27646.365606623785,
      28006.453437248976,
      28263.523620165666,
      28258.04092081205,
      28351.218248373007,
      28369.303308214945,
      28345.514289822426,
      28367.328885965442,
      28338.41143005038,
      28348.14862861835,
      28384.289597147195,
      28380.972595328985,
      28349.742816277914,
      28753.188236058297,
      28869.232115040788,
      29010.922475951553,
      28969.84603265537,
      29848.89802711087,
      29837.684524249315,
      29672.992700041676,
      29813.783576006026,
      29794.322659290916,
      29777.229110814416,
      29742.40482895269,
      28071.527904561095,
      28166.648429522516,
      28234.42762220234,
      28422.480539205288,
      28352.19132059668,
      29269.303485119195,
      28734.395523081934,
      29055.641767981484,
      28988.83557843427,
      29049.283878779977,
      29193.675479701225,
      28823.84795423543,
      28916.57470658047,
      28980.832450413975,
      28961.451458613414,
      28992.46315071663,
      28922.023836218694,
      28838.73502916958,
      28955.147507023165,
      29034.973306116324,
      29118.987691016737,
      29076.840184072465,
      29345.927424569327,
      29869.4615452521,
      29696.49213875522,
      29598.679469268507,
      29622.671579618996,
      29488.310592148166,
      29487.59227790039,
      29463.889901593513,
      29483.586506344855,
      29450.849665973852,
      29419.18812724747,
      29480.155818276773,
      29508.37551546861,
      29450.81160984585,
      29506.689812840963,
      29256.560057633316,
      29232.646939725095,
      29305.82150765377,
      29289.44786652117,
      29284.816012011655,
      28969.263939434662,
      29207.560583349023,
      29171.602642264108,
      29290.86788395912,
      29246.749875094854,
      29208.510305463293,
      29345.13311408781,
      29345.54585317659,
      29363.233844384402,
      29396.302476790697,
      29339.99499754935,
      29260.123514292834,
      29310.491387944214,
      29404.055829728204,
      29390.198031038413,
      29393.75800481026,
      29386.12248542495,
      29345.952886572566,
      29383.371083384794,
      29337.840575697162,
      29330.034944071744,
      29301.619369859196,
      29334.745935160332,
      29323.53259391908,
      29423.37034458687,
      29369.652127997677,
      29334.58475389978,
      29310.669698767924,
      29156.37098057197,
      29199.192018079702,
      29275.819489132315,
      29246.92581242874,
      29217.797612735347,
      29240.17736925129,
      29217.944046809913,
      29191.506657997266,
      29164.700764165646,
      29188.891960689303,
      29196.62882040389,
      29223.310973883225,
      29276.108913477685,
      29297.557760171887,
      29304.936378904236,
      29283.490347075323,
      29281.867356125804,
      29235.08720835631,
      29220.379573384813,
      29269.01110839384,
      29303.604571274605,
      29440.282586791018,
      29809.777245111778,
      29738.619547451064,
      29739.909871176587,
      29656.712525700674,
      29358.65872538205,
      29348.7423117686,
      29441.591555817897,
      29400.03166363632,
      29362.056213625394,
      29305.597130735507,
      28842.654479443805,
      28595.976831538992,
      28580.88076874382,
      28552.261450541097,
      28431.23932123237,
      28598.795164199157,
      28642.326585104187,
      28616.77340607422,
      28580.081949322015,
      28560.37211812579,
      28561.586978241772,
      28620.46425358391,
      28529.56502313481,
      28472.791278383647,
      28167.747949221648,
      28385.38324568294,
      28301.509742037444,
      28171.60655909179,
      27892.437319554825,
      27740.332253000946,
      28013.592969040943,
      28007.360195708872,
      28125.501155636823,
      28099.747789189736,
      28011.58808678877,
      27999.89784922244,
      28029.23641973025,
      27974.18817870787,
      28000.6177745973
    ];

    final chartDataMapped = List<List<double>>.generate(chartData.length, (i) => [chartData[i], i.toDouble()]);

    return chartDataMapped;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          series: [
            LineSeries<List<double>, num>(
              dataSource: getChartData(),
              xValueMapper: (List<double> number, _) => number[1],
              yValueMapper: (List<double> number, _) => number[0],
            )
          ],
        ),
      ),
    );
  }
}