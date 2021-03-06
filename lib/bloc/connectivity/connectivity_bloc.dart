import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nepse/bloc/connectivity/connectivity_events.dart';
import 'package:nepse/bloc/connectivity/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvents, ConnectivityState> {
  Connectivity connectivity = Connectivity();
  ConnectivityBloc() : super(const ConnectivityInitialState()) {
    on<StartConnectivityEvent>(startConnectivityStatus);
  }

  startConnectivityStatus(
      StartConnectivityEvent event, Emitter<ConnectivityState> emitter) async {
    try {
      emitter(const ConnectivityInitialState());
      await emitter.onEach<ConnectivityResult>(
        connectivity.onConnectivityChanged,
        onData: (data) {
          if (data == ConnectivityResult.none) {
            emitter(const ConnectivityNoNetworkState());
          } else {
            emitter(const ConnectivityHasInternetState());
          }
        },
      );
    } catch (e) {
      emitter(const ConnectivityErrorState());
    }
  }
}
