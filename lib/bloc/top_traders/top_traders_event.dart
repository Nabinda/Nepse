import 'package:equatable/equatable.dart';

abstract class TopTradersEvent extends Equatable {
  const TopTradersEvent();
}

class FetchTopTraders extends TopTradersEvent {
  final int pageNumber;
   const FetchTopTraders({
   required this.pageNumber
});

  @override
  List<Object> get props => [];
}
