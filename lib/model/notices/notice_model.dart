class NoticeModel {
  final String noticeHeading;
  final String noticeBody;
  final String filePath;
  final String noticeExpiryDate;
  final String author;
  NoticeModel(
      {required this.noticeBody,
      required this.author,
      required this.filePath,
      required this.noticeExpiryDate,
      required this.noticeHeading});
  factory NoticeModel.fromJSON(dynamic json) => NoticeModel(
      noticeBody: json['noticeBody'].toString(),
      author: json['addedBy'].toString(),
      filePath: json['noticeFilePath'].toString(),
      noticeExpiryDate: json['noticeExpiryDate'].toString(),
      noticeHeading: json['noticeHeading'].toString());
}
