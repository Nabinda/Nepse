import 'package:bloc/bloc.dart';
import 'package:nepse/bloc/nepse_index_chart/nepse_index_events.dart';
import 'package:nepse/bloc/nepse_index_chart/nepse_index_state.dart';
import 'package:nepse/model/nepse_index_list.dart';
import 'package:nepse/repositories/nepse_index_repositories.dart';

class NepseIndexBloc extends Bloc<NepseIndexEvent, NepseIndexState>{
  final NepseIndexRepositories nepseIndexRepositories;
  NepseIndexBloc({required this.nepseIndexRepositories}) : super(NepseIndexEmpty());

  Stream<NepseIndexState> mapEventToState(NepseIndexEvent event) async*{
    if(event is FetchNepseIndex){
      yield NepseIndexLoading();
      try{
        final NepseIndexList nepseIndexModel = await nepseIndexRepositories.fetchNepseIndexChart();
        yield NepseIndexLoaded(nepseIndex: nepseIndexModel);
      }
      catch(_){
        yield NepseIndexError();
      }
    }
  }

}
