import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/helper.dart';
import 'package:shopnthrive/domain/models/models.dart';

class GetProducts {
  final repo = ProductsRepository();
  final helper = Helper();

  GetProducts();

  Stream<List<Product>> execute() {
    return repo.getProducts();
  }

  List<ExpansionPanelCategoryItem> toProductsByCategory(
      List<Product> products) {
    return helper.toProductsByCategory(products);
  }
}
