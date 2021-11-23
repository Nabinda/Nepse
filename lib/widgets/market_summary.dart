import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/market_summary/bloc.dart';
import 'package:nepse/model/market_summary/nepse_market_summary.dart';

class MarketSummary extends StatefulWidget {
  const MarketSummary({Key? key}) : super(key: key);

  @override
  _MarketSummaryState createState() => _MarketSummaryState();
}

class _MarketSummaryState extends State<MarketSummary> {
  final double index = 2733.14;
  final double changeInNumber = -32;
  final double changeInPercentage = -1.17;
  final int increased = 10;
  final int decreased = 171;
  final int unchanged = 5;
  final String marketStatus = "Market Opened";
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MarketSummaryBloc>(context).add(const FetchMarketSummary());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketSummaryBloc,MarketSummaryState>(
      builder: (context,state) {
        if (state is MarketSummaryError) {
          return const Center(
            child: Text('Failed To Fetch Nepse Index Data'),
          );
        }
        if (state is MarketSummaryEmpty) {
          return const Center(
            child: Text("No Data Found"),
          );
        }
        if (state is MarketSummaryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MarketSummaryLoaded) {
          final data = state.marketSummaryList.nepseMarketSummaryList;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nepse Index",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              index.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              changeInNumber.toString(),
                              style: TextStyle(
                                  color: changeInNumber.isNegative
                                      ? Colors.red
                                      : Colors.green,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(changeInPercentage.toString() + "%",
                                style: TextStyle(
                                    color: changeInPercentage.isNegative
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 12))
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                              color: marketStatus == "Market Closed"
                                  ? Colors.red
                                  : Colors.green,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                          child: Text(
                            marketStatus,
                            style: const TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].detail +
                              "\n" +
                              data[index].value.toString(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    itemCount: data.length,
                  ),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      increased.toString() + "\n INCREASED",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      decreased.toString() + "\n DECREASED",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    Text(
                      unchanged.toString() + "\n UNCHANGED",
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      }
    );
  }
}
