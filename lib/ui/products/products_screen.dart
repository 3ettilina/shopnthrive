import 'package:flutter/material.dart';
import 'package:shopnthrive/domain/features/features.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/ui/products/components/components.dart';

class ProductsScreen extends StatelessWidget {
  final getProducts = GetProducts();

  ProductsScreen({Key? k}) : super(key: k);
  @override
  Widget build(BuildContext context) {
    void _showMessage(String message) {
      SnackBar snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    return StreamBuilder<List<Product>>(
      stream: getProducts.execute(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          final productsByCategory = getProducts.toProductsByCategory(products);
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
