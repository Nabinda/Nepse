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
import 'package:nepse/blocs/auth_bloc/auth.dart';
import 'package:nepse/utils/routes.dart';
import 'package:nepse/view/landing_screen.dart';
import 'package:nepse/view/login.dart';
import 'bloc/market_status/market_status_bloc.dart';
import 'repositories/repositories.dart';

void main() {
  final userRepository = UserRepository();
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (_) => AuthenticationBloc(userRepository: userRepository)),
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
        home : BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: userRepository)
              ..add(AppStarted());
          },
          child: MyHomePage(title: 'Nepse', userRepository: userRepository),
        ),
        routes: Routes.routes,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final UserRepository userRepository;
  final String title;

  const MyHomePage({Key? key, required this.title, required this.userRepository}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(userRepository);
}

class _MyHomePageState extends State<MyHomePage> {
  final UserRepository userRepository;
  _MyHomePageState(this.userRepository);

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
          return Scaffold(body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is AuthenticationAuthenticated) {
                  return const LandingScreen();
                }
                if (state is AuthenticationUnauthenticated) {
                  return LoginScreen(userRepository: userRepository);
                }

                if (state is AuthenticationLoading) {
                  return Scaffold(
                    body: Container(
                      color: Colors.white,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            height: 25.0,
                            width: 25.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.green),
                              strokeWidth: 4.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Scaffold(
                  body: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                            strokeWidth: 4.0,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }));
          // LoginScreen(userRepository: userRepository));
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
