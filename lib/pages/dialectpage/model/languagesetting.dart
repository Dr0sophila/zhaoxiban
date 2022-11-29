import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';

import '../../../main.dart';

class dialect extends StatefulWidget {
  dialect({Key key}) : super(key: key);
  String languageset;

  @override
  State<dialect> createState() => _dialectState();
}

class _dialectState extends State<dialect> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageSetting>(builder: (context, language, child) {
      return MaterialButton(
          child: Container(
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              language.appLanguage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          onPressed: () {
            router.navigateTo(context, "language",
                transition: TransitionType.fadeIn);
          });
    });
  }
}
