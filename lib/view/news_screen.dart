import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = "/news_screen";
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: Container(),
    );
  }
}
