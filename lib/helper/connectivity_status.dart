import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityStatus extends StatefulWidget {
  const ConnectivityStatus({Key? key}) : super(key: key);

  @override
  _ConnectivityStatusState createState() => _ConnectivityStatusState();
}

class _ConnectivityStatusState extends State<ConnectivityStatus> {
  ConnectivityResult result = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivityResult;



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
