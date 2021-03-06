import 'package:nepse/repositories/api_client.dart';
import '../model/company/company_list.dart';

class CompanyRepositories {
  ApiClient apiClient = ApiClient();
  Future<CompanyList> fetchCompany({int pageNumber = 1}) async {
    return await apiClient.fetchCompany(pageNumber: pageNumber);
  }
}
