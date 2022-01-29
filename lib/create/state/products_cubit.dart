import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/strings.dart';

class ProductsCubit extends Cubit<List<Product>> {
  final List<Product> products = [];

  ProductsCubit() : super([]);

  String addProduct(
    String name,
    Category? category,
    File? image,
  ) {
    if (products.any((element) => element.name == name)) {
      return ShopNThriveStrings.productDuplicated();
    } else if (name.isNotEmpty && category != null && image != null) {
      Product newProduct =
          Product(name: name, category: category, image: image);

      products.add(newProduct);
      emit(products);
      return ShopNThriveStrings.productAdded(newProduct.name);
    } else {
      return ShopNThriveStrings.productFieldsMissing();
    }
  }

  String removeProduct(Product toRemove) {
    products.remove(toRemove);
    emit(products);
    return 'Product removed successfuly: ${toRemove.name}';
  }
}
