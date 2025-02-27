
import 'package:flutter/material.dart';
import 'package:stock_market_tracker/src/core/utils/extensions/context_extension.dart';

class YsStockAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const YsStockAppBarWidget({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {

    return  AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        title,
        style: context.textTheme.headlineSmall?.copyWith(
            color:context.colors.onPrimary,
             fontSize: 18.0
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: actions,
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
