import 'dart:io';
import 'package:shopnthrive/data/models/category.dart';

class Product {
  final String name;
  final Category category;
  final File image;

  Product({required this.name, required this.category, required this.image});
}
