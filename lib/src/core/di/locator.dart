
import 'package:get_it/get_it.dart';
import 'package:stock_market_tracker/src/data/api/dio_client.dart';
import 'package:stock_market_tracker/src/domain/use_cases/fetch_top_stocks_use_case.dart';

import '../../data/api/stock_api.dart';
import '../../data/local/app_database.dart';
import '../../data/repositories/stock_repository_impl.dart';
import '../../domain/repositories/stock_repository.dart';
import '../services/connectivity_service.dart';
import '../services/storage_service.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //══════════════════════╡ Core Dependencies ╞════════════════════════════════════════
  // conn internet
  locator.registerSingleton<ConnectivityService>(ConnectivityService());
  // Dio Client to connect API
  locator.registerSingleton<DioClient>(DioClient());
  // Stock API
  locator.registerLazySingleton<IStockApi>(() => IStockApi(locator<DioClient>().dio));


  //══════════════════════╡ Storage internal Db ╞═════════════════
  // Hive Service
  locator.registerSingleton<HiveService>(HiveService());
  // Sqlite db
  // Initialize and register AppDatabase
  final appDatabase = AppDatabase();
  await appDatabase.mDb; // Ensure database is opened
  locator.registerSingleton<DatabaseFacade>(appDatabase);




  //══════════════════════╡ Stock  ╞═════════════════════════


  // Stock Repository
  // update StockRepositoryImpl to using t Remote or Local DataSource
  locator.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      remoteDataSource: locator<IStockApi>(),
      localDataSource: locator<DatabaseFacade>(),
    ),
  );

  //══════════════════════╡ Use Cases ╞════════════════════════════════════════
  // Use Cases
  // Stock Use Cases
  locator.registerLazySingleton(() => FetchTopStocksUseCase(locator<StockRepository>()));

  //══════════════════════╡ BLoCs ╞════════════════════════════════════════
  //locator.registerFactory(() => ItemListBloc(locator<GetItemsUseCase>()));
}
