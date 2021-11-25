import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';
import 'package:nepse/repositories/api_client.dart';

class MarketSummaryRepositories{
  ApiClient apiClient = ApiClient();
  Future<NepseMarketSummaryList> fetchMarketSummary() async{
    return await apiClient.fetchMarketSummary();
  }
}
