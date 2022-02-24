import 'package:bloc/bloc.dart';
import 'package:nepse/repositories/todays_price_repositories.dart';
import '/model/todays_price/todays_price_list.dart';
import 'todays_price_event.dart';
import 'todays_price_state.dart';

class TodaysPriceBloc extends Bloc<TodaysPriceEvent, TodaysPriceState> {
  TodaysPriceRepositories todaysPriceRepositories = TodaysPriceRepositories();
  TodaysPriceBloc() : super(TodaysPriceEmpty()) {
    on<FetchTodaysPrice>(onFetchTodaysPrice);
  }

  Future<void> onFetchTodaysPrice(
      FetchTodaysPrice event,
      Emitter<TodaysPriceState> emit,
      ) async {
    try {
      emit(TodaysPriceLoading());
      final TodaysPriceList todaysPriceModel =
      await todaysPriceRepositories.fetchTodaysPrice(pageNumber: event.pageNumber);
      emit(TodaysPriceLoaded(todaysPrice: todaysPriceModel));
    } catch (e) {
      emit(TodaysPriceError());
    }
  }
}
