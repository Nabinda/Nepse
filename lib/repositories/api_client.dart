import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nepse/model/nepse_index_list.dart';

class ApiClient {
  final _baseUrl = 'http://192.168.2.7:3000';
  final http.Client httpClient;
  ApiClient({
    required this.httpClient,
  });
  Future<NepseIndexList> fetchNepseIndex() async {
    final url = '$_baseUrl/nepse-index-chart';
    final response = await httpClient.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Error getting Index');
    }
    final json = jsonDecode(response.body);
    NepseIndexList _nepse = NepseIndexList.fromJSON(json);
    return _nepse;
  }
}
