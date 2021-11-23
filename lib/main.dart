import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/connectivity/bloc.dart';
import 'package:nepse/bloc/market_summary/bloc.dart';
import 'package:nepse/bloc/nepse_index_chart/bloc.dart';
import 'package:nepse/repositories/api_client.dart';
import 'package:nepse/repositories/market_summary_repositories.dart';
import 'package:nepse/repositories/nepse_index_repositories.dart';
import 'package:nepse/view/landing_screen.dart';

void main() {
  final NepseIndexRepositories nepseIndexRepositories = NepseIndexRepositories(
    nepseIndexApiClient: ApiClient(
      httpClient: http.Client(),
    ),
  );
  final MarketSummaryRepositories marketSummaryRepositories = MarketSummaryRepositories(apiClient: ApiClient(
    httpClient: http.Client(),
  ),);
  runApp(MyApp(
    nepseIndexRepositories: nepseIndexRepositories,
    marketSummaryRepositories: marketSummaryRepositories,
  ));
}

class MyApp extends StatelessWidget {
  final NepseIndexRepositories nepseIndexRepositories;
  final MarketSummaryRepositories marketSummaryRepositories;
  const MyApp({Key? key, required this.nepseIndexRepositories, required this.marketSummaryRepositories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NepseIndexBloc>(
            create: (_) =>
                NepseIndexBloc(nepseIndexRepositories: nepseIndexRepositories)),
        BlocProvider<ConnectivityBloc>(
            create: (_) =>
                ConnectivityBloc(connectivity: Connectivity())),
        BlocProvider<MarketSummaryBloc>(
            create: (_) =>
                MarketSummaryBloc(marketSummaryRepositories: marketSummaryRepositories))
      ],
      child: MaterialApp(
        title: 'Nepse',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Nepse'),
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
  @override
  void initState() {
    BlocProvider.of<ConnectivityBloc>(context).add(const StartConnectivityEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context,state){
        if(state is ConnectivityHasInternetState){
          return const Scaffold(
              body: LandingScreen()
          );
        }
        else if(state is ConnectivityNoNetworkState){
          return const Scaffold(
            body: Text("No Internet Connection"),
          );
        }
        else if(state is ConnectivityErrorState){
          return const Scaffold(
            body:  Text("You are Fucked Up"),
          );
        }
        else if(state is ConnectivityInitialState){
          return  const Center(child:  CircularProgressIndicator());
        }
        else{
          return Container();
        }
      },

    );
  }
}
