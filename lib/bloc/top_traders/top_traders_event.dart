import 'package:equatable/equatable.dart';

abstract class TopTradersEvent extends Equatable {
  const TopTradersEvent();
}

class FetchTopGainers extends TopTradersEvent {
  final int pageNumber;
  const FetchTopGainers({required this.pageNumber});

  @override
  List<Object> get props => [];
}
class FetchTopLosers extends TopTradersEvent {
  final int pageNumber;
  const FetchTopLosers({required this.pageNumber});

  @override
  List<Object> get props => [];
}
class FetchTopTurnOver extends TopTradersEvent {
  final int pageNumber;
  const FetchTopTurnOver({required this.pageNumber});

  @override
  List<Object> get props => [];
}
class FetchTopVolume extends TopTradersEvent {
  final int pageNumber;
  const FetchTopVolume({required this.pageNumber});

  @override
  List<Object> get props => [];
}
class FetchTopTransactions extends TopTradersEvent {
  final int pageNumber;
  const FetchTopTransactions({required this.pageNumber});

  @override
  List<Object> get props => [];
}
