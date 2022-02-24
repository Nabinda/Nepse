class CompanyModel {
  final String symbol;
  final String companyName;
  final String companyEmail;
  final String sectorName;
  final String instrumentType;
  final String status;
  CompanyModel(
      {required this.symbol,
      required this.status,
      required this.companyEmail,
      required this.companyName,
      required this.instrumentType,
      required this.sectorName});
  factory CompanyModel.fromJSON(dynamic json) => CompanyModel(
      symbol: json['symbol'].toString(),
      status: json['status'].toString(),
      companyEmail: json['companyEmail'].toString(),
      companyName: json['companyName'].toString(),
      instrumentType: json['instrumentType'].toString(),
      sectorName: json['sectorName'].toString() );
}
