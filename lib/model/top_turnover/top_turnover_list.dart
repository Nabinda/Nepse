import 'package:nepse/model/top_turnover/top_turnover_model.dart';

class TopTurnOverList{
  final List<TopTurnOverModel> topTurnOverList;
  TopTurnOverList({required this.topTurnOverList});
  factory TopTurnOverList.fromJSON(List<dynamic> json) {
    List<TopTurnOverModel> topTurnOverList = <TopTurnOverModel>[];
    for (var post in json) {
      topTurnOverList.add(TopTurnOverModel.fromJSON(post));
    }
    return TopTurnOverList(
      topTurnOverList: topTurnOverList,
    );
  }
}
