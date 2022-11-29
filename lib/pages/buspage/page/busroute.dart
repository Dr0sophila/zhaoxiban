// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zhaoxiban/pages/buspage/model/plan.dart';

class BusRoute extends StatelessWidget {
  BusRoute({Key key, this.from, this.to, this.info}) : super(key: key);
  String from;
  String to;
  List<dynamic> info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: const Color.fromRGBO(37, 51, 101, 1),
          title: const Text(
            "坐公交",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/busbackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          from,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: const Color.fromRGBO(37, 51, 101, 1),
                            fontSize: 25.0,
                          ),
                        ),
                        const Image(
                          image: AssetImage("assets/img/point.png"),
                        ),
                        Text(
                          to,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: const Color.fromRGBO(37, 51, 101, 1),
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    )),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: info.length,
                  itemBuilder: (context, count) {
                    return Plan(
                      data: info[count],
                    );
                  }),
            ],
          ),
        ));
  }
}
