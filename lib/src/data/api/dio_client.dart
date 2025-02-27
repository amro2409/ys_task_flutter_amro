import 'dart:io';


import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

import 'package:path_provider/path_provider.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/log.dart';



class DioClient {
  static const _tag = "DioClient";

  final Dio dio;
  static String? cookies;

  DioClient() : dio = Dio() {
    // config base
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 90),
      receiveTimeout: const Duration(seconds: 60),
    );

    init();
  }

  Future init() async {
    var cookieJar = await getCookiePath();
    // Interceptors (option)
    dio
      ..interceptors.add(LogInterceptor(request: true, responseBody: true, error: true))
      //..interceptors.add(CookieManager(cookieJar))
      ..interceptors.add(interceptorWrapper);
  }

  var interceptorWrapper = InterceptorsWrapper(
    onRequest: (options, handler) {
      //    print request details in logcat
      Log.i("$_tag:Request", "${options.method} ${options.path}");
      Log.i("$_tag:Query Parameters", "${options.queryParameters}");
      Log.i("$_tag:Headers", "${options.headers}");
      // continuous request handle
      return handler.next(options);
    },
    onResponse: (response, handler) {

      //  print response details in logcat
      Log.i("$_tag:Response", "${response.statusCode} ${response.data}");

      // continuous response handle
      return handler.next(response);
    },
    onError: (DioException e, handler) {

      //    print error details in logcat
      Log.e("$_tag:Error", "${e.response?.statusCode} ${e.message}");
      // continuous error handle
      return handler.next(e);
    },
  );

  static Future initCookies() async {
    Log.d(_tag, "st initCookies");
    cookies = await getCookies();
    Log.d(_tag, "yes initCookies");
  }

  static Future<PersistCookieJar> getCookiePath() async {
    Directory appDocDir = await getApplicationSupportDirectory();
    String appDocPath = appDocDir.path;
    return PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocPath));
  }

  static Future<String?> getCookies() async {
    var cookieJar = await getCookiePath();
    final uri = Uri.parse(AppConstants.baseUrl);
    var cookies = await cookieJar.loadForRequest(uri);

    var cookie = CookieManager.getCookies(cookies);

    return cookie;
  }
}

