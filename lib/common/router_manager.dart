import 'package:flutter/material.dart';
import 'package:shopnthrive/common/router_state.dart';
import 'package:shopnthrive/create/components/components.dart';
import 'package:shopnthrive/create/create_screen.dart';

class RouterManager extends StatelessWidget {
  final RouterState currentScreen;
  const RouterManager({required this.currentScreen, Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    if (currentScreen is CreateProductScreen ||
        currentScreen is CreateCategoryScreen) {
      return const CreateScreen();
    }
    if (currentScreen is ListOfFavoritesScreen) {
      return Column(children: [
        Container(
          child: const FieldTitle(
            text: 'Favorites',
          ),
          color: Colors.amber[400],
        ),
      ]);
    }
    return Container(
      color: Colors.pink[400],
      child: const FieldTitle(
        text: 'List of products',
      ),
    );
  }
}
