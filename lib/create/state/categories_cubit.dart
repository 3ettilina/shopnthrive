import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/data/models/category.dart';
import 'package:shopnthrive/strings.dart';

// This Cubit stores information of all the Categories
// and contains methods to update (add/remove) them
class CategoriesCubit extends Cubit<List<Category>> {
  // TODO: Create an instance of the service to return data

  CategoriesCubit() : super([]);

  void getCategories() => emit(state); // Will soon fetch from service

  String addCategory(String name, Color color) {
    if (name.isEmpty) {
      return ShopNThriveStrings.categoryNameMissing();
    } else if (state.any((element) => element.name == name)) {
      return ShopNThriveStrings.categoryNameDuplicated();
    } else {
      Category newCategory = Category(name: name, color: color);
      state.add(newCategory); // Call the service
      emit(state);
      return ShopNThriveStrings.categoryAdded(newCategory.name);
    }
  }

  String removeCategory(Category toBeDeleted) {
    state.remove(toBeDeleted); // Call the service
    emit(state);
    return ShopNThriveStrings.categoryAdded(toBeDeleted.name);
  }
}
