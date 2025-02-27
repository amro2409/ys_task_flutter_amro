
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_market_tracker/src/data/local/schemas.dart';

import '../../core/utils/log.dart';
import 'dao/stock_dao.dart';



abstract class DatabaseFacade {
  StockDao get itemDao;
}

class AppDatabase implements DatabaseFacade {
  static const _tage = "AppDatabase";
  static final AppDatabase _instance = AppDatabase._internal();

  static Database? _mDb;

  factory AppDatabase() => _instance;

  AppDatabase._internal();

  Future<Database> get mDb async {
    if (_mDb != null) return _mDb!;
    _mDb = await _initDatabase();
    return _mDb!;
  }

  /// Opens the database and creates it if it doesn't exist.
  /// The database is stored in the app's local storage directory with the name 'my_db.db'.
  /// If the database doesn't exist, it will be created with version 1.
  /// Returns a [Future] that completes with the opened [Database] object.
  Future<Database> _initDatabase() async {
    // Get the path to the app's local storage directory
    final String path = join(await getDatabasesPath(), '${DbEntry.NAME_DATABASE}.db');
    // Open the database and create it if it doesn't exist
    return openDatabase(
      path,
      version: DbEntry.VERSION_DATABASE,
      onCreate: _createTables,
      onUpgrade: _upgradeTables,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _createTables(Database db, int version) async {
    // When creating the db, create the tables
    await db.execute(schemas[DbEntry.TABLE_NAME_STOCK]?[DbEntityType.createTable]);
    await db.execute(schemas[DbEntry.TABLE_NAME_DAILY_PRICES]?[DbEntityType.createTable]);

    // Log a message indicating that the tables have been created
    Log.i(_tage, ' created tables db: ${db.path}');
    //index
    await db.execute(schemas[DbEntry.TABLE_NAME_STOCK]?[DbEntityType.createIndex]);
    Log.i(_tage, ' created index db: ${db.path}');

  }

  Future<void> _upgradeTables(Database db, int oldVersion, int newVersion) async {


  }

//========================'implements DAOs '==================

  @override
  StockDao get itemDao => StockDaoImpl(this);

}
//
// extension DbHelper on AppDatabase {
//   /// inserts a
//   ///new row into a specified table in the database.
//   ///It takes the table name and a map of column
//   ///values: {column_name:value} Map<String,Object?>
//   ///example:values:  {'name': 'ali', 'birthdate':'1999-09-09', 'phone':7778888}
//   Future<int> insert(String nameTable, Map<String, Object> values) async {
//     //open db
//     final Database database = await mDb;
//     //process insert
//     final int currentId = await database.insert(nameTable, values,
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     //return id of the last inserted row.
//     return currentId;
//   }
//
//   ///update rows to any table press in parameter
//   ///nameTable: name table that update
//   ///values: {column_name:value} Map<String,Object?>
//   ///example:values:  {'name': 'ali', 'birthdate':'1999-09-09', 'phone':7778888}
//   ///where: ' id = ? AND name = ? '
//   ///whereArgs: [1,'ali']
//   Future<int> update(nameTable, values, where, whereArgs) async {
//     //open db
//     final Database database = await mDb;
//     //process update
//     final int count = await database.update(nameTable, values,
//         where: where, whereArgs: whereArgs, conflictAlgorithm: ConflictAlgorithm.replace);
//     //Returns the number of changes made.
//     //يرجع عدد التغييرات التي تم اجراؤها
//     return count;
//   }
//
// /*
//  listData:[
//        {'id':1,'name':"ali ahmed",'birthdate':"1999-09-09",'phone':778887777},//map
//        {'id':1,'name':"ala ahmed",'birthdate':"1990-09-09",'phone':718887777},//map
//       ]
//  */
//
//   ///sql:'SELECT * FROM users WHERE id=?' OR 'SELECT * FROM users WHERE id=1'
//   ///args: [1] OR without pass args
//   Future<List<Map>> getAllData(String sql, [args]) async {
//     //open db
//     final Database database = await mDb;
//     //Executes query and returns a list of the rows
//     List<Map> dataList = await database.rawQuery(sql, args);
//     //returns a list of the rows
//     return dataList;
//   }
//
//   /// cols:['id', 'name', 'age']
//   /// where: 'id= ?'
//   Future<List<Map>> getById(nameTable, cols, where, int id) async {
//     //open db
//     final Database db = await mDb;
//     //
//     List<Map> maps =
//         await db.query(nameTable, columns: cols, where: where, whereArgs: [id]);
//     return maps;
//   }
// }
