import 'package:nepse/model/top_transaction/top_transaction_model.dart';

class TopTransactionList{
  final List<TopTransactionModel> topTransactionList;
  TopTransactionList({required this.topTransactionList});
  factory TopTransactionList.fromJSON(List<dynamic> json) {
    List<TopTransactionModel> topTransactionList = <TopTransactionModel>[];
    for (var post in json) {
      topTransactionList.add(TopTransactionModel.fromJSON(post));
    }
    return TopTransactionList(
      topTransactionList: topTransactionList,
    );
  }
}
