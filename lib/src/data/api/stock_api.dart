
 import 'package:dio/dio.dart';
import 'package:stock_market_tracker/src/domain/entities/daily_price_entity.dart';
import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';

 import 'package:retrofit/retrofit.dart';

import 'end_points/endpoints.dart';

 part 'stock_api.g.dart';
 @RestApi()
 abstract class IStockApi {
  factory IStockApi(Dio dio) = _IStockApi;

  /// fetch list stock with
  /// options[ search ]
  @GET(Endpoints.fetchTopStockData)
  Future<Map<String, List<StockEntity>>> fetchTopStockData({
   @Query('fields') String fields = '["symbol", "company_name"]',
   @Query('symbol') String? symbol,
   @Query('company_name') String? companyName,
  });


  /// historical stock PricesLast 5 Days
  @GET(Endpoints.historicalStockPricesLastFiveDays)
  Future<Map<String, List<DailyPriceEntity>>> historicalStockPricesLastFiveDays({
   @Query('fields') String fields = '["*"]',
  });

 }