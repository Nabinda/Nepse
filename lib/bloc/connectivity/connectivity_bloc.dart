import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nepse/bloc/connectivity/connectivity_events.dart';
import 'package:nepse/bloc/connectivity/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvents, ConnectivityState> {
  ConnectivityBloc()
      : super(const ConnectivityInitialState()) {
    on<ConnectivityChangeEvent>(getConnectivityStatus);
  }

  getConnectivityStatus(ConnectivityChangeEvent event,
      Emitter<ConnectivityState> emitter) {
    try {
      Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          emitter(const ConnectivityNoNetworkState());
        }
        else {
          emitter(const ConnectivityHasInternetState());
        }
      });
    } catch (e){
      emitter(const ConnectivityErrorState());
    }
  }
}

