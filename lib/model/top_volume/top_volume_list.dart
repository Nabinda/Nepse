import 'package:nepse/model/top_volume/top_volume_model.dart';

class TopVolumeList {
  final List<TopVolumeModel> topVolumeList;
  TopVolumeList({required this.topVolumeList});
  factory TopVolumeList.fromJSON(List<dynamic> json) {
    List<TopVolumeModel> topVolumeList = <TopVolumeModel>[];
    for (var post in json) {
      topVolumeList.add(TopVolumeModel.fromJSON(post));
    }
    return TopVolumeList(
      topVolumeList: topVolumeList,
    );
  }
}
