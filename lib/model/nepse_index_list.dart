
import 'package:nepse/model/nepse_index_model.dart';

class NepseIndexList {
  final List<NepseIndexModel> nepseIndexList;

  NepseIndexList({
    required this.nepseIndexList,
  });

  factory NepseIndexList.fromJson(List<NepseIndexModel> json) {
    List<NepseIndexModel> nepseIndexList = <NepseIndexModel>[];
    nepseIndexList = json.map((post) => NepseIndexModel.fromJson(post)).toList();

    return NepseIndexList(
      nepseIndexList: nepseIndexList,
    );
  }
}
