class ColumnsBase {
  static const COL_LOCAL_ID = "local_id";
  static const COL_SYNC_STATUS = "sync_status";
  static const COL_NAME = "name";
}

class StockEntries {
  //static const String TABLE_NAME = "Stocks";

  static const String COL_LOCAL_ID = ColumnsBase.COL_LOCAL_ID;
  static const String COL_SYMBOL = "symbol";
  static const String COL_COMPANY_NAME = "companyName";
  static const String COL_CURRENT_PRICE = "currentPrice";
  static const String COL_PERCENTAGE_CHANGE = "percentageChange";
  static const String COL_OPEN_PRICE = "openPrice";
  static const String COL_CLOSE_PRICE = "closePrice";
  static const String COL_HIGH_PRICE = "highPrice";
  static const String COL_LOW_PRICE = "lowPrice";
  static const String COL_LAST_UPDATED = "lastUpdated";
}

class DailyPriceEntries {
  //static const String TABLE_NAME = "DailyPrices";

  static const String COL_LOCAL_ID = ColumnsBase.COL_LOCAL_ID;
  static const String COL_DATE = "date";
  static const String COL_PRICE = "price";
// REF
 static const String COL_STOCK_SYMBOL = "stockSymbol";
}

