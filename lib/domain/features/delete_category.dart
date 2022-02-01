import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/strings.dart';

class DeleteCategory {
  final repo = CategoriesRepository();
  DeleteCategory();

  Future<String> execute(Category category, List<Product> products) async {
    await repo.deleteCategory(category, products);
    return ShopNThriveStrings.categoryRemoved(category.name);
  }
}
