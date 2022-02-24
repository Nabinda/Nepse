import 'broker_model.dart';

class BrokerList{
  final List<BrokerModel> brokerList;
  BrokerList({required this.brokerList});
  factory BrokerList.fromJSON(List<dynamic> json) {
    List<BrokerModel> brokerList = <BrokerModel>[];
    for (var post in json) {
      brokerList.add(BrokerModel.fromJSON(post));
    }
    return BrokerList(
      brokerList: brokerList,
    );
  }
}