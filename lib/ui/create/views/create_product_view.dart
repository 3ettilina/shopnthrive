import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/domain/create_product.dart';
import 'package:shopnthrive/domain/get_categories.dart';
import 'package:shopnthrive/theme.dart';
import 'package:shopnthrive/ui/ui.dart';

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

  final getCategories = GetCategories();
  final createProduct = CreateProduct();

  @override
  void initState() {
    // Set listener for Name input
    _nameIptController.addListener(() {
      name = _nameIptController.text;
    });
    super.initState();
  }

  void saveProduct() async {
    Future<String> response = createProduct.execute(name, category, image);
    String message = '';
    await response.then((msg) => message = msg);
    // Notify the user
    SnackBar snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void _selectCategory(Category? category) {
    this.category = category;
  }

  void _selectImage(File image, ProductImageCubit cubit) {
    cubit.setImage(image);
    this.image = image;
  }

  void _showPicker(BuildContext context, ProductImageCubit cubit) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext contx) {
          return BottomSheetImageSelector(
            onImageSelected: (file) => _selectImage(file, cubit),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
          StreamBuilder<List<Category>>(
              stream: getCategories.execute(),
              builder: (context, snapshots) {
                if (snapshots.hasData) {
                  final categories = snapshots.data!;
                  return DropdownCategories(
                      context: context,
                      categories: categories,
                      onCategorySelected: _selectCategory);
                }
                if (snapshots.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                        color: ShopNThriveColors.darkOceanBlue));
              }),
          const SizedBox(
            height: 30,
          ),
          const FieldTitle(text: 'Image'),
          BlocBuilder<ProductImageCubit, File?>(
            builder: (context, state) {
              ProductImageCubit cubit =
                  BlocProvider.of<ProductImageCubit>(context);
              return ProductImage(
                onClick: () => _showPicker(context, cubit),
                image: state,
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          ButtonMainFullWidth(onPressed: () => saveProduct(), text: 'Save')
        ],
      ),
    );
  }
}
