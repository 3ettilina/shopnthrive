import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/create/categories_cubit.dart';
import 'package:shopnthrive/home.dart';

void main() {
  runApp(const ShopNThriveApp());
}

class ShopNThriveApp extends StatelessWidget {
  const ShopNThriveApp({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shop & Thrive',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
