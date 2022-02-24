import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/broker/bloc.dart';
import 'package:nepse/bloc/company/company_bloc.dart';
import 'package:nepse/bloc/connectivity/bloc.dart';
import 'package:nepse/bloc/floor_sheet/bloc.dart';
import 'package:nepse/bloc/market_summary/bloc.dart';
import 'package:nepse/bloc/nepse_index_chart/bloc.dart';
import 'package:nepse/bloc/notice/bloc.dart';
import 'package:nepse/bloc/todays_price/bloc.dart';
import 'package:nepse/bloc/top_traders/bloc.dart';
import 'package:nepse/utils/routes.dart';
import 'package:nepse/view/landing_screen.dart';
import 'bloc/market_status/market_status_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NepseIndexBloc>(create: (_) => NepseIndexBloc()),
        BlocProvider<ConnectivityBloc>(create: (_) => ConnectivityBloc()),
        BlocProvider<MarketSummaryBloc>(create: (_) => MarketSummaryBloc()),
        BlocProvider<MarketStatusBloc>(create: (_) => MarketStatusBloc()),
        BlocProvider<TopTradersBloc>(create: (_) => TopTradersBloc()),
        BlocProvider<TodaysPriceBloc>(create: (_) => TodaysPriceBloc()),
        BlocProvider<FloorSheetBloc>(create: (_) => FloorSheetBloc()),
        BlocProvider<BrokerBloc>(create: (_) => BrokerBloc()),
        BlocProvider<NoticeBloc>(create: (_) => NoticeBloc()),
        BlocProvider<CompanyBloc>(create: (_) => CompanyBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nepse',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Nepse'),
        routes: Routes.routes,
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
    BlocProvider.of<ConnectivityBloc>(context)
        .add(const StartConnectivityEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityHasInternetState) {
          //return const LoginScreen();
          return const Scaffold(body: LandingScreen());
        } else if (state is ConnectivityNoNetworkState) {
          return const Scaffold(
            body: Text("No Internet Connection"),
          );
        } else if (state is ConnectivityErrorState) {
          return const Scaffold(
            body: Text("You are Fucked Up"),
          );
        } else if (state is ConnectivityInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
