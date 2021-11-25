class TopTradersModel {
  final int securityId;
  final String symbol;
  final double ltp;
  final double pointChange;
  final double percentageChange;
  final String securityName;
  TopTradersModel(
      {required this.securityId,
      required this.symbol,
      required this.ltp,
      required this.pointChange,
      required this.percentageChange,
      required this.securityName});
  factory TopTradersModel.fromJSON(var json) => TopTradersModel(
      securityId: json["securityId"].toInt(),
      symbol: json["symbol"].toString(),
      ltp: json["ltp"].toDouble(),
      pointChange: json["pointChange"].toDouble(),
      percentageChange: json["percentageChange"].toDouble(),
      securityName: json["securityName"].toString());
}
