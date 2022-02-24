import 'package:nepse/model/todays_price/todays_price_list.dart';
import 'package:nepse/repositories/api_client.dart';

class TodaysPriceRepositories{
  ApiClient todaysPriceApiClient = ApiClient();
  Future<TodaysPriceList> fetchTodaysPrice({int pageNumber = 1}) async{
    return await todaysPriceApiClient.fetchTodaysPrice(pageNumber: pageNumber);
  }
}
