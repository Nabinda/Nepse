import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  static const routeName = "/portfolio_screen";
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio"),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text("    Portfolio Summary    "),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              summary(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                  Text("    Holdings    "),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              holdings()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Portfolio',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget summary() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total Current Share Value',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Rs. 100000",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              const Text(
                "Rs. 1000",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        ));
  }

  Widget holdings() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(5.0),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        individualInfoCol('HDL', 'Unit: 10, LTP: 5000'),
                        individualInfoCol('Rs.5000', 'Rs. 100 ')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                textColor: Colors.red,
                collapsedTextColor: Colors.black,
                children: <Widget>[
                  individualInfoFullRow('Scrip', 'HDL'),
                  individualInfoFullRow('Investment', '50000'),
                  individualInfoFullRow('Today\'s Profit', '500'),
                  individualInfoFullRow('Profit Percentage', '3%'),
                  individualInfoFullRow('Overall Profit', '50000'),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }

  Widget individualInfoCol(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget individualInfoFullRow(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
