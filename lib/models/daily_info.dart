class DailyInfo {
  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;

  DailyInfo(
      {required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  factory DailyInfo.fromJson(Map<String, dynamic> jsonObj) => DailyInfo(
      open: jsonObj['1. open'],
      high: jsonObj['2. high'],
      low: jsonObj['3. low'],
      close: jsonObj['4. close'],
      volume: jsonObj['5. volume']);
}
