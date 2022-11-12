import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/contactBar.dart';
import '../provider/contactsProvider.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "添加联系人",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25.0,
              ),
            ),
            const Image(
              image: AssetImage("assets/img/band.png"),
            ),
            Card(
              color: const Color.fromRGBO(232, 232, 232, 1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(
                        image: AssetImage("assets/img/idcard.png"),
                      ),
                      Text(
                        "备注：",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                            color: Color.fromRGBO(187, 38, 36, 1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              color: const Color.fromRGBO(232, 232, 232, 1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(
                        image: AssetImage("assets/img/Phone.png"),
                      ),
                      Text(
                        "备注：",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                            color: Color.fromRGBO(187, 38, 36, 1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            MaterialButton(
                child: Container(
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width / 4,
                  // margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(65, 178, 0, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
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
          ],
        ));
  }
}
