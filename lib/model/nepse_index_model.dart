class NepseIndexModel {
  final DateTime time;
  final double index;
  NepseIndexModel({required this.time, required this.index});
  static NepseIndexModel fromJson(List<dynamic> json) {
    _unixToDateTime(int unix) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
      return dateTime;
    }

    DateTime _dateTime = _unixToDateTime(json[0].toInt());
    double index = json[1].toDouble();
    NepseIndexModel _nepseIndex =
        NepseIndexModel(time: _dateTime, index: index);
    return _nepseIndex;
  }
}
