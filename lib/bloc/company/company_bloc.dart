import 'package:bloc/bloc.dart';
import '../../model/company/company_list.dart';
import '../../repositories/company_repositories.dart';
import 'company_event.dart';
import 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyRepositories companyRepositories = CompanyRepositories();
  CompanyBloc() : super(CompanyEmpty()) {
    on<FetchCompany>(onFetchCompany);
  }

  Future<void> onFetchCompany(
      FetchCompany event,
      Emitter<CompanyState> emit,
      ) async {
    try {
      emit(CompanyLoading());
      final CompanyList companyModel =
      await companyRepositories.fetchCompany(pageNumber: event.pageNumber);
      emit(CompanyLoaded(company: companyModel));
    } catch (e) {
      emit(CompanyError());
    }
  }
}
