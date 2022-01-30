import 'package:flutter/material.dart';
import 'package:shopnthrive/data/models/models.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product, Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              child: Image.file(product.image,
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
                      backgroundColor: product.category.color.withOpacity(0.4),
                      label: Text(
                        product.category.name,
                        style: Theme.of(context).textTheme.caption,
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
