import 'package:equatable/equatable.dart';
import 'package:nepse/model/nepse_index_list.dart';

abstract class NepseIndexState extends Equatable {
  const NepseIndexState();

  @override
  List<Object> get props => [];
}
//Empty State
class NepseIndexEmpty extends NepseIndexState {}
//Loading State
class NepseIndexLoading extends NepseIndexState {}
//Loaded State
class NepseIndexLoaded extends NepseIndexState {
  final NepseIndexList nepseIndex;

  const NepseIndexLoaded({required this.nepseIndex});

  @override
  List<Object> get props => [nepseIndex];
}
//Error State
class NepseIndexError extends NepseIndexState {
}
