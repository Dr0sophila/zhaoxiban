import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/callcontact.dart';
import '../provider/contactsProvider.dart';

class Calllist extends StatefulWidget {
  const Calllist({Key key}) : super(key: key);

  @override
  State<Calllist> createState() => _CalllistState();
}

class _CalllistState extends State<Calllist> {
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
                "联系人",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
            ),
            Consumer<ContactList>(builder: (context, contactList, child) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: contactList.contactsnum,
                      itemExtent: MediaQuery.of(context).size.height / 9,
                      itemBuilder: (BuildContext context, int index) {
                        return ContactBar(
                          name: contactList.name[index],
                          tel: contactList.tel[index],
                        );
                      }));
            })
          ],
        ));
  }
}
