import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/homepage/model/functionButton.dart';
import 'package:zhaoxiban/pages/homepage/page/addPage.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Container(
            child: Text(
              "老年人",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 25.0,
                  fontFamily: 'weird'),
            ),
          ),
          actions: [
            Container(
                child: MaterialButton(
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          //返回要跳转的目标页面
                          return AddPage();
                        },
                      ));
                    }))
          ],
        ),
        body: Consumer<functionlist>(
          builder: (context, list, child) {
            List<Widget> funcList = [];
            for (var item in list.added) {
              funcList.add(functionButton(
                function: item,
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