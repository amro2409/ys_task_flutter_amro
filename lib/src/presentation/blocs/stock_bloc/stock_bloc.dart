import 'package:bloc/bloc.dart';
import 'package:stock_market_tracker/src/domain/use_cases/fetch_top_stocks_use_case.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/utils/log.dart';
import 'stock_event.dart';
import 'stock_state.dart';


class StockBloc extends Bloc<StockEvent, StockState> {
  final FetchTopStocksUseCase fetchTopStockUseCase;

  StockBloc(this.fetchTopStockUseCase) : super(StockInitial()) {
    Log.i("stockBloc", "Initializing register event handler");
    on<FetchStocksEvent>(_onFetchStocks);
  }

  Future<void> _onFetchStocks(FetchStocksEvent event, Emitter<StockState> emit) async {
    emit(StockLoading());
    try {
      Log.i("stockBloc", "fetchTopStockUseCase");
      final items =
          await fetchTopStockUseCase.execute(symbol: event.filter, companyName: event.search);
      emit(StockLoaded(items));
    } on ApiException catch (e) {
      Log.e("stockBloc", e.message);
      emit(StockFailure(e.message));
    }
  }
}
