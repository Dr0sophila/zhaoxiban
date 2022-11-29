import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:zhaoxiban/pages/Torch/Torch.dart';
import 'package:zhaoxiban/pages/alarmpage/page/alarm.dart';
import 'package:zhaoxiban/pages/buspage/page/bus.dart';
import 'package:zhaoxiban/pages/calender/page/calender.dart';
import 'package:zhaoxiban/pages/dialectpage/page/dialect.dart';
import 'package:zhaoxiban/pages/language/page/language.dart';
import 'package:zhaoxiban/pages/wheatherpage/page/weather.dart';
import '../../pages/healthpage/page/toalipay.dart';
import '../../pages/routine/page/routine.dart';

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

Handler routineHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return const Routine();
});

Handler healthHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return toalipay();
});

Handler dialectHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return DialectPage();
});

Handler wheathertHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return wheather();
});

Handler busHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Bus();
});

Handler torchHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return light();
});
