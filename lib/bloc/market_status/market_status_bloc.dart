import 'package:bloc/bloc.dart';
import 'package:nepse/model/market_status/market_status_model.dart';
import 'package:nepse/repositories/market_status_repositories.dart';
import 'market_status_event.dart';
import 'market_status_state.dart';

class MarketStatusBloc extends Bloc<MarketStatusEvent, MarketStatusState> {
  final MarketStatusRepositories marketStatusRepositories;
  MarketStatusBloc({required this.marketStatusRepositories})
      : super(MarketStatusEmpty()) {
    on<FetchMarketStatus>(onFetchMarketStatus);
  }

  Future<void> onFetchMarketStatus(
      FetchMarketStatus event,
      Emitter<MarketStatusState> emit,
      ) async {
    try {
      emit(MarketStatusLoading());
      final MarketStatusModel marketStatus =
      await marketStatusRepositories.fetchMarketStatus();
      emit(MarketStatusLoaded(marketStatus: marketStatus));
    } catch (e) {
      emit(MarketStatusError());
    }
  }
}
