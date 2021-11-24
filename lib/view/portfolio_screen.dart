import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  static const routeName = "/portfolio_screen";
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio"),
      ),
       body: Container(),
    );
  }
}
