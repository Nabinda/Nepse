import 'package:flutter/cupertino.dart';
import 'package:nepse/view/brokers_screen.dart';
import 'package:nepse/view/company_screens.dart';
import 'package:nepse/view/corporate_disclosures.dart';
import 'package:nepse/view/floor_sheet_screen.dart';
import 'package:nepse/view/market_capitalization.dart';
import 'package:nepse/view/news_screen.dart';
import 'package:nepse/view/notice_screen.dart';
import 'package:nepse/view/portfolio_screen.dart';
import 'package:nepse/view/todays_price.dart';
import 'package:nepse/view/top_traders_screen.dart';
import 'package:nepse/view/watchlist_screen.dart';

class Routes{
  Routes._();
  static const String portfolio = PortfolioScreen.routeName;
  static const String watchlist = WatchListScreen.routeName;
  static const String corporateDisclosures = CorporateDisclosuresScreen.routeName;
  static const String brokers = BrokersScreen.routeName;
  static const String company = CompanyScreen.routeName;
  static const String floorSheet = FloorSheetScreen.routeName;
  static const String marketCapitalization = MarketCapitalizationScreen.routeName;
  static const String news = NewsScreen.routeName;
  static const String notice = NoticeScreen.routeName;
  static const String todayPrice = TodaysPriceScreen.routeName;
  static const String topTraders = TopTradersScreen.routeName;

  static final routes = <String, WidgetBuilder>{
    portfolio: (BuildContext context) => const PortfolioScreen(),
    watchlist: (BuildContext context) => const WatchListScreen(),
    corporateDisclosures: (BuildContext context) => const CorporateDisclosuresScreen(),
    brokers: (BuildContext context) => const BrokersScreen(),
    company: (BuildContext context) => const CompanyScreen(),
    floorSheet: (BuildContext context) => const FloorSheetScreen(),
    marketCapitalization: (BuildContext context) => const MarketCapitalizationScreen(),
    news: (BuildContext context) => const NewsScreen(),
    notice: (BuildContext context) => const NoticeScreen(),
    todayPrice: (BuildContext context) => const TodaysPriceScreen(),
    topTraders: (BuildContext context) => const TopTradersScreen(),
};
}
