import 'package:nepse/model/nepse_index/nepse_index_list.dart';
import 'package:nepse/repositories/api_client.dart';

class NepseIndexRepositories {
  ApiClient nepseIndexApiClient = ApiClient();
  Future<NepseIndexList> fetchNepseIndexChart() async {
    return await nepseIndexApiClient.fetchNepseIndex();
  }
}
