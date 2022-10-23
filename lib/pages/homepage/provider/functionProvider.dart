import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class functionlist with ChangeNotifier {
  List<String> added = ["alart", "dick"];

  addfunc(String func) {
    added.add(func);
    notifyListeners();
  }

  rmfunc(String func) {
    added.remove(func);
    notifyListeners();
  }
}
