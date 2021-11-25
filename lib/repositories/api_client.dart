import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:nepse/model/market_status/market_status_model.dart';
import 'package:nepse/model/nepse_index/nepse_index_list.dart';
import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';
import 'package:nepse/model/top_traders/top_traders_list.dart';

class ApiClient {
  final _baseUrl = 'http://192.168.2.7:3000';
  Client httpClient = Client();
  //Nepse Index
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
  //Market Summary
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
  //MarketStatus
  Future<MarketStatusModel> fetchMarketStatus() async {
    final url = '$_baseUrl/market-open';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    MarketStatusModel marketStatus = MarketStatusModel.fromJSON(json);
    return marketStatus;
  }
  //------------------Top Traders---------------
  Future<TopTradersList> fetchTopTraders(String path, {int pageNumber =1}) async {
    final url = _baseUrl+path+"?_page=$pageNumber&_limit=20";
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTradersList topTradersList = TopTradersList.fromJSON(json);
    return topTradersList;
  }
  // Top Gainers
  Future<TopTradersList> fetchTopGainers() async {
    final url = '$_baseUrl/top-gainers';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTradersList topTradersList = TopTradersList.fromJSON(json);
    return topTradersList;
  }
  //Top Losers
  Future<TopTradersList> fetchTopLosers() async {
    final url = '$_baseUrl/top-losers';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTradersList topTradersList = TopTradersList.fromJSON(json);
    return topTradersList;
  }
  //Top TurnOvers
  Future<TopTradersList> fetchTopTurnOvers() async {
    final url = '$_baseUrl/top-turnover';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTradersList topTradersList = TopTradersList.fromJSON(json);
    return topTradersList;
  }
  //Top Volume
  Future<TopTradersList> fetchTopVolume() async {
    final url = '$_baseUrl/top-volume';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTradersList topTradersList = TopTradersList.fromJSON(json);
    return topTradersList;
  }
  //Top Transaction
  Future<TopTradersList> fetchTopTransaction() async {
    final url = '$_baseUrl/top-transaction';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTradersList topTradersList = TopTradersList.fromJSON(json);
    return topTradersList;
  }

}
