import 'package:nepse/model/top_traders/top_traders_model.dart';

class TopTradersList{
  final List<TopTradersModel> topTradersList;
  TopTradersList({required this.topTradersList});
  factory TopTradersList.fromJSON(List<dynamic> json) {
    List<TopTradersModel> topTradersList = <TopTradersModel>[];
    for (var post in json) {
      topTradersList.add(TopTradersModel.fromJSON(post));
    }
    return TopTradersList(
      topTradersList: topTradersList,
    );
  }
}
