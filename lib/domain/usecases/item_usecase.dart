import '../../data/models/item_model.dart';
import '../../data/repositories/item_repository.dart';

class ItemUseCase {
  final ItemRepository repository;

  ItemUseCase(this.repository);

  Future<List<ItemModel>> loadItems() => repository.loadItems();
  Future<void> saveItems(List<ItemModel> items) => repository.saveItems(items);
}
