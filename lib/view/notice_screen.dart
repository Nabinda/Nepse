import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  static const String routeName = "/notice_screen";
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notice"),
      ),
      body: Container(),
    );
  }
}
