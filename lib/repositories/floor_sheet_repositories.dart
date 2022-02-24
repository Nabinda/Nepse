import 'package:nepse/repositories/api_client.dart';
import '../model/floor_sheet/floor_sheet_list.dart';

class FloorSheetRepositories {
  ApiClient apiClient = ApiClient();
  Future<FloorSheetList> fetchFloorSheet({int pageNumber = 1}) async {
    return await apiClient.fetchFloorSheet(pageNumber: pageNumber);
  }
}
