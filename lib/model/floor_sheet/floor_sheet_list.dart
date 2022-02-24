import 'package:nepse/model/floor_sheet/floor_sheet_model.dart';

class FloorSheetList{
  final List<FloorSheetModel> floorSheetList;
  FloorSheetList({required this.floorSheetList});
  factory FloorSheetList.fromJSON(List<dynamic> json) {
    List<FloorSheetModel> floorSheetList = <FloorSheetModel>[];
    for (var post in json) {
      floorSheetList.add(FloorSheetModel.fromJSON(post));
    }
    return FloorSheetList(
      floorSheetList: floorSheetList,
    );
  }
}