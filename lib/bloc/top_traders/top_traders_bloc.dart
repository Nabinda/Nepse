import 'package:bloc/bloc.dart';
import 'package:nepse/bloc/top_traders/top_traders_event.dart';
import 'package:nepse/bloc/top_traders/top_traders_state.dart';
import 'package:nepse/model/top_traders/top_traders_list.dart';
import 'package:nepse/model/top_transaction/top_transaction_list.dart';
import 'package:nepse/model/top_turnover/top_turnover_list.dart';
import 'package:nepse/model/top_volume/top_volume_list.dart';
import 'package:nepse/repositories/top_traders_repositories.dart';

class TopTradersBloc extends Bloc<TopTradersEvent, TopTradersState> {
  TopTradersRepositories topTradersRepositories =
  TopTradersRepositories();
  TopTradersBloc() : super(TopTradersEmpty()) {
    on<FetchTopGainers>(onFetchTopGainers);
    on<FetchTopLosers>(onFetchTopLosers);
    on<FetchTopTransactions>(onFetchTopTransactions);
    on<FetchTopVolume>(onFetchTopVolume);
    on<FetchTopTurnOver>(onFetchTopTurnOver);
  }

  Future<void> onFetchTopGainers(
      FetchTopGainers event,
      Emitter<TopTradersState> emit,
      ) async {
    try {
      emit(TopTradersLoading());
      final TopTradersList topTradersList =
      await topTradersRepositories.fetchTopGainers(pageNumber: event.pageNumber);
      emit(TopTradersLoaded(topTradersList: topTradersList));
    } catch (e) {
      emit(TopTradersError());
    }
  }
  Future<void> onFetchTopLosers(
      FetchTopLosers event,
      Emitter<TopTradersState> emit,
      ) async {
    try {
      emit(TopTradersLoading());
      final TopTradersList topTradersList =
      await topTradersRepositories.fetchTopLosers(pageNumber: event.pageNumber);
      emit(TopTradersLoaded(topTradersList: topTradersList));
    } catch (e) {
      emit(TopTradersError());
    }
  }
  Future<void> onFetchTopTransactions(
      FetchTopTransactions event,
      Emitter<TopTradersState> emit,
      ) async {
    try {
      emit(TopTradersLoading());
      final TopTransactionList topTransactionList =
      await topTradersRepositories.fetchTopTransaction(pageNumber: event.pageNumber);
      emit(TopTransactionLoaded(topTransactionList: topTransactionList));
    } catch (e) {
      emit(TopTradersError());
    }
  }
  Future<void> onFetchTopVolume(
      FetchTopVolume event,
      Emitter<TopTradersState> emit,
      ) async {
    try {
      emit(TopTradersLoading());
      final TopVolumeList topVolumeList =
      await topTradersRepositories.fetchTopVolume(pageNumber: event.pageNumber);
      emit(TopVolumeLoaded(topVolumeList: topVolumeList));
    } catch (e) {
      emit(TopTradersError());
    }
  }
  Future<void> onFetchTopTurnOver(
      FetchTopTurnOver event,
      Emitter<TopTradersState> emit,
      ) async {
    try {
      emit(TopTradersLoading());
      final TopTurnOverList topTurnOverList =
      await topTradersRepositories.fetchTopTurnOvers(pageNumber: event.pageNumber);
      emit(TopTurnOverLoaded(topTurnOverList: topTurnOverList));
    } catch (e) {
      emit(TopTradersError());
    }
  }


}
