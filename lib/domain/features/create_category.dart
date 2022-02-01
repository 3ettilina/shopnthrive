import 'package:flutter/material.dart';
import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/strings.dart';

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
