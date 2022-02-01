import 'package:flutter/material.dart';
import 'package:shopnthrive/router/router.dart';
import 'package:shopnthrive/ui/favorites/favorites_screen.dart';
import 'package:shopnthrive/ui/ui.dart';

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
      return const FavoritesScreen();
    }
    // List of Products screen
    return ProductsScreen();
  }
}
