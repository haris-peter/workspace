
import 'package:flutter/foundation.dart';

class Notifier extends ChangeNotifier {
  int _count=0;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  void delete(){
    _count = 0;
    notifyListeners();
  }
}