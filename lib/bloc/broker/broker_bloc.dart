import 'package:bloc/bloc.dart';
import '../../model/broker/broker_list.dart';
import '../../repositories/broker_repositories.dart';
import 'broker_event.dart';
import 'broker_state.dart';

class BrokerBloc extends Bloc<BrokerEvent, BrokerState> {
  BrokerRepositories brokerRepositories = BrokerRepositories();
  BrokerBloc() : super(BrokerEmpty()) {
    on<FetchBroker>(onFetchBroker);
  }

  Future<void> onFetchBroker(
      FetchBroker event,
      Emitter<BrokerState> emit,
      ) async {
    try {
      emit(BrokerLoading());
      final BrokerList brokerModel =
      await brokerRepositories.fetchBroker();
      emit(BrokerLoaded(brokerList: brokerModel));
    } catch (e) {
      emit(BrokerError());
    }
  }
}
