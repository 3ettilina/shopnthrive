import 'package:flutter/foundation.dart';
import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/ui/products/components/product_item.dart';

class GetProducts {
  final repo = ProductsRepository();

  GetProducts();

  Stream<List<Product>> execute() {
    return repo.getProducts();
  }

  List<ExpansionPanelCategoryItem> toProductsByCategory(
      List<Product> products) {
    List<ExpansionPanelCategoryItem?> output = [];

    for (Product product in products) {
      ExpansionPanelCategoryItem? item = output.firstWhere(
          (element) => element?.category == product.category,
          orElse: () => null);
      if (item != null) {
        List<ProductItem> categoryProducts = item.products;
        ProductItem newProduct =
            ProductItem(product: product, k: Key(product.name));
        categoryProducts.add(newProduct);
        item.products = categoryProducts;
      } else {
        ProductItem newProduct =
            ProductItem(product: product, k: Key(product.name));
        ExpansionPanelCategoryItem newEntry = ExpansionPanelCategoryItem(
            category: product.category, products: [newProduct]);
        output.add(newEntry);
      }
    }

    return output.whereType<ExpansionPanelCategoryItem>().toList();
  }
}
