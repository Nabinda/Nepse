import 'package:flutter/material.dart';
import 'package:nepse/bloc/nepse_index_chart/bloc.dart';
import 'package:nepse/model/nepse_index/nepse_index_model.dart';
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
        
        return const CircularProgressIndicator();
      }
      if (state is NepseIndexLoaded) {
        final data = state.nepseIndex.nepseIndexList;
        return _graph(data);
      } else {
        return Container();
      }
    });
  }

  Widget _graph(List<NepseIndexModel> data) {
    return SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
        palette: const <Color>[Colors.teal, Colors.orange, Colors.brown],
        primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            visibleMinimum: data[data.length ~/ 2].time,
            visibleMaximum: data[data.length - 1].time),
        primaryYAxis: NumericAxis(
            isInversed: false,
            interval: 10,
            majorGridLines: const MajorGridLines(width: 0)),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<NepseIndexModel, DateTime>>[
          AreaSeries(
            dataSource: data,
            xValueMapper: (list, _) => list.time,
            yValueMapper: (list, _) => list.index,
            name: 'Nepse Index',
            color: Colors.lightGreenAccent,
          )
        ]);
  }
}
