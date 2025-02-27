
import 'package:stock_market_tracker/src/core/constants/entries_constants.dart';
import 'package:stock_market_tracker/src/domain/entities/daily_price_entity.dart';

class StockEntity{
  final String symbol;
  final String companyName;
  final double currentPrice;
  final double percentageChange;
  final double openPrice;
  final double closePrice;
  final double highPrice;
  final double lowPrice;
  final String lastUpdated;
  final List<DailyPriceEntity> dailyPrices;

  StockEntity({
    required this.symbol,
    required this.companyName,
    required this.currentPrice,
    required this.percentageChange,
    required this.openPrice,
    required this.closePrice,
    required this.highPrice,
    required this.lowPrice,
    required this.lastUpdated,
    required this.dailyPrices,
  });

  // Convert JSON to Stock object
  factory StockEntity.fromJson(Map<String, dynamic> json) {
    return StockEntity(
      symbol: json[StockEntries.COL_SYMBOL],
      companyName: json[StockEntries.COL_COMPANY_NAME],
      currentPrice: (json[StockEntries.COL_CURRENT_PRICE] as num).toDouble(),
      percentageChange: (json[StockEntries.COL_PERCENTAGE_CHANGE] as num).toDouble(),
      openPrice: (json[StockEntries.COL_OPEN_PRICE] as num).toDouble(),
      closePrice: (json[StockEntries.COL_CLOSE_PRICE] as num).toDouble(),
      highPrice: (json[StockEntries.COL_HIGH_PRICE] as num).toDouble(),
      lowPrice: (json[StockEntries.COL_LOW_PRICE] as num).toDouble(),
      lastUpdated: json[StockEntries.COL_LAST_UPDATED],
      dailyPrices: (json['dailyPrices'] as List)
          .map((item) => DailyPriceEntity.fromJson(item))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      StockEntries.COL_SYMBOL: symbol,
      StockEntries.COL_COMPANY_NAME: companyName,
      StockEntries.COL_CURRENT_PRICE: currentPrice,
      StockEntries.COL_PERCENTAGE_CHANGE: percentageChange,
      StockEntries.COL_OPEN_PRICE: openPrice,
      StockEntries.COL_CLOSE_PRICE: closePrice,
      StockEntries.COL_HIGH_PRICE: highPrice,
      StockEntries.COL_LOW_PRICE: lowPrice,
      StockEntries.COL_LAST_UPDATED: lastUpdated,
      'dailyPrices': dailyPrices.map((item) => item.toJson()).toList(),
    };
  }
}