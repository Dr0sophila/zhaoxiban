import 'package:flutter/material.dart';

class Chinese extends StatefulWidget {
  Chinese({Key key}) : super(key: key);
  String languageset;

  @override
  State<Chinese> createState() => _ChineseState();
}

class _ChineseState extends State<Chinese> {
  @override
  Widget build(BuildContext context) {
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
          child: const Text(
            "普通话",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        onPressed: () {});
  }
}
