import 'package:bloc/bloc.dart';
import 'package:nepse/bloc/nepse_index_chart/nepse_index_events.dart';
import 'package:nepse/bloc/nepse_index_chart/nepse_index_state.dart';
import 'package:nepse/model/nepse_index/nepse_index_list.dart';
import 'package:nepse/repositories/nepse_index_repositories.dart';

class NepseIndexBloc extends Bloc<NepseIndexEvent, NepseIndexState> {
  final NepseIndexRepositories nepseIndexRepositories;
  NepseIndexBloc({required this.nepseIndexRepositories})
      : super(NepseIndexEmpty()) {
    on<FetchNepseIndex>(onFetchNepseIndex);
  }

  Future<void> onFetchNepseIndex(
    FetchNepseIndex event,
    Emitter<NepseIndexState> emit,
  ) async {
    try {
      emit(NepseIndexLoading());
      final NepseIndexList nepseIndexModel =
          await nepseIndexRepositories.fetchNepseIndexChart();
      emit(NepseIndexLoaded(nepseIndex: nepseIndexModel));
    } catch (e) {
      emit(NepseIndexError());
    }
  }
}
