import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/helper.dart';
import 'package:shopnthrive/domain/models/models.dart';

class GetFavorites {
  final repo = ProductsRepository();
  final helper = Helper();
  GetFavorites();

  Stream<List<Product>> execute() {
    return repo.getFavoriteProducts();
  }

  List<ExpansionPanelCategoryItem> toProductsByCategory(
      List<Product> products) {
    return helper.toProductsByCategory(products);
  }
}
