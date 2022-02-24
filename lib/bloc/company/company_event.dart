import 'package:equatable/equatable.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
}

class FetchCompany extends CompanyEvent {
  final int pageNumber;
  const FetchCompany({required this.pageNumber});

  @override
  List<Object> get props => [];
}
