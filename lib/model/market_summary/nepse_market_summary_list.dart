import 'package:nepse/model/market_summary/nepse_market_summary.dart';

class NepseMarketSummaryList{
  final List<NepseMarketSummary> nepseMarketSummaryList;
  NepseMarketSummaryList({required this.nepseMarketSummaryList});
  factory NepseMarketSummaryList.fromJSON(List<dynamic> json) {
    List<NepseMarketSummary> marketSummaryList = <NepseMarketSummary>[];
    for (var post in json) {
      marketSummaryList.add(NepseMarketSummary.fromJSON(post));
    }
    return NepseMarketSummaryList(
      nepseMarketSummaryList: marketSummaryList,
    );
  }
}
