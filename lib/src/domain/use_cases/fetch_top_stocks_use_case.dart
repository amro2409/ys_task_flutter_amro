

import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';
import 'package:stock_market_tracker/src/domain/repositories/stock_repository.dart';

class FetchTopStocksUseCase {
  final StockRepository repository;

  FetchTopStocksUseCase(this.repository);

  Future<List<StockEntity>> execute({String? symbol, String? companyName}) async {
    return repository.getStocks(symbol: symbol, companyName: companyName);
  }
}