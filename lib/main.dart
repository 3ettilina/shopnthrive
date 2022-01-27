import 'package:flutter/material.dart';
import 'package:shopnthrive/home.dart';
import 'package:shopnthrive/theme.dart';

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
