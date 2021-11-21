import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/nepse_index_chart/bloc.dart';
import 'package:nepse/repositories/api_client.dart';
import 'package:nepse/repositories/nepse_index_repositories.dart';
import 'package:nepse/widgets/graph.dart';

void main() {
  final NepseIndexRepositories repository = NepseIndexRepositories(
    nepseIndexApiClient:  ApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(
    nepseIndexRepositories: repository,
  ));
}

class MyApp extends StatelessWidget {
  final NepseIndexRepositories nepseIndexRepositories;
  const MyApp({Key? key, required this.nepseIndexRepositories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NepseIndexBloc>(
            create: (_) => NepseIndexBloc(
      nepseIndexRepositories: nepseIndexRepositories
    ))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      //print(e.toString());
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity example app'),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: const CustomGraph()),
    );
  }
}
