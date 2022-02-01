import 'package:flutter/material.dart';
import 'package:shopnthrive/domain/models/models.dart';

class ExpansionPanelCategory extends StatelessWidget {
  final List<ExpansionPanelCategoryItem> categoryProducts;

  const ExpansionPanelCategory({required this.categoryProducts, Key? k})
      : super(key: k);

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = categoryProducts
        .map<Widget>((categoryItem) => getCategoryPanel(context, categoryItem))
        .toList();
    return Column(
      children: elements,
    );
  }

  Widget getCategoryPanel(
      BuildContext context, ExpansionPanelCategoryItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ExpansionTile(
        initiallyExpanded: true,
        backgroundColor: item.category.color,
        collapsedBackgroundColor: item.category.color,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        key: Key(item.category.name),
        title: Text(
          item.category.name,
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.white),
        ),
        children: item.products,
      ),
    );
  }
}
