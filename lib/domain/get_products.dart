import 'package:shopnthrive/data/api/api.dart';
import 'package:shopnthrive/data/models/models.dart';

class GetProducts {
  final repo = ProductsRepository();

  GetProducts();

  Stream<List<Product>> execute() {
    return repo.getProducts();
  }

  Map<Category, List<Product>> toProductsByCategory(List<Product> products) {
    Map<Category, List<Product>> output = {};

    for (Product product in products) {
      if (output.containsKey(product.category) == true) {
        List<Product> categoryProducts = output.entries
            .firstWhere((map) => map.key.name == product.category.name)
            .value;
        categoryProducts.add(product);
        Map<Category, List<Product>> newEntry = {
          product.category: categoryProducts
        };
        output.addAll(newEntry);
      } else {
        Map<Category, List<Product>> newEntry = {
          product.category: [product]
        };
        output.addAll(newEntry);
      }
    }
    return output;
  }
}
