
import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';

import '../../domain/repositories/stock_repository.dart';
import '../api/stock_api.dart';
import '../local/app_database.dart';

class StockRepositoryImpl implements StockRepository{
  static const _tag = "StockRepositoryImpl";
  final DatabaseFacade localDataSource;
  final IStockApi remoteDataSource;

  StockRepositoryImpl({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<void> createStock(StockEntity item) {
    // TODO: implement createStock
    throw UnimplementedError();
  }

  @override
  Future<void> editStock(StockEntity item) {
    // TODO: implement editStock
    throw UnimplementedError();
  }

  @override
  Future<List<StockEntity>> getStocks({String? symbol, String? companyName}) {
    // TODO: implement getStocks
    throw UnimplementedError();
  }

  @override
  Future<StockEntity?> searchStocksBySymbol(String symbol) {
    // TODO: implement searchStocksBySymbol
    throw UnimplementedError();
  }

  @override
  Future<void> syncStocks() {
    // TODO: implement syncStocks
    throw UnimplementedError();
  }

}