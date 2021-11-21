import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nepse/model/nepse_index_list.dart';
import 'package:nepse/model/nepse_index_model.dart';

class ApiClient {
  final _baseUrl = 'http://localhost:3000';
  final http.Client httpClient;
  ApiClient({
    required this.httpClient,
  });
  Future<NepseIndexList> fetchNepseIndex() async {
    final url = '$_baseUrl/nepse-index-chart';
    final response = await httpClient.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Error getting Index');
    }

    final json = jsonDecode(response.body);
    return  NepseIndexList.fromJson(json);
  }
}
