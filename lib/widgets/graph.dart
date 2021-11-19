import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CustomGraph extends StatefulWidget {
  const CustomGraph({Key? key}) : super(key: key);

  @override
  _CustomGraphState createState() => _CustomGraphState();
}

class _CustomGraphState extends State<CustomGraph> {
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enablePinching: true,
        zoomMode: ZoomMode.xy,
        enablePanning: true);
    super.initState();
  }

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 50),
    _SalesData('July', 140),
    _SalesData('Aug', 90),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          zoomPanBehavior: _zoomPanBehavior,
          palette: const <Color>[
            Colors.teal,
            Colors.orange,
            Colors.brown
          ],
          primaryXAxis: CategoryAxis(),
          //primaryYAxis: NumericAxis(isInversed: false),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                color: Colors.lightGreenAccent,
                onPointDoubleTap: (_) {
                  _zoomPanBehavior.reset();
                },
                // Enable data label
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ))
          ]),
    ]);
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
