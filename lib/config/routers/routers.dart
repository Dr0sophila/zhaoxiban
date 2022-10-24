import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'router_handler.dart';

class Routes {
  static String root = '/';
  static String language = '/language';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = fluro.Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const Text('Page not found');
    });

    // 创建pageRoute
    router.define(language, handler: languageHandler);
  }
}
