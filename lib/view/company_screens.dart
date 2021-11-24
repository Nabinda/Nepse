import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  static const String routeName = "/company_screen";
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
      ),
      body: Container(),
    );
  }
}
