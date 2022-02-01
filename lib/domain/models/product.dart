import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopnthrive/domain/models/models.dart';

class Product {
  final String name;
  final Category category;
  final String image;
  bool isFavorite;

  DocumentReference? reference;

  Product(
      {required this.name,
      required this.category,
      required this.image,
      this.isFavorite = false});

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        name: json['name'] as String,
        category: Category.fromJson(json['category']),
        image: json['imageUrl'],
        isFavorite: json['isFavorite'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'category': category.toJson(),
        'imageUrl': image,
        'isFavorite': isFavorite,
      };

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    final product = Product.fromJson(snapshot.data() as Map<String, dynamic>);
    product.reference = snapshot.reference;
    return product;
  }
}
