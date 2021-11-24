import 'package:flutter/material.dart';

class MarketCapitalizationScreen extends StatelessWidget {
  static const String routeName = "/market_capitalization_screen";
  const MarketCapitalizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market Capitalization"),
      ),
      body: Container(),
    );
  }
}
