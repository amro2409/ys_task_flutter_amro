
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';



class CustomSuccessText extends StatelessWidget {
  const CustomSuccessText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.all(8),
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.successColor.withOpacity(0.3),
              border: Border.all(
                  color: AppColor.successColor, width: 1, style: BorderStyle.solid)),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(Icons.safety_check_rounded,),
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
