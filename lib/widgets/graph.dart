import 'package:flutter/material.dart';
import 'package:nepse/bloc/nepse_index_chart/bloc.dart';
import 'package:nepse/model/nepse_index_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGraph extends StatefulWidget {
  const CustomGraph({Key? key}) : super(key: key);

  @override
  _CustomGraphState createState() => _CustomGraphState();
}

class _CustomGraphState extends State<CustomGraph> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NepseIndexBloc>(context).add(const FetchNepseIndex());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NepseIndexBloc, NepseIndexState>(
        builder: (context, state) {
      if (state is NepseIndexError) {
        return const Center(
          child: Text('Failed To Fetch Nepse Index Data'),
        );
      }
      if (state is NepseIndexEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      }
      if (state is NepseIndexLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NepseIndexLoaded) {
        final data = state.nepseIndex.nepseIndexList;
        return SfCartesianChart(
            zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
            palette: const <Color>[Colors.teal, Colors.orange, Colors.brown],
            primaryXAxis: DateTimeAxis(
                title: AxisTitle(text: 'Time'),
                intervalType: DateTimeIntervalType.hours,
                visibleMinimum: data[data.length - 4].time,
                visibleMaximum: data[data.length - 1].time),
            primaryYAxis: NumericAxis(isInversed: false, interval: 10),
            // Chart title
            title: ChartTitle(text: 'Nepse Index'),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<NepseIndexModel, DateTime>>[
              AreaSeries(
                  dataSource: data,
                  xValueMapper: (data, _) => data.time,
                  yValueMapper: (data, _) => data.index,
                  isVisibleInLegend: true,
                  xAxisName: 'Time',
                  yAxisName: 'Index',
                  name: 'Nepse Index',
                  color: Colors.lightGreenAccent,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    color: Colors.white,
                  ))
            ]);
      } else {
        return Container();
      }
    });
  }
}
