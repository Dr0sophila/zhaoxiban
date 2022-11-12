import 'package:flutter/material.dart';

class ContactBar extends StatelessWidget {
  ContactBar({Key key, this.name, this.tel}) : super(key: key);
  String name;
  String tel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: MediaQuery.of(context).size.height / 20,
        end: MediaQuery.of(context).size.height / 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid)),
        color: Colors.transparent,
      ),
      child: MaterialButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    backgroundColor: const Color.fromRGBO(232, 232, 232, 0.90),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    children: <Widget>[
                      ListTile(
                        title: Center(
                          child: Column(
                            children: [
                              Text(
                                "删除$name",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MaterialButton(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                11,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        // margin: EdgeInsets.all(30.0),
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              196, 35, 35, 1),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: const Text(
                                          "确认",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40.0,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {}),
                                  MaterialButton(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 0, 255, 47),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular((20.0)),
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
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Image(
                    height: MediaQuery.of(context).size.height / 12,
                    image: const AssetImage("assets/img/remove.png"),
                  )),
              Expanded(
                flex: 3,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
