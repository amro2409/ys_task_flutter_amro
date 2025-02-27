



import 'package:flutter/material.dart';
import 'package:stock_market_tracker/src/core/utils/extensions/context_extension.dart';

import '../theme/colors.dart';
import '../utils/log.dart';



class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Log.i("paddingNormal", "l:${context.paddingLow.top},n:${context.paddingBitNormal.left}");
    Log.i("paddingNormal", "m:${context.paddingMedium.top},h:${context.paddingHigh.left}");
    return Center(
      child: Container(
          width: double.infinity,
          padding: context.paddingBitNormal,
          //height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.redAccent.withOpacity(0.3),
              border: Border.all(
                  color: Colors.redAccent, width: 1, style: BorderStyle.solid)),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColor.errorColor,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          )),
    );
  }
}
