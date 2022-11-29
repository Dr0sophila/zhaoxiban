// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionList with ChangeNotifier {
  List<String> added = ["language", "bus"];

  synchronize() async {
    final data = await SharedPreferences.getInstance();
    data.getStringList('added') == null
        ? added = ["language", "calender"]
        : added = data.getStringList('added');
  }

  addfunc(String func) async {
    added.add(func);
    notifyListeners();

    final data = await SharedPreferences.getInstance();
    data.setStringList('added', added);
  }

  rmfunc(String func) async {
    added.remove(func);
    notifyListeners();
    final data = await SharedPreferences.getInstance();
    data.setStringList('added', added);
  }
}
