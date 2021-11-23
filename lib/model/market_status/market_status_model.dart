class MarketStatusModel{
  final int id;
  final DateTime dateTime;
  final String isOpen;
  MarketStatusModel({required this.id,required this.dateTime,required this.isOpen});
  
  factory MarketStatusModel.fromJSON(dynamic json){
    return MarketStatusModel(id: json['id'], dateTime: DateTime.parse(json['asOf']), isOpen: 'isOpen');
  }
}
