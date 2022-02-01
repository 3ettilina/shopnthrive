import 'package:flutter/material.dart';
import 'package:shopnthrive/data/api/api.dart';
import 'package:shopnthrive/data/models/models.dart';
import '../strings.dart';

class CreateCategory {
  final repo = CategoriesRepository();

  CreateCategory();

  Future<String> execute(String name, Color color) async {
    if (name.isEmpty) {
      return ShopNThriveStrings.categoryNameMissing();
    } else {
      Category newCategory = Category(name: name, color: color);
      await repo.createCategory(newCategory);
      return ShopNThriveStrings.categoryAdded(name);
    }
  }
}
