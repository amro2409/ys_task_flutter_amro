
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_tracker/src/core/utils/extensions/context_extension.dart';
import 'package:stock_market_tracker/src/core/utils/log.dart';
import 'package:stock_market_tracker/src/presentation/blocs/stock_bloc/stock_bloc.dart';
import 'package:stock_market_tracker/src/presentation/blocs/stock_bloc/stock_state.dart';
import 'package:stock_market_tracker/src/presentation/widgets/item_card.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/widgets/custom_error_text.dart';
import '../../../core/widgets/ys_stock_app_bar_widget.dart';

import '../../blocs/stock_bloc/stock_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  YsStockAppBarWidget( title: 'Stock List ',actions:[
        IconButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            context.pushNamed(RouteNames.stockCreate);
          },
        )
      ]),
      body: Container(
        padding: context.paddingLow,
        child: BlocBuilder<StockBloc, StockState>(
          builder: (context, state) {
            if (state is StockInitial) {
              Log.i("StockListScreen", "StockListInitial");
              context.read<StockBloc>().add(FetchStocksEvent());
            } else if (state is StockLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StockLoaded) {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (ctx, index) => ItemCard(item: state.items[index]),
              );
            } else if (state is StockFailure) {
              return CustomErrorText(title: 'Error: ${state.error}');
            }
            return const Center(child: Text('No Stock  found.'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<StockBloc>().add(FetchStocksEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

