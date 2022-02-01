import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/ui/products/components/product_item.dart';

class ExpansionPanelCategoryItem {
  final Category category;
  List<ProductItem> products;

  ExpansionPanelCategoryItem({required this.category, required this.products});
}
