import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';
import '../../../main.dart';

class FunctionButton extends StatelessWidget {
  int mode = 0; //0 mode:hompage ;1 mode:addpage;
  String function;
  bool added = true;
  FunctionButton(
      {Key? key, required this.function, bool? isadded, int? selectmode})
      : super(key: key) {
    isadded == false ? added = false : added = true;
    selectmode == 1 ? mode = 1 : mode = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: added
              ? functions[function][2]
              : const Color.fromRGBO(200, 200, 200, 0.5),
        ),
        child: Consumer<FunctionList>(
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
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'weird'),
                    ),
                  )
                ],
              ),
              onPressed: () {
                if (mode == 0) {
                  router.navigateTo(context, "/$function",
                      transition: TransitionType.fadeIn);
                }
                if (mode == 1) {
                  if (funclist.added.contains(function)) {
                    funclist.rmfunc(function);
                  } else {
                    funclist.addfunc(function);
                  }
                }
              },
            );
          },
        ));
  }
}

Map functions = {
  "font": ["一键字体", 'assets/img/font.png', const Color.fromRGBO(58, 96, 222, 1)],
  "alarm": [
    "意外警报",
    'assets/img/alart.png',
    const Color.fromRGBO(196, 35, 35, 1)
  ],
  "dick": ["健康码", 'assets/img/dick.png', const Color.fromRGBO(55, 166, 77, 1)],
  "calender": [
    "日历",
    'assets/img/calender.png',
    const Color.fromRGBO(23, 79, 44, 1)
  ],
  "bus": ["坐公交", 'assets/img/bus.png', const Color.fromRGBO(36, 50, 105, 1)],
  "light": [
    "手电筒",
    'assets/img/light.png',
    const Color.fromRGBO(214, 193, 2, 1)
  ],
  "taxi": ["出租车", 'assets/img/taxi.png', const Color.fromRGBO(0, 141, 207, 1)],
  "weather": [
    "天气预报",
    'assets/img/weather.png',
    const Color.fromRGBO(63, 133, 161, 1)
  ],
  "news": [
    "新闻联播",
    'assets/img/news.png',
    const Color.fromRGBO(205, 116, 102, 1)
  ],
  "qr": ["扫一扫", 'assets/img/qr.png', const Color.fromRGBO(166, 75, 56, 1)],
  "expired": [
    "过期检测",
    'assets/img/expired.png',
    const Color.fromRGBO(74, 69, 40, 1)
  ],
  "routine": [
    "每日行程",
    'assets/img/routine.png',
    const Color.fromRGBO(74, 69, 40, 1)
  ],
  "dialect": [
    "方言转化",
    'assets/img/dialect.png',
    const Color.fromRGBO(196, 27, 84, 1)
  ],
  "language": [
    "方言设置",
    'assets/img/language.png',
    const Color.fromRGBO(125, 0, 15, 1)
  ],
};
