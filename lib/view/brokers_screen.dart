import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/broker/bloc.dart';
import 'package:nepse/model/broker/broker_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BrokersScreen extends StatefulWidget {
  static const String routeName = "/broker_screen";
  const BrokersScreen({Key? key}) : super(key: key);

  @override
  State<BrokersScreen> createState() => _BrokersScreenState();
}

class _BrokersScreenState extends State<BrokersScreen> {
  void getData({int indexingPage = 1}) {
    BlocProvider.of<BrokerBloc>(context).add(const FetchBroker());
  }
  makeCall(String phoneNumber) async{
    print("check");
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());

  }
  openWebSite(String url) async{
    if (!await launch(
      "https://"+url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brokers"),
      ),
      body: BlocBuilder<BrokerBloc, BrokerState>(builder: (context, state) {
        if (state is BrokerLoaded) {
          List<BrokerModel> data = state.brokerList.brokerList;
          return brokerData(context, data);
        } else if (state is BrokerError) {
          return const Text("Error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget brokerData(BuildContext context, List<BrokerModel> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.64,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            data[index].memberName,
                            softWrap: true,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Broker Code: " +
                                  data[index].memberCode.toString()),
                              Text("Status: " + data[index].activeStatus),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              makeCall(data[index].contactNo);
                            },
                            icon: const Icon(Icons.phone)),
                        IconButton(
                            onPressed: () {
                              openWebSite(data[index].url);
                            },
                            icon: const Icon(Icons.vpn_lock_sharp)),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                color: Colors.grey,
              )
            ],
          );
        });
  }
}
