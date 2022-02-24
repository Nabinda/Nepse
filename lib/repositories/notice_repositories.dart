import 'package:nepse/repositories/api_client.dart';
import '../model/notices/notice_list.dart';

class NoticeRepositories{
  ApiClient noticeApiClient = ApiClient();
  Future<NoticeList> fetchNotice() async{
    return await noticeApiClient.fetchNotice();
  }
}
