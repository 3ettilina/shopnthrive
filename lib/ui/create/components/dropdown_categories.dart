import 'package:flutter/material.dart';
import 'package:shopnthrive/domain/models/models.dart';

class DropdownCategories extends StatefulWidget {
  final BuildContext context;
  final List<Category> categories;
  final Function onCategorySelected;

  const DropdownCategories(
      {required this.context,
      required this.categories,
      required this.onCategorySelected,
      Key? k})
      : super(key: k);

  @override
  State<StatefulWidget> createState() => DropdownCategoriesState();
}

class DropdownCategoriesState extends State<DropdownCategories> {
  Category? currentCategory;

  void onCategorySelected(Category? category) {
    setState(() {
      currentCategory = category;
    });
    widget.onCategorySelected(category);
  }

  List<DropdownMenuItem<Category>> getDropdownList(
      BuildContext context, List<Category> categories) {
    List<DropdownMenuItem<Category>> items = categories
        .map((e) => DropdownMenuItem<Category>(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Container(
                    color: e.color,
                    height: 8,
                  ),
                ],
              ),
              value: e,
            ))
        .toList();
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: currentCategory,
      items: getDropdownList(context, widget.categories),
      onChanged: onCategorySelected,
      isExpanded: true,
      itemHeight: 64,
      hint: Text(
        'Select the category for your product',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      disabledHint: Text(
        'No category was created. Please tap on the switch and create one first :)',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
