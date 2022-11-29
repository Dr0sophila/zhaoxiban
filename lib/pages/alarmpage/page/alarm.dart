import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/alarmpage/page/calllist.dart';
import '../model/emergencycall.dart';
import '../provider/contactsProvider.dart';
import 'bandingPage.dart';

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
        floatingActionButton: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const Calllist();
              }));
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.white,
              shape: const CircleBorder(),
              primary: const Color.fromRGBO(255, 236, 236, 1),
            ),
            child: const Image(
              image: AssetImage("assets/img/Phone.png"),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          //底部工具栏
          color: const Color.fromRGBO(255, 236, 236, 1),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                  height: MediaQuery.of(context).size.height / 9,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Banding();
                    }));
                  },
                  child: const Image(
                    image: AssetImage("assets/img/band.png"),
                  )),
              MaterialButton(
                  height: MediaQuery.of(context).size.height / 10,
                  onPressed: () {
                    print("emcall");
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            backgroundColor:
                                const Color.fromRGBO(232, 232, 232, 0.90),
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            children: <Widget>[
                              ListTile(
                                title: Center(
                                  child: Column(
                                    children: [
                                      const Text(
                                        "通知所有联系人",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Consumer<ContactList>(
                                              builder: (context, list, child) {
                                            return MaterialButton(
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      11,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  // margin: EdgeInsets.all(30.0),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        196, 35, 35, 1),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: const Text(
                                                    "确认",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                });
                                          }),
                                          MaterialButton(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  11,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 0, 255, 47),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        (20.0)),
                                              ),
                                              child: const Text(
                                                "取消",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: const Image(
                    image: AssetImage("assets/img/emergencyCall.png"),
                  )),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/deadold.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "长按启动",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
              MaterialButton(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Image(
                        image: AssetImage("assets/img/alarmlaunch.png"),
                      )),
                  onPressed: () {},
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            backgroundColor:
                                const Color.fromRGBO(232, 232, 232, 0.90),
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            children: <Widget>[
                              ListTile(
                                title: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.topRight,
                                        child: MaterialButton(
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.red,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      EmergencyCall("110"),
                                      EmergencyCall("120"),
                                      EmergencyCall("119")
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "绑定\n联系人",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "紧急\n警报",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
