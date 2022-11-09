import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(196, 35, 35, 1),
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          title: const Text(
            "意外警报",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/calenderbackground.png"),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
