import 'company_model.dart';

class CompanyList{
  final List<CompanyModel> companyList;
  CompanyList({required this.companyList});
  factory CompanyList.fromJSON(List<dynamic> json) {
    List<CompanyModel> companyList = <CompanyModel>[];
    for (var post in json) {
      companyList.add(CompanyModel.fromJSON(post));
    }
    return CompanyList(
      companyList: companyList,
    );
  }
}