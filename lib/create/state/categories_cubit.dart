import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/data/models/category.dart';

// This Cubit stores information of all the Categories
// and contains methods to update (add/remove) them
class CategoriesCubit extends Cubit<List<Category>> {
  // TODO: Create an instance of the service to return data

  final List<Category> categories = [];

  CategoriesCubit() : super([]);

  void getCategories() => emit(categories); // Will soon fetch from service

  void addCategory(Category newCategory) {
    // TODO: check uniqueness
    categories.add(newCategory); // Call the service
    emit(categories);
  }

  void removeCategory(Category toBeDeleted) {
    categories.remove(toBeDeleted); // Call the service
    emit(categories);
  }
}
