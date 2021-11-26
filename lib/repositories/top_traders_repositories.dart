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
  Future<TopTradersList> fetchTopLosers({int pageNumber = 1}) async{
    String path = "/top-losers";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }
  //Top TurnOvers
  Future<TopTradersList> fetchTopTurnOvers({int pageNumber = 1}) async{
    String path = "/top-turnover";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }
  //Top Volume
  Future<TopTradersList> fetchTopVolume({int pageNumber = 1}) async{
    String path = "/top-volume";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }

  //Top Transaction
  Future<TopTradersList> fetchTopTransaction({int pageNumber = 1}) async{
    String path = "/top-transaction";
    return await apiClient.fetchTopTraders(path,pageNumber: pageNumber);
  }
}
