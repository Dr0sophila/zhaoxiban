import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/config/request/methods.dart';
import 'package:zhaoxiban/pages/dialectpage/page/dialect.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';

List<String> num = [
  "一",
  "二",
  "三",
  "四",
  "五",
  "六",
  "七",
  "八",
  "九",
  "十",
  "十一",
  "十二",
  "十三",
  "十四",
  "十五",
  "十六",
  "十七",
  "十八",
  "十九",
  "二十",
  "二十一",
  "二十二",
  "二十三",
  "二十四",
  "二十五",
  "二十六",
  "二十七",
  "二十八",
  "二十九",
  "三十",
  "三十一"
];
List<String> weekday = [
  "一",
  "二",
  "三",
  "四",
  "五",
  "六",
  "日",
];

class Calender extends StatefulWidget {
  const Calender({key}) : super(key: key);
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime dateTime = DateTime.now();
  String lunar = "";
  @override
  void initState() {
    super.initState();
    initToken();
  }

  initToken() async {
    var lunarreq = await DioUtil.getRequest("lunar");

    var context = this.context;
    final dlanguage =
        Provider.of<LanguageSetting>(context, listen: false).appLanguage;
    print("\n\n\n\n");
    print(dlanguage);

    await audio_play.playtext(dlanguage, lunarreq["data"]);
    print(lunarreq["data"]);
    setState(() {
      lunar = lunarreq["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(23, 79, 44, 1),
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
          title: Text(
            "${dateTime.year} ${num[dateTime.month - 1]}月",
            style: const TextStyle(
                color: Colors.white, fontSize: 25.0, fontFamily: 'SHS'),
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
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "${dateTime.day}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(23, 79, 44, 1),
                      fontSize: 160.0,
                      fontFamily: 'SHS'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Divider(
                      indent: 26,
                      endIndent: 26,
                      height: 30.00,
                      thickness: 5,
                      color: Color.fromRGBO(23, 79, 44, 1),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 52,
                      color: const Color.fromRGBO(23, 79, 44, 1),
                      child: Text(
                        "${num[dateTime.day - 1]}日 星期${num[dateTime.weekday - 1]}\n$lunar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40.0,
                            fontFamily: 'SHS'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 52) / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(23, 79, 44, 1),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                "宜",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(23, 79, 44, 1),
                                    fontSize: 57.0,
                                    fontFamily: 'SHS'),
                              ),
                              Text(
                                "祈福 祭祀\n会友 交易",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(23, 79, 44, 1),
                                    fontSize: 20.0,
                                    fontFamily: 'SHS'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 52) / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(23, 79, 44, 1),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                "忌",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(23, 79, 44, 1),
                                    fontSize: 57.0,
                                    fontFamily: 'SHS'),
                              ),
                              Text(
                                "栽种\n求医",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(23, 79, 44, 1),
                                    fontSize: 20.0,
                                    fontFamily: 'SHS'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
