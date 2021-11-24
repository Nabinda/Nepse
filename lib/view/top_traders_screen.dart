import 'package:flutter/material.dart';

class TopTradersScreen extends StatelessWidget {
  static const String routeName = "/top_traders_screen";
  const TopTradersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Traders"),
      ),
      body: Container(),
    );
  }
}
