import 'package:equatable/equatable.dart';

abstract class FloorSheetEvent extends Equatable {
  const FloorSheetEvent();
}

class FetchFloorSheet extends FloorSheetEvent {
  final int pageNumber;
  const FetchFloorSheet({required this.pageNumber});

  @override
  List<Object> get props => [];
}
