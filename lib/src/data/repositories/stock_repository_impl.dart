
import 'package:dio/dio.dart';
import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';

import '../../core/error/exceptions.dart';
import '../../core/utils/log.dart';
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
  Future<List<StockEntity>> getStocks({String? symbol, String? companyName}) async {
    try {
      Log.i(_tag, "Start task: Fetching Stock from API");

      final items = await remoteDataSource.fetchTopStockData(
        symbol: symbol,
        companyName: companyName,
      );
      Log.i(_tag, "Successfully fetched Stocks from API");
      final dataList = items['Data'] as List<StockEntity>;

      await localDataSource.itemDao.insertStocks(dataList);
      Log.i(_tag, "Successfully Cached Stock locally,");

      return dataList;
    } on DioException catch (e) {
      final eResp = e.response;
      Log.e(_tag, "${eResp?.statusCode}, ${e.error}", stackTrace: e.stackTrace);
      // Try retrieve data from Local
      final localItems = await localDataSource.itemDao.getStocks();
      if (localItems.isNotEmpty) {
        Log.d(_tag, "Returning cached Stock from Local STORE, ${localItems.length}");
        return localItems;
      }
      throw ApiException(eResp?.data['message'] ?? '${e.message}', eResp?.statusCode);
    }
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