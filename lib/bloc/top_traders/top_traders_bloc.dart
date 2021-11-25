import 'package:bloc/bloc.dart';
import 'package:nepse/bloc/top_traders/top_traders_event.dart';
import 'package:nepse/bloc/top_traders/top_traders_state.dart';
import 'package:nepse/model/top_traders/top_traders_list.dart';
import 'package:nepse/repositories/top_traders_repositories.dart';

class TopTradersBloc extends Bloc<TopTradersEvent, TopTradersState> {
  TopTradersRepositories topTradersRepositories =
  TopTradersRepositories();
  TopTradersBloc() : super(TopTradersEmpty()) {
    on<FetchTopTraders>(onFetchTopTraders);
  }

  Future<void> onFetchTopTraders(
      FetchTopTraders event,
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
}
