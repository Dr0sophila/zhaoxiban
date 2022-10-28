import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:zhaoxiban/pages/alarmpage/page/alarm.dart';
import 'package:zhaoxiban/pages/calender/page/calender.dart';
import 'package:zhaoxiban/pages/language/page/language.dart';

Handler languageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return const Language();
});

Handler calenderHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return const Calender();
});

Handler alarmHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return const Alarm();
});
