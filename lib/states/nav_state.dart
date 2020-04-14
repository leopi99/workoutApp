import 'package:flutter/foundation.dart';

class NavState with ChangeNotifier {
  int index;

  void changePage(int nIndex) {
    if (index != nIndex) {
      index = nIndex;
      notifyListeners();
    }
  }
}
