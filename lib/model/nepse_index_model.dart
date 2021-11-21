class NepseIndexModel {
  final DateTime time;
  final double index;
  NepseIndexModel({required this.time,required this.index});
  static NepseIndexModel fromJson(dynamic json) {
     _unixToDateTime(int unix){
       final dateTime = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
       return dateTime;
     }
    return NepseIndexModel(
      time: _unixToDateTime(json[0]),
      index: json[1],
    );
  }
}
