import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactList with ChangeNotifier {
  List name = ["psy", "magcialfly"];
  List tel = ["123", "123"];
  int contactsnum = 2;

  synchronize() async {
    final data = await SharedPreferences.getInstance();
    if (data.getStringList('contactsnum') != null) {
      name = data.getStringList('name');
      tel = data.getStringList('tel');
      contactsnum = data.getInt('contactsnum');
    }
  }

  addfunc(String addname, String addtel) async {
    contactsnum++;
    name.add(addname);
    tel.add(addtel);
    notifyListeners();

    final data = await SharedPreferences.getInstance();
    data.setStringList('name', name);
    data.setStringList('tel', tel);
    data.setInt("contactsnum", contactsnum);
  }

  rmfunc(String addname, String addtel) async {
    contactsnum--;
    name.remove(addname);
    tel.remove(addtel);
    notifyListeners();

    final data = await SharedPreferences.getInstance();
    data.setStringList('name', name);
    data.setStringList('tel', tel);
    data.setInt("contactsnum", contactsnum);
  }
}
