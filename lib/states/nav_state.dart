import 'package:flutter/foundation.dart';

class NavState with ChangeNotifier {
  int index = 0;

  void changePage(int nIndex) {
    if (index != nIndex) {
      index = nIndex;
      notifyListeners();
    }
  }
}
