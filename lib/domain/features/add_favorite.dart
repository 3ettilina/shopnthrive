import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/strings.dart';

class AddFavorite {
  final repo = ProductsRepository();

  AddFavorite();

  Future<String> execute(Product product) async {
    await repo.addFavoriteProduct(product);
    return ShopNThriveStrings.favoriteProductAdded(product.name);
  }
}
