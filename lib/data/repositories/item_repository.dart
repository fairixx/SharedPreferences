import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item_model.dart';

class ItemRepository {
  static const String _storageKey = 'item_list';

  Future<List<ItemModel>> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey) ?? '[]';
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((item) => ItemModel.fromJson(item)).toList();
  }

  Future<void> saveItems(List<ItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_storageKey, jsonString);
  }
}
