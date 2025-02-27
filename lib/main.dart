import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_tracker/src/core/di/locator.dart';
import 'package:stock_market_tracker/src/core/routing/app_router.dart';
import 'package:stock_market_tracker/src/core/services/storage_service.dart';
import 'package:stock_market_tracker/src/core/utils/log.dart';
import 'package:stock_market_tracker/src/core/widgets/halper/error_app_view.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_tracker/src/domain/use_cases/fetch_top_stocks_use_case.dart';
import 'package:stock_market_tracker/src/presentation/blocs/stock_bloc/stock_bloc.dart';
import 'my_app.dart';

Future<void> main() async {
  debugPrint('Initializing app...');
  WidgetsFlutterBinding.ensureInitialized();
  //final hiveService = HiveService();
  try{
    // init Dependency Injection
    await setupLocator();
    final appRouter = AppRouter();
    runApp(
      MultiProvider(
        providers: [
          BlocProvider(
            create: (_) => StockBloc(locator<FetchTopStocksUseCase>()),
          ),
        ],
        child: MyApp(appRouter: appRouter),
      ),
    );
    debugPrint('App initialized successfully');
  } catch(e, stack){
    Log.e("main", 'Error during initialization: $e', stackTrace: stack);
    //print('Stack trace: $stack');
    runApp(const ErrorAppView());
  }

}


