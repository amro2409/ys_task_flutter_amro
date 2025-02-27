
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

//'============================================
void showConnectionStatus(BuildContext context, ConnectivityResult result) {
  final snackBar = SnackBar(
    content: Text(result == ConnectivityResult.none
        ? 'You are offline'
        : 'You are online'),
    duration: const Duration(seconds: 5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

//======================'fh-2'========================