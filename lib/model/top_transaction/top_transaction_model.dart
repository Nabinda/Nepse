class TopTransactionModel {
  final int securityId;
  final String symbol;
  final int totalTrades;
  final double ltp;
  final String securityName;
  TopTransactionModel(
      {required this.securityId,
        required this.symbol,
        required this.totalTrades,
        required this.ltp,
        required this.securityName});
  factory TopTransactionModel.fromJSON(var json) => TopTransactionModel(
      securityId: json["securityId"].toInt(),
      symbol: json["symbol"].toString(),
      totalTrades: json["totalTrades"].toDouble(),
      ltp: json["lastTradedPrice"].toDouble(),
      securityName: json["securityName"].toString());
}
