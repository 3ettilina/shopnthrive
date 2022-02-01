import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';

class GetCategories {
  final repo = CategoriesRepository();

  GetCategories();

  Stream<List<Category>> execute() => repo.getCategories();
}
