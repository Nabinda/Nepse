import 'package:nepse/model/todays_price/todays_price_model.dart';

class TodaysPriceList{
  final List<TodaysPriceModel> todaysPriceList;
  TodaysPriceList({required this.todaysPriceList});
  factory TodaysPriceList.fromJSON(List<dynamic> json) {
    List<TodaysPriceModel> todaysPriceList = <TodaysPriceModel>[];
    for (var post in json) {
      todaysPriceList.add(TodaysPriceModel.fromJSON(post));
    }
    return TodaysPriceList(
      todaysPriceList: todaysPriceList,
    );
  }
}
