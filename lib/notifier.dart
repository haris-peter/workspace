
import 'package:flutter/foundation.dart';

class Notifier extends ChangeNotifier {
  int count=0;
  int get ncount => count;

  void increment(){
    count++;
    notifyListeners();
  }

  void delete(){
    count = 0;
    notifyListeners();
  }
}