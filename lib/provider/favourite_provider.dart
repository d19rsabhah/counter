import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _fav = [];

  List<int> get fav => _fav;
  void addItem(int value) {
    _fav.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _fav.remove(value);
    notifyListeners();
  }
}
