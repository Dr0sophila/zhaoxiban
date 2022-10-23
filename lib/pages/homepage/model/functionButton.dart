import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';

class functionButton extends StatelessWidget {
  int mode = 0; //0 mode:hompage ;1 mode:addpage;
  String function;
  bool added = true;
  functionButton(
      {Key? key, required this.function, bool? isadded, int? selectmode})
      : super(key: key) {
    isadded == false ? added = false : added = true;
    selectmode == 1 ? mode = 1 : mode = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: added
              ? functions[function][2]
              : Color.fromRGBO(200, 200, 200, 0.5),
        ),
        child: Consumer<functionlist>(
          builder: (context, funclist, child) {
            return MaterialButton(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image(image: AssetImage(functions[function][1])),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      functions[function][0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'weird'),
                    ),
                  )
                ],
              ),
              onPressed: () {
                if (mode == 1) {
                  if (funclist.added.contains(function))
                    funclist.rmfunc(function);
                  else
                    funclist.addfunc(function);
                }
              },
            );
          },
        ));
  }
}

Map functions = {
  "font": ["一键字体", 'assets/img/font.png', Color.fromRGBO(58, 96, 222, 1)],
  "alart": ["意外警报", 'assets/img/alart.png', Color.fromRGBO(196, 35, 35, 1)],
  "dick": ["健康码", 'assets/img/dick.png', Color.fromRGBO(55, 166, 77, 1)],
  "calender": ["日历", 'assets/img/calender.png', Color.fromRGBO(23, 79, 44, 1)],
  "bus": ["坐公交", 'assets/img/bus.png', Color.fromRGBO(36, 50, 105, 1)],
  "light": ["手电筒", 'assets/img/light.png', Color.fromRGBO(214, 193, 2, 1)],
  "taxi": ["出租车", 'assets/img/taxi.png', Color.fromRGBO(0, 141, 207, 1)],
  "weather": [
    "天气预报",
    'assets/img/weather.png',
    Color.fromRGBO(63, 133, 161, 1)
  ],
  "news": ["新闻联播", 'assets/img/news.png', Color.fromRGBO(205, 116, 102, 1)],
  "qr": ["扫一扫", 'assets/img/qr.png', Color.fromRGBO(166, 75, 56, 1)],
  "expired": ["过期检测", 'assets/img/expired.png', Color.fromRGBO(74, 69, 40, 1)],
  "routine": ["每日行程", 'assets/img/routine.png', Color.fromRGBO(74, 69, 40, 1)],
  "dialect": ["方言转化", 'assets/img/dialect.png', Color.fromRGBO(196, 27, 84, 1)],
};
