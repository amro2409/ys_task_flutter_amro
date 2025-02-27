

class DailyPriceEntity{
  final DateTime date;
  final double price;

  DailyPriceEntity({
    required this.date,
    required this.price,
  });

  // Convert JSON to DailyPrice object
  factory DailyPriceEntity.fromJson(Map<String, dynamic> json) {
    return DailyPriceEntity(
      date: DateTime.parse(json['date']),
      price: (json['price'] as num).toDouble(),
    );
  }

  // Convert DailyPrice object to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'price': price,
    };
  }
}