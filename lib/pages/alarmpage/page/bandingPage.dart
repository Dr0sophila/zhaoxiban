import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/contactBar.dart';
import '../provider/contactsProvider.dart';
import 'addnewcontact.dart';

class Banding extends StatefulWidget {
  const Banding({Key key}) : super(key: key);

  @override
  State<Banding> createState() => _BandingState();
}

class _BandingState extends State<Banding> {
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
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "绑定联系人",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AddContact();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage("assets/img/add.png"),
                    ),
                    Text(
                      "添加",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                )),
            Consumer<ContactList>(builder: (context, contactList, child) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: contactList.contactsnum,
                      itemExtent: MediaQuery.of(context).size.height / 9,
                      itemBuilder: (BuildContext context, int index) {
                        return RemoveContactBar(
                          name: contactList.name[index],
                          tel: contactList.tel[index],
                        );
                      }));
            })
          ],
        ));
  }
}
