import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/blocs/auth_bloc/auth.dart';
import 'package:flutter/material.dart';
import 'package:nepse/widgets/graph.dart';
import 'package:nepse/widgets/information.dart';
import 'package:nepse/widgets/market_summary.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nepse"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MarketSummary(),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Flex(
                    direction: Axis.horizontal,
                    children: const [Expanded(child: CustomGraph())])),
            const Information()
          ],
        ),
      ),
    );
  }
}
