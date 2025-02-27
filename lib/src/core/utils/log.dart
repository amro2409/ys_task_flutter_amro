
import 'package:flutter/cupertino.dart';

import '../constants/app_constants.dart';

class Log {
  static const _arrow = "--------------------->";

  static void i(tag, data) {
    print("${AppConstants.nameApp}:INFO:[$tag]:$_arrow $data");
  }

  static void d(tag, data) {
    debugPrint('${AppConstants.nameApp}:DEBUG:[$tag]: $data');
  }

  static void w(tag, data) {
    print("${AppConstants.nameApp}:WARN:[$tag]:$_arrow $data");
  }

  static void e(tag, data, {StackTrace? stackTrace}) {
    print("${AppConstants.nameApp}:ERROR:[$tag]:$_arrow $data");

    if (stackTrace != null) {
      print("${AppConstants.nameApp}:STACKTRACE:[$tag]:$_arrow $stackTrace");
    }
  }
}
