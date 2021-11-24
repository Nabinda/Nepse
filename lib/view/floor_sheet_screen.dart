import 'package:flutter/material.dart';

class FloorSheetScreen extends StatelessWidget {
  static const String routeName = "/floor_sheet_screen";
  const FloorSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor Sheet"),
      ),
      body: Container(),
    );
  }
}
