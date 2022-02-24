import 'package:equatable/equatable.dart';

import '../../model/notices/notice_list.dart';

abstract class NoticeState extends Equatable {
  const NoticeState();

  @override
  List<Object> get props => [];
}
//Empty State
class NoticeEmpty extends NoticeState {}
//Loading State
class NoticeLoading extends NoticeState {
}
//Loaded State
class NoticeLoaded extends NoticeState {
  final NoticeList notice;

  const NoticeLoaded({required this.notice});

  @override
  List<Object> get props => [notice];
}
//Error State
class NoticeError extends NoticeState {
}
