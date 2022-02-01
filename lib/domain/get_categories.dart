import 'package:shopnthrive/data/api/api.dart';
import 'package:shopnthrive/data/models/category.dart';

class GetCategories {
  final repo = CategoriesRepository();

  GetCategories();

  Stream<List<Category>> execute() => repo.getCategories();
}
