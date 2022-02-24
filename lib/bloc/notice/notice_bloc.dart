import 'package:bloc/bloc.dart';

import '../../model/notices/notice_list.dart';
import '../../repositories/notice_repositories.dart';
import 'notice_event.dart';
import 'notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  NoticeRepositories noticeRepositories = NoticeRepositories();
  NoticeBloc() : super(NoticeEmpty()) {
    on<FetchNotice>(onFetchNotice);
  }

  Future<void> onFetchNotice(
      FetchNotice event,
      Emitter<NoticeState> emit,
      ) async {
    try {
      emit(NoticeLoading());
      final NoticeList noticeModel =
      await noticeRepositories.fetchNotice();
      emit(NoticeLoaded(notice: noticeModel));
    } catch (e) {
      emit(NoticeError());
    }
  }
}
