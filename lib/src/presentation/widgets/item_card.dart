

import 'package:flutter/material.dart';
import 'package:stock_market_tracker/src/core/utils/extensions/string_extensions.dart';
import 'package:stock_market_tracker/src/domain/entities/stock_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final StockEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Image.asset("item".toPNG),),
        title: Text(item.symbol),
        subtitle: Text(item.companyName),
        trailing:Text('Price: ${item.currentPrice}'),
      ),
    );
  }
}