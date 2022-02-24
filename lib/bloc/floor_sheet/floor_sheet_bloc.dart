import 'package:bloc/bloc.dart';
import '../../model/floor_sheet/floor_sheet_list.dart';
import '../../repositories/floor_sheet_repositories.dart';
import 'floor_sheet_event.dart';
import 'floor_sheet_state.dart';

class FloorSheetBloc extends Bloc<FloorSheetEvent, FloorSheetState> {
  FloorSheetRepositories floorSheetRepositories = FloorSheetRepositories();
  FloorSheetBloc() : super(FloorSheetEmpty()) {
    on<FetchFloorSheet>(onFetchFloorSheet);
  }

  Future<void> onFetchFloorSheet(
      FetchFloorSheet event,
      Emitter<FloorSheetState> emit,
      ) async {
    try {
      emit(FloorSheetLoading());
      final FloorSheetList floorSheetModel =
      await floorSheetRepositories.fetchFloorSheet(pageNumber: event.pageNumber);
      emit(FloorSheetLoaded(floorSheet: floorSheetModel));
    } catch (e) {
      emit(FloorSheetError());
    }
  }
}
