import 'package:equatable/equatable.dart';

import '../../model/company/company_list.dart';


abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}
//Empty State
class CompanyEmpty extends CompanyState {}
//Loading State
class CompanyLoading extends CompanyState {
}
//Loaded State
class CompanyLoaded extends CompanyState {
  final CompanyList company;

  const CompanyLoaded({required this.company});

  @override
  List<Object> get props => [company];
}
//Error State
class CompanyError extends CompanyState {
}
