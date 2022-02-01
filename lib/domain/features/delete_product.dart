import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/strings.dart';

class DeleteProduct {
  final repo = ProductsRepository();
  DeleteProduct();

  Future<String> execute(Product product) async {
    await repo.deleteProduct(product);
    return ShopNThriveStrings.productRemoved(product.name);
  }
}
