import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopnthrive/home.dart';
import 'package:shopnthrive/router/router.dart';
import 'package:shopnthrive/theme.dart';

void main() {
  runApp(const ShopNThriveApp());
}

class ShopNThriveApp extends StatelessWidget {
  const ShopNThriveApp({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop & Thrive',
      home: MultiProvider(
        providers: [BlocProvider(create: (_) => RouterCubit())],
        child: const Home(),
      ),
      theme: ShopNThriveTheme.themeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
