// Item DAO

import 'package:sqflite/sqflite.dart';
import 'package:stock_market_tracker/src/core/constants/entries_constants.dart';

import '../../../domain/entities/stock_entity.dart';
import '../app_database.dart';
import '../schemas.dart';

abstract class StockDao {
  Future<void> insertStock(StockEntity item);

  Future<void> insertStocks(List<StockEntity> items);

  Future<List<StockEntity>> getStocks();

  Future<StockEntity?> searchStockBySymbolOrCompanyName(String symbol,
      {String? companyName});

  Future<void> updateStock(StockEntity item);
}

class StockDaoImpl implements StockDao {
  final AppDatabase _appDatabase;

  StockDaoImpl(this._appDatabase);

  @override
  Future<void> insertStock(StockEntity item) async {
    final db = await _appDatabase.mDb;

    await db.insert(
      DbEntry.TABLE_NAME_STOCK,
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> insertStocks(List<StockEntity> items) async {
    final db = await _appDatabase.mDb;

    for (final item in items) {
      await db.insert(
        DbEntry.TABLE_NAME_STOCK,
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<List<StockEntity>> getStocks() async {
    final db = await _appDatabase.mDb;
    final List<Map<String, dynamic>> maps = await db.query(DbEntry.TABLE_NAME_STOCK);
    return List.generate(maps.length, (i) => StockEntity.fromJson(maps[i]));
  }

  @override
  Future<StockEntity?> searchStockBySymbolOrCompanyName(String symbol,
      {String? companyName}) async {
    final db = await _appDatabase.mDb;
    final whereArg =companyName != null?[symbol, companyName]: [symbol];
    final List<Map<String, dynamic>> maps = await db.query(
      DbEntry.TABLE_NAME_STOCK,
      where:
          '${StockEntries.COL_SYMBOL} = ?${companyName != null ? ' ${StockEntries.COL_COMPANY_NAME} = ?':''}',
      whereArgs: whereArg,
    );
    return maps.isNotEmpty ? StockEntity.fromJson(maps.first) : null;
  }

  @override
  Future<void> updateStock(StockEntity item) async {
    final db = await _appDatabase.mDb;
    await db.update(
      DbEntry.TABLE_NAME_STOCK,
      item.toJson(),
      where: '${StockEntries.COL_SYMBOL} = ?',
      whereArgs: [item.symbol],
    );
  }
}
