import 'package:equatable/equatable.dart';

abstract class NepseIndexEvent extends Equatable {
  const NepseIndexEvent();
}

class FetchNepseIndex extends NepseIndexEvent {
  const FetchNepseIndex();

  @override
  List<Object> get props => [];
}
