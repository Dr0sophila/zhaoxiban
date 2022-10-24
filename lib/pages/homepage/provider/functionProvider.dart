import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionList with ChangeNotifier {
  late List<String> added;

  synchronize() async {
    final data = await SharedPreferences.getInstance();
    data.getStringList('added') == null
        ? added = ["font"]
        : added = data.getStringList('added')!;
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
