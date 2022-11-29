import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/config/request/methods.dart';
import 'package:zhaoxiban/pages/dialectpage/model/chinese.dart';
import 'package:zhaoxiban/pages/language/page/language.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';

import '../model/languagesetting.dart';

class DialectPage extends StatefulWidget {
  @override
  _DialectPageState createState() => _DialectPageState();
}

class _DialectPageState extends State<DialectPage> {
  bool mode = true;
  TextEditingController Controllerdes = TextEditingController();
  FocusNode trans = FocusNode();
  @override
  Widget build(BuildContext context) {
    final dlanguage = Provider.of<LanguageSetting>(context).appLanguage;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: const Color.fromRGBO(196, 27, 84, 1),
          title: const Text(
            "remember  to complete",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'weird'),
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 222, 222, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: mode
                    ? [
                        dialect(),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              mode = !mode;
                            });
                          },
                          child: const Image(
                            image: AssetImage("assets/img/transform.png"),
                          ),
                        ),
                        Chinese()
                      ]
                    : [
                        Chinese(),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              mode = !mode;
                            });
                          },
                          child: const Image(
                            image: AssetImage("assets/img/transform.png"),
                          ),
                        ),
                        dialect(),
                      ],
              ),
              Card(
                color: const Color.fromRGBO(232, 232, 232, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width * 3 / 4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: TextField(
                      focusNode: trans,
                      controller: Controllerdes,
                      style:
                          const TextStyle(fontSize: 25.0, color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 30.0),
                      ),
                      onSubmitted: (_) {},
                      textInputAction: TextInputAction.go,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Image(
                      image: AssetImage("assets/img/record.png"),
                    )),
                onPressed: () {},
              ),
              MaterialButton(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromRGBO(196, 27, 84, 1),
                  ),
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.width / 17,
                  child: const Text(
                    "翻译",
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () async {
                  Map<String, dynamic> formdata = {
                    "role": llist[dlanguage],
                    "text": "珂肖铁傻逼" //Controllerdes.text
                  };
                  print(formdata);
                  var res = await DioUtil.postRequest("textUpload",
                      formData: formdata);
                  print(res["data"]);
                },
              ),
            ],
          ),
        ));
  }
}

Map llist = {
  "安徽合肥话": "x2_xiaofei",
  "上海话": "",
  "粤语": "x2_xiaoqiang",
  "山东话": "x2_xiaodong",
  "东北话": "x2_xiaoqian",
  "内蒙古方言": "x2_xiaobao",
  "四川话": "x3_yezi_sc",
  "成都话": "x3_xiaodu",
  "湖北话": "x2_xiaowang",
  "湖南话": "x2_xiaoqiang",
  "陕西话": "x2_xiaoying",
  "台湾普通话": "x_yuer",
  "河南话": "x2_xiaokun",
  "香港粤语": "x3_xiaoyue"
};
