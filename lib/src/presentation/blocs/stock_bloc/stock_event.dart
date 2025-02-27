import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';

abstract class StockEvent {}

class FetchStocksEvent implements StockEvent {
  final String? filter;
  final String? search;

  FetchStocksEvent({this.filter, this.search});
}

class CreateStockEvent implements StockEvent {
  final StockEntity stockEntity;

  CreateStockEvent(this.stockEntity);
}

class EditStockEvent implements StockEvent {}

class SearchStockEvent implements StockEvent {
  final String? symbol;
  final String? companyName;

  SearchStockEvent({this.symbol, this.companyName});
}

class DetailsStockEvent implements StockEvent {
  final StockEntity stockEntity;

  DetailsStockEvent(this.stockEntity);
}
