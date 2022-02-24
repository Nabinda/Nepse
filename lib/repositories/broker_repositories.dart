import 'package:nepse/repositories/api_client.dart';
import '../model/broker/broker_list.dart';

class BrokerRepositories {
  ApiClient apiClient = ApiClient();
  Future<BrokerList> fetchBroker() async {
    return await apiClient.fetchBroker();
  }
}
