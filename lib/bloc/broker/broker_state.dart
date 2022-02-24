import 'package:equatable/equatable.dart';
import '../../model/broker/broker_list.dart';


abstract class BrokerState extends Equatable {
  const BrokerState();

  @override
  List<Object> get props => [];
}
//Empty State
class BrokerEmpty extends BrokerState {}
//Loading State
class BrokerLoading extends BrokerState {
}
//Loaded State
class BrokerLoaded extends BrokerState {
  final BrokerList brokerList;

  const BrokerLoaded({required this.brokerList});

  @override
  List<Object> get props => [brokerList];
}
//Error State
class BrokerError extends BrokerState {
}
