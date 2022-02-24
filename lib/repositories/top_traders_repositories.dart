import 'package:nepse/model/top_traders/top_traders_list.dart';
import 'package:nepse/model/top_transaction/top_transaction_list.dart';
import 'package:nepse/model/top_turnover/top_turnover_list.dart';
import 'package:nepse/model/top_volume/top_volume_list.dart';

import 'api_client.dart';

class TopTradersRepositories{
  ApiClient apiClient = ApiClient();
  //Top Gainers
  Future<TopTradersList> fetchTopGainers({int pageNumber = 1}) async{
    String path = "/top-gainers";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }
  //Top Losers
  Future<TopTradersList> fetchTopLosers({int pageNumber = 1}) async{
    String path = "/top-losers";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }
  //Top TurnOvers
  Future<TopTurnOverList> fetchTopTurnOvers({int pageNumber = 1}) async{
    return await apiClient.fetchTopTurnOvers(pageNumber: pageNumber);
  }
  //Top Volume
  Future<TopVolumeList> fetchTopVolume({int pageNumber = 1}) async{
    return await apiClient.fetchTopVolume(pageNumber: pageNumber);
  }

  //Top Transaction
  Future<TopTransactionList> fetchTopTransaction({int pageNumber = 1}) async{
    return await apiClient.fetchTopTransaction(pageNumber: pageNumber);
  }
}
