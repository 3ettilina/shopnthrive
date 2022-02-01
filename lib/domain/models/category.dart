import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;

  DocumentReference? reference;

  Category({required this.name, required this.color});

  factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
      name: json['name'] as String,
      color: Color(
        json['color'] as int,
      ));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'color': color.value,
      };

  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    final category = Category.fromJson(snapshot.data() as Map<String, dynamic>);
    category.reference = snapshot.reference;
    return category;
  }

  @override
  int get hashCode => hashValues(name, color);

  @override
  operator ==(other) =>
      other is Category && other.name == name && other.color == color;
}
