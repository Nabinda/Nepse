import 'package:nepse/model/top_traders/top_traders_list.dart';

import 'api_client.dart';

class TopTradersRepositories{
  ApiClient apiClient = ApiClient();
  //Top Gainers
  Future<TopTradersList> fetchTopGainers({int pageNumber = 1}) async{
    String path = "/top-gainers";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }
  //Top Losers
  Future<TopTradersList> fetchTopLosers() async{
    String path = "/top-losers";
    return await apiClient.fetchTopTraders(path);
  }
  //Top TurnOvers
  Future<TopTradersList> fetchTopTurnOvers() async{
    String path = "/top-turnover";
    return await apiClient.fetchTopTraders(path);
  }
  //Top Volume
  Future<TopTradersList> fetchTopVolume() async{
    String path = "/top-volume";
    return await apiClient.fetchTopTraders(path);
  }

  //Top Transaction
  Future<TopTradersList> fetchTopTransaction() async{
    String path = "/top-transaction";
    return await apiClient.fetchTopTraders(path);
  }
}
