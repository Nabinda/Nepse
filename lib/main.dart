import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/connectivity/bloc.dart';
import 'package:nepse/bloc/nepse_index_chart/bloc.dart';
import 'package:nepse/repositories/api_client.dart';
import 'package:nepse/repositories/nepse_index_repositories.dart';
import 'package:nepse/view/landing_screen.dart';

void main() {
  final NepseIndexRepositories repository = NepseIndexRepositories(
    nepseIndexApiClient: ApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(
    nepseIndexRepositories: repository,
  ));
}

class MyApp extends StatelessWidget {
  final NepseIndexRepositories nepseIndexRepositories;
  const MyApp({Key? key, required this.nepseIndexRepositories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NepseIndexBloc>(
            create: (_) =>
                NepseIndexBloc(nepseIndexRepositories: nepseIndexRepositories))
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

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      bloc: ConnectivityBloc(),
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
        else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
