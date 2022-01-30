import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/strings.dart';

class ProductsCubit extends Cubit<List<Product>> {
  ProductsCubit() : super([]);

  String addProduct(
    String name,
    Category? category,
    File? image,
  ) {
    if (state.any((element) => element.name == name)) {
      return ShopNThriveStrings.productDuplicated();
    } else if (name.isNotEmpty && category != null && image != null) {
      Product newProduct =
          Product(name: name, category: category, image: image);

      state.add(newProduct);
      emit(state);
      return ShopNThriveStrings.productAdded(newProduct.name);
    } else {
      return ShopNThriveStrings.productFieldsMissing();
    }
  }

  String removeProduct(Product toRemove) {
    state.remove(toRemove);
    emit(state);
    return ShopNThriveStrings.productRemoved(toRemove.name);
  }

  Map<Category, List<Product>>? getProductsByCategory() {
    Map<Category, List<Product>>? output;

    // Check if we have products on the list
    if (state.isNotEmpty) {
      output = {};
    } else {
      return output;
    }

    // Iterate through the products and fill the map
    for (var product in state) {
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
