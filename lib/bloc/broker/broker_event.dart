import 'package:equatable/equatable.dart';

abstract class BrokerEvent extends Equatable {
  const BrokerEvent();
}

class FetchBroker extends BrokerEvent {
  const FetchBroker();

  @override
  List<Object> get props => [];
}
