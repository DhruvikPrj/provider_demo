import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
//ChangeNotifier : it's work like setState, and has Global context.

  int _count = 0;
  int get count => _count;

  void setCount() {
    _count++;

    //it nofifies that value has been changed.
    notifyListeners();
  }
}
