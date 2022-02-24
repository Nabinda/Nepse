import 'package:flutter/material.dart';

class BrokersScreen extends StatefulWidget {
  static const String routeName = "/broker_screen";
  const BrokersScreen({Key? key}) : super(key: key);

  @override
  State<BrokersScreen> createState() => _BrokersScreenState();
}

class _BrokersScreenState extends State<BrokersScreen> {
  List<String> myList = [
    'a',
    'b',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brokers"),
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Brokers Name',
                            style: TextStyle(fontSize: 20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Brokers Address'),
                              Text(myList[index]),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.phone))
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
          }),
    );
  }
}
