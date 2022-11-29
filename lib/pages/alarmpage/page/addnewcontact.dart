import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contactsProvider.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();

  final FocusNode focusNodename = FocusNode();
  final FocusNode focusNodetel = FocusNode();

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "添加联系人",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25.0,
                ),
              ),
              Image(
                height: MediaQuery.of(context).size.height / 8,
                image: const AssetImage("assets/img/band.png"),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                      child: TextField(
                        focusNode: focusNodename,
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 25.0,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '联系人姓名',
                          hintStyle: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        onSubmitted: (_) {
                          focusNodetel.requestFocus();
                        },
                      ),
                    ),
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
                          "电话：",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.0,
                              color: Color.fromRGBO(187, 38, 36, 1)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                      child: TextField(
                        focusNode: focusNodetel,
                        controller: telController,
                        style: const TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 25.0,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '联系人电话',
                          hintStyle: TextStyle(
                              fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                        ),
                        onSubmitted: (_) {},
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<ContactList>(builder: (context, list, child) {
                return MaterialButton(
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
                    onPressed: () {
                      String name = nameController.text;
                      String tel = telController.text;
                      if (name == "" || tel == "") {
                        return;
                      }
                      print(name);
                      print(tel);
                      list.addfunc(name, tel);
                      Navigator.pop(context);
                    });
              }),
            ],
          ),
        ));
  }
}
