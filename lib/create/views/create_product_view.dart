import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/create/components/components.dart';
import 'package:shopnthrive/create/state/state.dart';
import 'package:shopnthrive/data/models/models.dart';

import '../../theme.dart';

class CreateProductView extends StatefulWidget {
  const CreateProductView({Key? k}) : super(key: k);

  @override
  State<StatefulWidget> createState() => CreateProductViewState();
}

class CreateProductViewState extends State<CreateProductView> {
  final _nameIptController = TextEditingController();
  String name = '';
  Category? category;
  Color categoryColor = ShopNThriveColors.lightOceanBlue;
  File? image;

  @override
  void initState() {
    // Set listener for Name input
    _nameIptController.addListener(() {
      name = _nameIptController.text;
    });
    super.initState();
  }

  void saveProduct(ProductsCubit cubit) {
    String response = cubit.addProduct(name, category, image);

    // Notify the user
    SnackBar snackbar = SnackBar(content: Text(response));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void _selectCategory(Category? category) {
    setState(() {
      this.category = category;
    });
  }

  void _selectImage(File image) {
    setState(() {
      this.image = image;
    });
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext contx) {
          return BottomSheetImageSelector(
            onImageSelected: _selectImage,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, List<Category>>(
        builder: (context, state) {
      CategoriesCubit categoriesCubit =
          BlocProvider.of<CategoriesCubit>(context);
      return BlocBuilder<ProductsCubit, List<Product>>(
          builder: (context, state) {
        ProductsCubit productsCubit = BlocProvider.of<ProductsCubit>(context);

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldTitle(text: 'Name'),
              TextField(
                controller: _nameIptController,
                cursorColor: categoryColor,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'i.e. Marcel Calzados\' Sandals',
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const FieldTitle(text: 'Category'),
              DropdownCategories(
                  context: context,
                  categories: categoriesCubit.state,
                  onCategorySelected: _selectCategory),
              const SizedBox(
                height: 30,
              ),
              const FieldTitle(text: 'Image'),
              ProductImage(
                onClick: () => _showPicker(context),
                image: image,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonMainFullWidth(
                  onPressed: () => saveProduct(productsCubit), text: 'Save')
            ],
          ),
        );
      });
    });
  }
}
