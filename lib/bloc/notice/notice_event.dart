import 'package:equatable/equatable.dart';

abstract class NoticeEvent extends Equatable {
  const NoticeEvent();
}

class FetchNotice extends NoticeEvent {
  const FetchNotice();

  @override
  List<Object> get props => [];
}
