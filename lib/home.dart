import 'package:flutter/material.dart';
import 'package:shopnthrive/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop & Thrive',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Container(
        color: ShopNThriveColors.primary,
      ),
    );
  }
}
