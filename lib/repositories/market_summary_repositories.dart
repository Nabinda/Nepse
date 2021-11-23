import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';
import 'package:nepse/repositories/api_client.dart';

class MarketSummaryRepositories{
  final ApiClient apiClient;
  MarketSummaryRepositories({required this.apiClient});
  Future<NepseMarketSummaryList> fetchMarketSummary() async{
    return await apiClient.fetchMarketSummary();
  }
}
