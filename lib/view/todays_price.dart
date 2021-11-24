import 'package:flutter/material.dart';

class TodaysPriceScreen extends StatelessWidget {
  static const String routeName = "/today's_price_screen";
  const TodaysPriceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Price"),
      ),
      body: Container(),
    );
  }
}
