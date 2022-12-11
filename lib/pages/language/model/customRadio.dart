import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';

List<RadioModel> sampleData = <RadioModel>[];

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  String language = '普通话'; //选择的方言
  @override
  void initState() {
    if (sampleData.length <= 0) {
      sampleData.add(RadioModel(false, '✔', '普通话'));
      sampleData.add(RadioModel(false, '✔', '安徽合肥话'));
      sampleData.add(RadioModel(false, '✔', '上海话'));
      sampleData.add(RadioModel(false, '✔', '粤语'));
      sampleData.add(RadioModel(false, '✔', '山东话'));
      sampleData.add(RadioModel(false, '✔', '东北话'));
      sampleData.add(RadioModel(false, '✔', '内蒙古方言'));
      sampleData.add(RadioModel(false, '✔', '四川话'));
      sampleData.add(RadioModel(false, '✔', '成都话'));
      sampleData.add(RadioModel(false, '✔', '湖北话'));
      sampleData.add(RadioModel(false, '✔', '湖南话'));
      sampleData.add(RadioModel(false, '✔', '陕西话'));
      sampleData.add(RadioModel(false, '✔', '台湾普通话'));
      sampleData.add(RadioModel(false, '✔', '河南话'));
      sampleData.add(RadioModel(false, '✔', '香港粤语'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child:
        Consumer<LanguageSetting>(builder: (context, funcLanguage, child) {
      // sampleData.forEach((element) => element.isSelected = false);
      sampleData[funcLanguage.item].isSelected = true;
      return ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            //highlightColor: Colors.red,
            splashColor: Color.fromRGBO(125, 0, 15, 1),

            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
                language = sampleData[index].text;
                funcLanguage.getLanguage(language, index);
                print(language);
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      );
    }));
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 2.0,
        color: Color.fromRGBO(196, 196, 196, 1),
      ))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            //单选按钮
            margin: EdgeInsets.only(bottom: 10.0),
            height: 45.0,
            width: 45.0,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color:
                          _item.isSelected ? Colors.white : Colors.transparent,
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                      fontFamily: 'weird')),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected
                  ? Color.fromRGBO(125, 0, 15, 1)
                  : Colors.transparent,
              border: Border.all(
                  width: 3.0,
                  color: _item.isSelected
                      ? Color.fromRGBO(125, 0, 15, 1)
                      : Color.fromRGBO(196, 196, 196, 1)),
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
            ),
          ),
          Container(
            //方言文字
            margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(_item.text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'SHS')),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
