import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shopnthrive/create/categories_cubit.dart';
import 'package:shopnthrive/data/models/category.dart';
import 'package:shopnthrive/theme.dart';

class CreateCategoryView extends StatefulWidget {
  const CreateCategoryView({Key? k}) : super(key: k);

  @override
  State<StatefulWidget> createState() => _CreateCategoryViewState();
}

class _CreateCategoryViewState extends State<CreateCategoryView> {
  final _nameIptController = TextEditingController();
  String categoryName = '';
  Color categoryColor = ShopNThriveColors.primaryAccent;

  @override
  void initState() {
    _nameIptController.addListener(() {
      categoryName = _nameIptController.text;
    });

    super.initState();
  }

  @override
  void dispose() {
    _nameIptController.dispose();

    super.dispose();
  }

  void changeColor(Color newColor) {
    setState(() {
      categoryColor = newColor;
    });
  }

  void saveCategory() {
    // TODO: implement save
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, List<Category>>(
        builder: (context, state) {
      CategoriesCubit cubit = BlocProvider.of<CategoriesCubit>(context);
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add input field
            Text(
              'Name',
              style: Theme.of(context).textTheme.headline6,
            ),
            TextField(
              controller: _nameIptController,
              cursorColor: categoryColor,
              decoration: InputDecoration(
                hintText: 'i.e. Shoes, Electronics, Food',
                hintStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Color',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              children: [
                OutlinedButton(
                  child: Text(
                    'Pick',
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SlidePicker(
                                pickerColor: categoryColor,
                                onColorChanged: changeColor,
                                indicatorBorderRadius:
                                    const BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                enableAlpha: false,
                              ),
                              OutlinedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Close',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: Container(
                  height: 30,
                  color: categoryColor,
                ))
              ],
            ),
            const SizedBox(height: 60),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Category cat =
                          Category(name: categoryName, color: categoryColor);
                      cubit.addCategory(cat);
                      SnackBar snackbar = SnackBar(
                          content: Text(
                              'New category added: ${cubit.categories.last.name}'));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ShopNThriveColors.secondary),
                    ),
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.button,
                    )),
              ),
            ]),
          ],
        ),
      );
    });
  }
}
