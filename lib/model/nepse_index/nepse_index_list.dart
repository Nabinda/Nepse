import 'package:nepse/model/nepse_index/nepse_index_model.dart';

class NepseIndexList {
  final List<NepseIndexModel> nepseIndexList;

  NepseIndexList({
    required this.nepseIndexList,
  });

  factory NepseIndexList.fromJSON(dynamic json) {
    List<NepseIndexModel> nepseIndexList = <NepseIndexModel>[];
    for (var post in json) {
      nepseIndexList.add(NepseIndexModel.fromJson(post));
    }
    return NepseIndexList(
      nepseIndexList: nepseIndexList,
    );
  }
}
