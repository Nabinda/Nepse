class BrokerModel {
  final String activeStatus;
  final String memberCode;
  final String memberName;
  final String contactNo;
  final String url;
  BrokerModel(
      {required this.activeStatus,
      required this.memberCode,
      required this.memberName,
      required this.contactNo,
      required this.url});
  factory BrokerModel.fromJSON(dynamic json) {
    return BrokerModel(
        activeStatus: json['activeStatus'].toString(),
        memberCode: json['memberCode'].toString(),
        memberName: json['memberName'].toString(),
        contactNo: json['authorizedContactPersonNumber'].toString(),
        url: json['memberTMSLinkMapping']['tmsLink'].toString());
  }
}
