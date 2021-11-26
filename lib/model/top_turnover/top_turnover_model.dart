class TopTurnOverModel {
  final int securityId;
  final String symbol;
  final double turnover;
  final double ltp;
  final String securityName;
  TopTurnOverModel(
      {required this.securityId,
        required this.symbol,
        required this.turnover,
        required this.ltp,
        required this.securityName});
  factory TopTurnOverModel.fromJSON(var json) => TopTurnOverModel(
      securityId: json["securityId"].toInt(),
      symbol: json["symbol"].toString(),
      turnover: json["turnover"].toDouble(),
      ltp: json["closingPrice"].toDouble(),
      securityName: json["securityName"].toString());
}
