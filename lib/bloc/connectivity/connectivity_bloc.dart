import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nepse/bloc/connectivity/connectivity_events.dart';
import 'package:nepse/bloc/connectivity/connectivity_state.dart';
class ConnectivityBloc extends Bloc<ConnectivityEvents, ConnectivityState> {
  final Connectivity connectivity;
  ConnectivityBloc({required this.connectivity})
      : super(const ConnectivityInitialState()) {
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
          }
          else {
            emitter(const ConnectivityHasInternetState());
          }
        },
      );
    } catch (e) {
      emitter(const ConnectivityErrorState());
    }
  }
  //
  // Future<bool> checkInternetStatus() async{
  //   try{
  //     final result = await InternetAddress.lookup('www.google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       return true;
  //     }else{
  //       return false;
  //     }
  //   }on SocketException catch(_){
  //       return false;
  //   }
  // }
}
