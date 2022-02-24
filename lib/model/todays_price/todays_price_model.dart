class TodaysPriceModel {
  final int id;
  final String businessDate;
  final int securityId;
  final String symbol;
  final String securityName;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double closePrice;
  final int totalTradedQuantity;
  final int totalTradedValue;
  final double previousDayClosePrice;
  final double fiftyTwoWeekHigh;
  final double fiftyTwoWeekLow;
  final String lastUpdatedTime;
  final double lastUpdatedPrice;
  final int totalTrades;
  final double averageTradedPrice;
  final double marketCapitalization;
  TodaysPriceModel(
      {required this.id,
      required this.businessDate,
      required this.securityId,
      required this.symbol,
      required this.securityName,
      required this.openPrice,
      required this.highPrice,
      required this.lowPrice,
      required this.closePrice,
      required this.totalTradedQuantity,
      required this.totalTradedValue,
      required this.previousDayClosePrice,
      required this.fiftyTwoWeekHigh,
      required this.fiftyTwoWeekLow,
      required this.lastUpdatedTime,
      required this.lastUpdatedPrice,
      required this.totalTrades,
      required this.averageTradedPrice,
      required this.marketCapitalization});

  factory TodaysPriceModel.fromJSON(dynamic json) {
    return TodaysPriceModel(
        id: json['id'].toInt(),
        businessDate: json['businessDate'].toString(),
        securityId: json['securityId'].toInt(),
        symbol: json['symbol'].toString(),
        securityName: json['securityName'].toString(),
        openPrice: json['openPrice'].toDouble(),
        highPrice: json['highPrice'].toDouble(),
        lowPrice: json['lowPrice'].toDouble(),
        closePrice: 0.0,
        totalTradedQuantity: json['totalTradedQuantity'].toInt(),
        totalTradedValue: json['totalTradedValue'].toInt(),
        previousDayClosePrice: json['previousDayClosePrice'].toDouble(),
        fiftyTwoWeekHigh: json['fiftyTwoWeekHigh'].toDouble(),
        fiftyTwoWeekLow: json['fiftyTwoWeekLow'].toDouble(),
        lastUpdatedTime: json['lastUpdatedTime'].toString(),
        lastUpdatedPrice: json['lastUpdatedPrice'].toDouble(),
        totalTrades: json['totalTrades'].toInt(),
        averageTradedPrice: 0.0,
        marketCapitalization: 0.0);
  }
}
