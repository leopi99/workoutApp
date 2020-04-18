import 'package:flutter/foundation.dart';

class NavState with ChangeNotifier {
  int index = 0;
  int dayIndex;
  NavState({@required this.dayIndex});

  void changePage(int nIndex) {
    if (index != nIndex) {
      index = nIndex;
      notifyListeners();
    }
  }

  void changeDay(int nIndex) {
    if (dayIndex != nIndex) {
      dayIndex = nIndex;
      notifyListeners();
    }
  }
}
