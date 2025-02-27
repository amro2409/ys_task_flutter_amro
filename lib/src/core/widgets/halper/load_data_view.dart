
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../constants/assets.dart';
import '../../constants/enums.dart';

class LoadDataView extends StatelessWidget {
  const LoadDataView({super.key, required this.state, required this.widget});

  final RequestStateCode state;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return state == RequestStateCode.notConnect
        ? Center(child: _image())
        : state == RequestStateCode.loading
            ? Center(child: Lottie.asset(AppImageAsset.loading, height: 200, width: 200))
            : state == RequestStateCode.errorServer
                ? Center(child: Lottie.asset(AppImageAsset.notData,))
                : state == RequestStateCode.none
                    ? Center(child: Lottie.asset(AppImageAsset.notData,))
                    : widget;
  }

  Image _image(){
    return const Image(
      image: AssetImage(AppImageAsset.notData),
      fit: BoxFit.contain, height: 200, width: 200,);
  }
}

//=========================================

class SendDataWithProgressView extends StatelessWidget {
   const SendDataWithProgressView({super.key, required this.state,  required this.widget});

  final RequestStateCode state;
   final Widget widget;

  @override
  Widget build(BuildContext context) {
    return state == RequestStateCode.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading, height: 200, width: 200))
        : widget;
  }
}



