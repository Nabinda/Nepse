import 'package:flutter/material.dart';

class WatchListScreen extends StatelessWidget {
  static const String routeName = "/watch_list_screen";
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("WatchList"),
      ),
      body: Container(),
    );
  }
}
