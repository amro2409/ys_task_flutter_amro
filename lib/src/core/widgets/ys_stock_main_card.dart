
import 'package:flutter/material.dart';
import 'package:stock_market_tracker/src/core/utils/extensions/context_extension.dart';

class ErpnextMainCard extends StatelessWidget {
  const ErpnextMainCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.image,
      this.onPressedCard});

  final IconData icon;
  final String text;
  final String image;
  final void Function()? onPressedCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          onPressedCard!();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != "")
                Image.asset(
                  image,
                  width: 64,
                  height: 64,
                ),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                text,
                style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: context.colors.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YsStockMainCardMid extends StatelessWidget {
  const YsStockMainCardMid(
      {super.key,
      required this.icon,
      required this.text,
      required this.image,
       this.iconColor = Colors.blue,
      this.onPressedCard
      });

  final IconData icon;
  final Color iconColor;
  final String text;
  final String image;
  final void Function()? onPressedCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: context.normalCircularRadius,
      ),
      child: InkWell(
        onTap:  onPressedCard,
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 48,
                height: 48,
                fit: BoxFit.contain,

              ),
              //Icon(icon, size: 48.0, color: iconColor,),
               SizedBox(height: context.lowValue),
              Text(
                text,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.colors.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
