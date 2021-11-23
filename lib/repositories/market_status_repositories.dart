import 'package:nepse/model/market_status/market_status_model.dart';
import 'package:nepse/repositories/api_client.dart';

class MarketStatusRepositories{
  final ApiClient apiClient;
  MarketStatusRepositories({required this.apiClient});
  Future<MarketStatusModel> fetchMarketStatus() async{
    return await apiClient.fetchMarketStatus();
  }
}
