class TopVolumeModel {
  final int securityId;
  final String symbol;
  final int shareTraded;
  final double ltp;
  final String securityName;
  TopVolumeModel(
      {required this.securityId,
        required this.symbol,
        required this.shareTraded,
        required this.ltp,
        required this.securityName});
  factory TopVolumeModel.fromJSON(var json) => TopVolumeModel(
      securityId: json["securityId"].toInt(),
      symbol: json["symbol"].toString(),
      shareTraded: json["shareTraded"],
      ltp: json["closingPrice"].toDouble(),
      securityName: json["securityName"].toString());
}
