import 'notice_model.dart';

class NoticeList {
  final List<NoticeModel> noticeList;
  NoticeList({required this.noticeList});
  factory NoticeList.fromJSON(List<dynamic> json) {
    List<NoticeModel> noticeList = <NoticeModel>[];
    for (var post in json) {
      noticeList.add(NoticeModel.fromJSON(post));
    }
    return NoticeList(
      noticeList: noticeList,
    );
  }
}
