import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/category.dart';

class CategoriesCubit extends Cubit<List<Category>> {
  // TODO: Create an instance of the Firebase service to return the categories

  final List<Category> categories = [];

  CategoriesCubit() : super([]);

  void getCategories() => emit(categories);

  void addCategory(Category newCategory) {
    categories.add(newCategory);
    emit(categories);
  }

  void removeCategory(Category toBeDeleted) {
    categories.remove(toBeDeleted);
    emit(categories);
  }
}
