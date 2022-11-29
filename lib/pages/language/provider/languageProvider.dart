import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSetting with ChangeNotifier {
  String appLanguage = '普通话'; //存选择的方言
  int item = 0;
  synchronize() async {
    final data = await SharedPreferences.getInstance();
    if (data.getString('language') == null) {
      // appLanguage = '普通话';
      data.setString('language', appLanguage);
      data.setInt('language_index', item);
    } else {
      appLanguage = data.getString('language'); //读数据
      item = data.getInt('language_index');
    }
  }

  void getLanguage(String language, int index) async {
    appLanguage = language;
    item = index;
    print(appLanguage);
    notifyListeners();
    final data = await SharedPreferences.getInstance(); //存入磁盘
    data.setString('language', appLanguage);
    data.setInt('language_index', item);
  }
}
