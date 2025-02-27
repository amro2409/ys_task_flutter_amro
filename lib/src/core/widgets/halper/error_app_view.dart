
import 'package:flutter/material.dart';

class ErrorAppView extends StatelessWidget {
  const ErrorAppView({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final _message = message ?? 'حدث خطأ أثناء التهيئة';
    return MaterialApp(
      home: Scaffold(body: Center(child: Text(_message))),
    );
  }
}
