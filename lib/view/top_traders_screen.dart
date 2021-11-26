import 'package:flutter/material.dart';
import 'package:nepse/widgets/top_traders.dart';
import 'package:nepse/widgets/top_turnover.dart';

class TopTradersScreen extends StatelessWidget {
  static const String routeName = "/top_traders_screen";
  const TopTradersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Top Traders"),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text("Top Gainers"),
                ),
                Tab(
                  child: Text("Top Losers"),
                ),
                Tab(
                  child: Text("Top TurnOver"),
                ),
                Tab(
                  child: Text("Top Volume"),
                ),
                Tab(
                  child: Text("Top Transaction"),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            TopTraders(topTraders: "Gainers"),
            TopTraders(topTraders: "Losers"),
            TopTurnOver(),
            TopTraders(topTraders: "Volume"),
            TopTraders(topTraders: "Transaction"),]
            ),
        ),
      );
  }
}
