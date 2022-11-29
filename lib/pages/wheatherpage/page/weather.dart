import 'package:flutter/material.dart';
import 'package:zhaoxiban/config/request/methods.dart';

import '../weatherlist.dart';

class wheather extends StatefulWidget {
  const wheather({Key key}) : super(key: key);

  @override
  State<wheather> createState() => _wheatherState();
}

class _wheatherState extends State<wheather> {
  @override
  void initState() {
    super.initState();
    initToken();
  }

  String todayd = "";
  String todayn = "";
  String todaydw = "loading";
  String todaynw = "loading";

  String tomorrowd = "";
  String tomorrown = "";
  String tomorrowdw = "loading";
  String tomorrownw = "loading";
  initToken() async {
    var request = await DioUtil.getRequest("weather");

    setState(() {
      request = request["data"]["forecasts"][0]["casts"];
      todayd = request[0]["daytemp"];
      todayn = request[0]["nighttemp"];
      todaydw = request[0]["dayweather"];
      todaynw = request[0]["nightweather"];

      tomorrowd = request[1]["daytemp"];
      tomorrown = request[1]["nighttemp"];
      tomorrowdw = request[1]["dayweather"];
      tomorrownw = request[1]["nightweather"];
    });
  }

  Widget build(BuildContext context) {
    print("the weather is");
    print(weathertype[todaydw]);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(63, 133, 161, 11),
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          title: const Text(
            "天气预报",
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
                image: AssetImage("assets/img/weatherbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Card(
                  color: const Color.fromRGBO(154, 173, 178, 0.4),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 6 / 7,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${DateTime.now().day}日",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            children: [
                              Image(
                                height: 90,
                                width: 90,
                                image: AssetImage(
                                    "assets/img/${weathertype[todaydw]}.png"),
                              ),
                              Image(
                                height: 90,
                                width: 90,
                                image: AssetImage(
                                    "assets/img/${weathertype[todaynw]}.png"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Text(
                            "$todayn~$todayd℃",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(41, 107, 168, 1),
                              fontSize: 40.0,
                            ),
                          ),
                        ],
                      )),
                ),
                Card(
                  color: const Color.fromRGBO(154, 173, 178, 0.4),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 6 / 7,
                      height: MediaQuery.of(context).size.height * 1 / 3,
                      child: Row(
                        children: [
                          const Text(
                            "福州",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(41, 107, 168, 1),
                              fontSize: 40.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: 2,
                            height: MediaQuery.of(context).size.height * 1 / 3,
                            child: const DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Column(
                            children: [
                              const Text(
                                "明日",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Image(
                                    height: 80,
                                    width: 80,
                                    image: AssetImage(
                                        "assets/img/${weathertype[todaydw]}.png"),
                                  ),
                                  Image(
                                    height: 80,
                                    width: 80,
                                    image: AssetImage(
                                        "assets/img/${weathertype[todaydw]}.png"),
                                  ),
                                ],
                              ),
                              Text(
                                "$tomorrown~$tomorrowd℃",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(41, 107, 168, 1),
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            )));
  }
}
