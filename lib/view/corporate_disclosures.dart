import 'package:flutter/material.dart';

class CorporateDisclosuresScreen extends StatelessWidget {
  static const String routeName = "/corporate_disclosures_screen";
  const CorporateDisclosuresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corporate Disclosures"),
      ),
      body: Container(),
    );
  }
}
