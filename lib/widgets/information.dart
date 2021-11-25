import 'package:flutter/material.dart';
import 'package:nepse/utils/routes.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your Information"),
          _yourInformationWidget(context),
          const Text("Market Information"),
          _marketInformationWidget(context),
          const Text("Updates"),
          _updatesInformationWidget(context)
        ],
      ),
    );
  }

  Widget informationItem(String text, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  text,
                ))
          ],
        ),
      ),
    );
  }

  Widget _yourInformationWidget(BuildContext context) {
    final List<InformationItem> _yourInformation = [
      InformationItem(
          text: "Portfolio", icon: Icons.person, route: Routes.portfolio),
      InformationItem(
          text: "Watchlist", icon: Icons.bookmarks, route: Routes.watchlist),
    ];
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 468 ? 5 : 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _yourInformation.length,
              itemBuilder: (context, index) {
                return informationItem(
                    _yourInformation[index].text,
                    _yourInformation[index].icon,
                    _yourInformation[index].route);
              });
        },
      ),
    );
  }

  Widget _marketInformationWidget(BuildContext context) {
    final List<InformationItem> _marketInformation = [
      InformationItem(
          text: "Today's Price",
          icon: Icons.attach_money,
          route: Routes.todayPrice),
      InformationItem(
          text: "Floor Sheet", icon: Icons.feed, route: Routes.floorSheet),
      InformationItem(
          text: "Top Traders",
          icon: Icons.show_chart,
          route: Routes.topTraders),
      InformationItem(
          text: "Company", icon: Icons.business, route: Routes.company),
      InformationItem(
          text: "Brokers", icon: Icons.people_alt, route: Routes.brokers),
      InformationItem(
          text: "Market Capitalization",
          icon: Icons.villa,
          route: Routes.marketCapitalization),
    ];
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 468 ? 5 : 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _marketInformation.length,
              itemBuilder: (context, index) {
                return informationItem(
                    _marketInformation[index].text,
                    _marketInformation[index].icon,
                    _marketInformation[index].route);
              });
        },
      ),
    );
  }

  Widget _updatesInformationWidget(BuildContext context) {
    final List<InformationItem> _updates = [
      InformationItem(text: "Notices", icon: Icons.event, route: Routes.notice),
      InformationItem(text: "News", icon: Icons.article, route: Routes.news),
      InformationItem(
          text: "Corporate Disclosures",
          icon: Icons.speaker_notes,
          route: Routes.corporateDisclosures),
    ];
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 468 ? 5 : 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _updates.length,
              itemBuilder: (context, index) {
                return informationItem(_updates[index].text,
                    _updates[index].icon, _updates[index].route);
              });
        },
      ),
    );
  }
}

class InformationItem {
  final String text;
  final IconData icon;
  final String route;
  InformationItem(
      {required this.text, required this.icon, required this.route});
}
