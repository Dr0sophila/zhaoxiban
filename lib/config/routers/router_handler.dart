import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:zhaoxiban/pages/language/page/language.dart';

Handler languageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Language();
});
