import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:nepse/model/broker/broker_list.dart';
import 'package:nepse/model/floor_sheet/floor_sheet_list.dart';
import 'package:nepse/model/market_status/market_status_model.dart';
import 'package:nepse/model/nepse_index/nepse_index_list.dart';
import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';
import 'package:nepse/model/todays_price/todays_price_list.dart';
import 'package:nepse/model/top_traders/top_traders_list.dart';
import 'package:nepse/model/top_transaction/top_transaction_list.dart';
import 'package:nepse/model/top_turnover/top_turnover_list.dart';
import 'package:nepse/model/top_volume/top_volume_list.dart';

class ApiClient {
  final _baseUrl = 'https://nepse.minsomai.com.np';
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
  // // Top Gainers
  // Future<TopTradersList> fetchTopGainers() async {
  //   final url = '$_baseUrl/top-gainers';
  //   final response = await httpClient.get(Uri.parse(url));
  //   if (response.statusCode != 200) {
  //     print(response.statusCode);
  //   }
  //   final json = jsonDecode(response.body);
  //   TopTradersList topTradersList = TopTradersList.fromJSON(json);
  //   return topTradersList;
  // }
  // //Top Losers
  // Future<TopTradersList> fetchTopLosers() async {
  //   final url = '$_baseUrl/top-losers';
  //   final response = await httpClient.get(Uri.parse(url));
  //   if (response.statusCode != 200) {
  //     print(response.statusCode);
  //   }
  //   final json = jsonDecode(response.body);
  //   TopTradersList topTradersList = TopTradersList.fromJSON(json);
  //   return topTradersList;
  // }
  //Top TurnOvers
  Future<TopTurnOverList> fetchTopTurnOvers({int pageNumber =1}) async {
    final url = '$_baseUrl/top-turnover?_page=$pageNumber&_limit=20';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTurnOverList topTurnOverList = TopTurnOverList.fromJSON(json);
    return topTurnOverList;
  }
  //Top Volume
  Future<TopVolumeList> fetchTopVolume({int pageNumber =1}) async {
    final url = '$_baseUrl/top-volume?_page=$pageNumber&_limit=20';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopVolumeList topVolumeList = TopVolumeList.fromJSON(json);
    return topVolumeList;
  }
  //Top Transaction
  Future<TopTransactionList> fetchTopTransaction({int pageNumber =1}) async {
    final url = '$_baseUrl/top-transaction?_page=$pageNumber&_limit=20';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TopTransactionList topTransactionList = TopTransactionList.fromJSON(json);
    return topTransactionList;
  }
  //Todays Price
  Future<TodaysPriceList> fetchTodaysPrice({int pageNumber =1}) async {
    final url = '$_baseUrl/todays-price?_page=$pageNumber&_limit=20';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    TodaysPriceList todaysPriceList = TodaysPriceList.fromJSON(json);
    return todaysPriceList;
  }
  //Todays Price
  Future<FloorSheetList> fetchFloorSheet({int pageNumber =1}) async {
    final url = '$_baseUrl/floorsheets?_page=$pageNumber&_limit=20';
    final response = await httpClient.get(Uri.parse(url));
    print(response.headers);
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    FloorSheetList floorSheetList = FloorSheetList.fromJSON(json);
    return floorSheetList;
  }
  //Todays Price
  Future<BrokerList> fetchBroker() async {
    final url = '$_baseUrl/brokers';
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print(response.statusCode);
    }
    final json = jsonDecode(response.body);
    BrokerList brokerList = BrokerList.fromJSON(json);
    return brokerList;
  }

}
