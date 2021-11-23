class NepseMarketSummary{
  final String detail;
  final double value;
  NepseMarketSummary({required this.detail, required this.value});
  factory NepseMarketSummary.fromJSON(var json) => NepseMarketSummary(
    detail: json['detail'],
    value: json['value'].toDouble()
  );
}
