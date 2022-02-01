import 'package:flutter/material.dart';
import 'package:shopnthrive/data/models/models.dart';

import 'components.dart';

class CategoryExpansionPanel extends StatelessWidget {
  final Map<Category, List<Product>> categoryProducts;

  const CategoryExpansionPanel({required this.categoryProducts, Key? k})
      : super(key: k);

  @override
  Widget build(BuildContext context) {
    List<ExpansionPanel> elements = categoryProducts.entries
        .map<ExpansionPanel>((category) =>
            getCategoryPanel(context, category.key, category.value))
        .toList();
    return ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          // TODO: handle this here
        },
        children: elements);
  }

  ExpansionPanel getCategoryPanel(
      BuildContext context, Category category, List<Product> products) {
    return ExpansionPanel(
      canTapOnHeader: true,
      backgroundColor: category.color,
      headerBuilder: (context, isExpanded) {
        return ListTile(
          key: Key(category.name),
          title: Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white),
          ),
        );
      },
      isExpanded: true,
      body: Column(
        children: getProductItems(context, products),
      ),
    );
  }

  List<ProductItem> getProductItems(
      BuildContext context, List<Product> products) {
    return products
        .map((current) => ProductItem(product: current, k: Key(current.name)))
        .toList();
  }
}
