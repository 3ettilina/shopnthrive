import 'package:flutter/material.dart';
import 'package:shopnthrive/domain/features/get_favorites.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/ui/products/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  final getFavorites = GetFavorites();

  FavoritesScreen({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    void _showMessage(String message) {
      SnackBar snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    return StreamBuilder<List<Product>>(
      stream: getFavorites.execute(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          final productsByCategory =
              getFavorites.toProductsByCategory(products);
          return Container(
              padding: const EdgeInsets.all(16),
              child: productsByCategory.isNotEmpty
                  ? ExpansionPanelCategory(
                      categoryProducts: productsByCategory,
                      showMessage: _showMessage,
                    )
                  : Center(child: Image.asset('assets/empty-box.gif')));
        }
        if (snapshot.hasError) {
          return Center(
            child: Image.asset('assets/error.gif'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
