import 'package:shopnthrive/data/models/models.dart';

class ExpansionPanelCategoryItem {
  final Category category;
  final List<Product> products;
  final bool isExpanded;

  ExpansionPanelCategoryItem(
      {required this.category,
      required this.products,
      required this.isExpanded});
}
