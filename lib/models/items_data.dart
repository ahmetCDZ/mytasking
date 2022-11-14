import 'package:flutter/foundation.dart';
import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item('Peynir al', false),
    Item('Çöpü at', false),
    Item('Faturayı öde', false),
  ];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }

  void itemAdd(String ekle) {
    items.add(Item(ekle, true));
    notifyListeners();
  }
}
