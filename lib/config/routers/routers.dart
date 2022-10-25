import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'router_handler.dart';

class Routes {
  static String root = '/';
  static String language = '/language';
  static String calender = '/calender';
  static String alarm = '/alarm';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = fluro.Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const Text('Page not found');
    });

    router.define(language, handler: languageHandler);
    router.define(calender, handler: calenderHandler);
    router.define(alarm, handler: alarmHandler);
  }
}
