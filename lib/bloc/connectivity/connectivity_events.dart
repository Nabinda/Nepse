import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectivityEvents extends Equatable{
  const ConnectivityEvents();

  @override
  List<Object> get props => [];
}
class ConnectivityChangeEvent extends ConnectivityEvents{
  final ConnectivityResult connectivityResult;
  const ConnectivityChangeEvent(this.connectivityResult);
  @override
  List<Object> get props => [connectivityResult];
}
