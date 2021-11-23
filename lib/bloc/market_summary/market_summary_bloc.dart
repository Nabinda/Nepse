import 'package:bloc/bloc.dart';
import 'package:nepse/bloc/market_summary/bloc.dart';
import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';
import 'package:nepse/repositories/market_summary_repositories.dart';

class MarketSummaryBloc extends Bloc<MarketSummaryEvent, MarketSummaryState> {
  final MarketSummaryRepositories marketSummaryRepositories;
  MarketSummaryBloc({required this.marketSummaryRepositories})
      : super(MarketSummaryEmpty()) {
    on<FetchMarketSummary>(onFetchMarketSummary);
  }

  Future<void> onFetchMarketSummary(
      FetchMarketSummary event,
      Emitter<MarketSummaryState> emit,
      ) async {
    try {
      emit(MarketSummaryLoading());
      final NepseMarketSummaryList nepseMarketSummaryList =
      await marketSummaryRepositories.fetchMarketSummary();
      emit(MarketSummaryLoaded(marketSummaryList: nepseMarketSummaryList));
    } catch (e) {
      emit(MarketSummaryError());
    }
  }
}
