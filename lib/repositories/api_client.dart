import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nepse/model/nepse_index/nepse_index_list.dart';
import 'package:nepse/model/market_summary/nepse_market_summary.dart';
import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';

class ApiClient {
  final _baseUrl = 'http://192.168.2.7:3000';
  final http.Client httpClient;
  ApiClient({
    required this.httpClient,
  });
  Future<NepseIndexList> fetchNepseIndex() async {
    final url = '$_baseUrl/nepse-index-chart';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    NepseIndexList _nepse = NepseIndexList.fromJSON(json);
    return _nepse;
  }
  Future<NepseMarketSummaryList> fetchMarketSummary() async {
    final url = '$_baseUrl/market-summmary';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    NepseMarketSummaryList list = NepseMarketSummaryList.fromJSON(json);
    return list;
  }
}
