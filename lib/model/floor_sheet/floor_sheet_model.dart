class FloorSheetModel {
  final String contractId;
  final String stockSymbol;
  final String buyerMemberId;
  final String sellerMemberId;
  final String contractQuantity;
  final String contractRate;
  final String contractAmount;
  final String businessDate;
  final String traceBookId;
  final String stockId;
  final String buyerBrokerName;
  final String sellerBrokerName;
  final String tradeTime;
  final String securityName;
  FloorSheetModel(
      {required this.contractId,
      required this.stockSymbol,
      required this.buyerMemberId,
      required this.sellerMemberId,
      required this.securityName,
      required this.businessDate,
      required this.buyerBrokerName,
      required this.contractAmount,
      required this.contractQuantity,
      required this.contractRate,
      required this.sellerBrokerName,
      required this.stockId,
      required this.traceBookId,
      required this.tradeTime});
  factory FloorSheetModel.fromJSON(dynamic json) {
    return FloorSheetModel(
        contractId: json['contractId'].toString(),
        stockSymbol: json['stockSymbol'].toString(),
        buyerMemberId: json['buyerMemberId'].toString(),
        sellerMemberId: json['sellerMemberId'].toString(),
        contractQuantity: json['contractQuantity'].toString(),
        contractRate: json['contractRate'].toString(),
        contractAmount: json['contractAmount'].toString(),
        businessDate: json['businessDate'].toString(),
        traceBookId: json['tradeBookId'].toString(),
        stockId: json['stockId'].toString(),
        buyerBrokerName: json['buyerBrokerName'].toString(),
        sellerBrokerName: json['sellerBrokerName'].toString(),
        tradeTime: json['tradeTime'].toString(),
        securityName: json['securityName'].toString(),
      );}
}
