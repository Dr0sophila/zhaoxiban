import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/homepage/model/functionButton.dart';
import 'package:zhaoxiban/pages/homepage/page/HomePage.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Container(
            child: Text(
              "添加功能",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 25.0,
                  fontFamily: 'weird'),
            ),
          ),
        ),
        body: Consumer<functionlist>(
          builder: (context, list, child) {
            List<Widget> funcList = [];
            for (var item in functions.keys) {
              funcList.add(functionButton(
                selectmode: 1, //add func mode
                function: item,
                isadded: list.added.contains(item),
              ));
            }
            return GridView.count(
                padding: EdgeInsets.all(27),
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 28,
                crossAxisSpacing: 28,
                children: funcList);
          },
        ));
  }
}
