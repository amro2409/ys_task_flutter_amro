// file schemas

import '../../core/constants/entries_constants.dart';

const createTable = "CREATE TABLE IF NOT EXISTS ";
const createIndex = "CREATE INDEX IF NOT EXISTS";
const createView = "CREATE VIEW IF NOT EXISTS";
const createTrigger = "CREATE TRIGGER IF NOT EXISTS";

enum DbEntityType {
  createTable,
  createIndex,
  createView,
  createTrigger,
}

class DbEntry {
  static const String NAME_DATABASE = "stock_market_mobile_db";
  static const int VERSION_DATABASE = 1;

//============== STOCK MODULE ENTRY ==============================
  static const TABLE_NAME_STOCK = "Stocks";
  static const TABLE_NAME_DAILY_PRICES = "DailyPrices";
}

Map schemas = {
  DbEntry.TABLE_NAME_STOCK: {
    DbEntityType.createTable: '''
      $createTable ${DbEntry.TABLE_NAME_STOCK} (
         ${StockEntries.COL_SYMBOL} TEXT PRIMARY KEY,
      ${StockEntries.COL_COMPANY_NAME} TEXT,
      ${StockEntries.COL_CURRENT_PRICE} REAL,
      ${StockEntries.COL_PERCENTAGE_CHANGE} REAL,
      ${StockEntries.COL_OPEN_PRICE} REAL,
      ${StockEntries.COL_CLOSE_PRICE} REAL,
      ${StockEntries.COL_HIGH_PRICE} REAL,
      ${StockEntries.COL_LOW_PRICE} REAL,
      ${StockEntries.COL_LAST_UPDATED} TEXT
      )
    ''',
    DbEntityType.createIndex: '''
        $createIndex idx_stock_gp_symbol_company_name ON ${DbEntry.TABLE_NAME_STOCK}
        (${StockEntries.COL_SYMBOL},${StockEntries.COL_COMPANY_NAME})
        ''',
  },
  DbEntry.TABLE_NAME_DAILY_PRICES: {
    DbEntityType.createTable: '''
      $createTable ${DbEntry.TABLE_NAME_DAILY_PRICES} (
        ${DailyPriceEntries.COL_LOCAL_ID} TEXT PRIMARY KEY,
        ${DailyPriceEntries.COL_PRICE} REAL  DEFAULT 0,
       ${DailyPriceEntries.COL_DATE} TEXT  DEFAULT 0,
         ${DailyPriceEntries.COL_STOCK_SYMBOL} TEXT  DEFAULT 0,
      )
    ''',
  },
};
