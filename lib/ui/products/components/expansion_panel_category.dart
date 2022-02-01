import 'package:flutter/material.dart';
import 'package:shopnthrive/domain/features/delete_category.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/ui/products/components/components.dart';
import 'package:shopnthrive/ui/products/components/slidable.dart';

class ExpansionPanelCategory extends StatelessWidget {
  final List<ExpansionPanelCategoryItem> categoryProducts;
  final Function showMessage;

  final deleteCategory = DeleteCategory();

  ExpansionPanelCategory(
      {required this.categoryProducts, required this.showMessage, Key? k})
      : super(key: k);

  void onSwipeLeft(BuildContext context, Category category,
      List<ProductItem> productItems) async {
    List<Product> products = productItems
        .map((e) => Product(
            name: e.product.name,
            category: e.product.category,
            image: e.product.image))
        .toList();
    String message = await deleteCategory.execute(category, products);
    showMessage(message);
  }

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
    return SlidableWidget(
        onSwipeLeft: () => onSwipeLeft(context, item.category, item.products),
        onSwipeLeftIcon: Icons.delete_forever_rounded,
        onSwipeLeftText: 'Delete category',
        child: Padding(
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
        ));
  }
}
