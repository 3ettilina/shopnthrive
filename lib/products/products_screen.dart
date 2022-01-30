import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/create/state/state.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/products/components/components.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? k}) : super(key: k);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, List<Product>>(builder: (context, state) {
      ProductsCubit cubit = BlocProvider.of<ProductsCubit>(context);
      Map<Category, List<Product>>? productsByCategory =
          cubit.getProductsByCategory();
      return Container(
          padding: const EdgeInsets.all(16),
          child: productsByCategory != null
              ? CategoryExpansionPanel(categoryProducts: productsByCategory)
              : Container(
                  height: 200,
                  color: Colors.amber[400],
                ));
    });
  }
}
