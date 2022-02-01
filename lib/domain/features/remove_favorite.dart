import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/strings.dart';

class RemoveFavorite {
  final repo = ProductsRepository();
  RemoveFavorite();

  Future<String> execute(Product product) async {
    await repo.removeFavoriteProduct(product);
    return ShopNThriveStrings.favoriteProductRemoved(product.name);
  }
}
