import '../entities/stock_entity.dart';

abstract class StockRepository {
  Future<void> syncStocks();

  Future<List<StockEntity>> getStocks({String? symbol, String? companyName});

  Future<StockEntity?> searchStocksBySymbol(String symbol);

  Future<void> createStock(StockEntity item);
  Future<void> editStock(StockEntity item);
}
