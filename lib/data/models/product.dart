import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopnthrive/data/models/category.dart';

class Product {
  final String name;
  final Category category;
  final String image;

  DocumentReference? reference;

  Product({required this.name, required this.category, required this.image});

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
      name: json['name'] as String,
      category: Category.fromJson(json['category']),
      image: json['imageUrl']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'category': category.toJson(),
        'imageUrl': image
      };

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final product = Product.fromJson(snapshot.data() as Map<String, dynamic>);
    product.reference = snapshot.reference;
    return product;
  }
}
