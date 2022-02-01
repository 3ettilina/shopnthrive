import 'package:flutter/material.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/domain/get_products.dart';

import 'components/components.dart';

class ProductsScreen extends StatelessWidget {
  final getProducts = GetProducts();

  ProductsScreen({Key? k}) : super(key: k);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: getProducts.execute(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          final productsByCategory = getProducts.toProductsByCategory(products);
          return Container(
              padding: const EdgeInsets.all(16),
              child: productsByCategory.isNotEmpty
                  ? CategoryExpansionPanel(categoryProducts: productsByCategory)
                  : Container(
                      height: 200,
                      color: Colors.amber[400],
                    ));
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
