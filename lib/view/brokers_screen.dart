import 'package:flutter/material.dart';

class BrokersScreen extends StatelessWidget {
  static const String routeName = "/broker_screen";
  const BrokersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brokers"),
      ),
    );
  }
}
