import 'package:flutter/material.dart';
import 'package:shopnthrive/domain/features/delete_product.dart';
import 'package:shopnthrive/domain/features/features.dart';
import 'package:shopnthrive/domain/features/remove_favorite.dart';
import 'package:shopnthrive/domain/models/models.dart';
import 'package:shopnthrive/ui/products/components/slidable.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  final addToFav = AddFavorite();
  final removeFromFav = RemoveFavorite();
  final deleteProduct = DeleteProduct();

  ProductItem({required this.product, Key? k}) : super(key: k);

  void onSwipeRight(BuildContext context) async {
    String message = '';
    if (product.isFavorite) {
      Future<String> response = removeFromFav.execute(product);
      await response.then((msg) => message = msg);
      _showMessage(context, message);
    } else {
      Future<String> response = addToFav.execute(product);
      await response.then((msg) => message = msg);
      _showMessage(context, message);
    }
  }

  void onSwipeLeft(BuildContext context) async {
    await deleteProduct.execute(product);
  }

  void _showMessage(BuildContext context, String message) {
    SnackBar snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return SlidableWidget(
      onSwipeRight: () => onSwipeRight(context),
      onSwipeRightIcon:
          product.isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
      onSwipeRightText:
          product.isFavorite ? 'Remove from favs' : 'Add to favorites',
      onSwipeLeft: () => onSwipeLeft(context),
      onSwipeLeftIcon: Icons.delete_forever_rounded,
      onSwipeLeftText: 'Delete product',
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                child: Image.network(product.image,
                    width: 120, height: 100, fit: BoxFit.cover),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Chip(
                          backgroundColor:
                              product.category.color.withOpacity(0.4),
                          label: Text(
                            product.category.name,
                            style: Theme.of(context).textTheme.caption,
                          ))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => onSwipeRight(context),
                child: Container(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: product.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        )
                      : const Icon(Icons.favorite_border_rounded),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
