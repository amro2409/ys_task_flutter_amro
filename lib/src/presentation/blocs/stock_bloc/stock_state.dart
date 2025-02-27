

import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';

abstract class StockState {}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
   List<StockEntity> items;

   StockLoaded(this.items);
}

class StockFailure extends StockState {
  final String error;

  StockFailure(this.error);
}
