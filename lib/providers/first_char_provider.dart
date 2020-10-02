import 'package:flutter/foundation.dart';

class FirstCharProvider with ChangeNotifier {
  String firstChar;

  FirstCharProvider({this.firstChar});

  void setFirstChar(String char) {
    this.firstChar = char;
    notifyListeners();
  }
}
