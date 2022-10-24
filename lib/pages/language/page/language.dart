import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(125, 0, 15, 1),
          leading: MaterialButton(
            onPressed: () {},
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          title: const Text(
            "方言设置",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'weird'),
          ),
        ),
        body: Container());
  }
}
