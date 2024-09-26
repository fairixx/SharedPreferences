import 'package:flutter/material.dart';

import '../../data/models/item_model.dart';
import '../../data/repositories/item_repository.dart';
import '../../domain/usecases/item_usecase.dart';

class ItemProvider with ChangeNotifier {
  final ItemUseCase useCase = ItemUseCase(ItemRepository());
  List<ItemModel> _items = [];

  List<ItemModel> get items => _items;

  ItemProvider() {
    loadItems();
  }

  Future<void> loadItems() async {
    _items = await useCase.loadItems();
    notifyListeners();
  }

   Future<void> deleteItem(int index) async {
    _items.removeAt(index);
    await useCase.saveItems(_items);
    notifyListeners();
  }

  Future<void> addItem(String name) async {
    final newItem = ItemModel(name: name);
    _items.add(newItem);
    await useCase.saveItems(_items);
    notifyListeners();
  }
}
