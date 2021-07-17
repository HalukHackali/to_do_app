import 'dart:collection';

import 'package:flutter/material.dart';
import './item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    Item(title: 'Peynir Al'),
    Item(title: 'Çöpü At'),
    Item(title: 'Faturayı Öde'),
  ];

  void toggleStatus(int index) {
    // yukarıdaki listedeki kaçıncı elemanın statüsü değişecek
    _items[index].toggleStatus();
    notifyListeners();
  }

  // Ekleme metodu: Kullanıcının verdiği veriyi alıp yukarıdaki listeye eklemek için, item oluşturup onu listeye atacak
  void addItem(String title) {
    _items.add(
      Item(title: title)
    );
    notifyListeners(); // kendisini dinleyen herkese bu değişikliği haber ver!

  }

  // Silme Metodu: 'Dismissible' ile ekrandan silinen item'ın gerçek olarak da widget ağacından silinmesi için.
  void deleteItem(int index){
    _items.removeAt(index);
    notifyListeners();
  }

  // Listenin dışarıdan erişimine engel olmak için 'UnmodifiableListView' sınıfını kullanıyoruz.
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

}
