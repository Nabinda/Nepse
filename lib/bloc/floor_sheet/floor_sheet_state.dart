import 'package:equatable/equatable.dart';

import '../../model/floor_sheet/floor_sheet_list.dart';


abstract class FloorSheetState extends Equatable {
  const FloorSheetState();

  @override
  List<Object> get props => [];
}
//Empty State
class FloorSheetEmpty extends FloorSheetState {}
//Loading State
class FloorSheetLoading extends FloorSheetState {
}
//Loaded State
class FloorSheetLoaded extends FloorSheetState {
  final FloorSheetList floorSheet;

  const FloorSheetLoaded({required this.floorSheet});

  @override
  List<Object> get props => [floorSheet];
}
//Error State
class FloorSheetError extends FloorSheetState {
}
