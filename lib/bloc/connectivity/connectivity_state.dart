import 'package:equatable/equatable.dart';

 abstract class ConnectivityState extends Equatable{
   const ConnectivityState();
  @override
  List<Object> get props => [];
}
class ConnectivityNoNetworkState extends ConnectivityState {
  const ConnectivityNoNetworkState();
}
class ConnectivityInitialState extends ConnectivityState {
  const ConnectivityInitialState();
}
class ConnectivityErrorState extends ConnectivityState {
  const ConnectivityErrorState();
}
class ConnectivityHasInternetState extends ConnectivityState{
   const ConnectivityHasInternetState();
}
