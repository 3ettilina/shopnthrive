import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shopnthrive/create/components/components.dart';
import 'package:shopnthrive/create/state/state.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/theme.dart';

class CreateCategoryView extends StatefulWidget {
  const CreateCategoryView({Key? k}) : super(key: k);

  @override
  State<StatefulWidget> createState() => _CreateCategoryViewState();
}

class _CreateCategoryViewState extends State<CreateCategoryView> {
  final _nameIptController = TextEditingController();
  String categoryName = '';
  Color categoryColor = ShopNThriveColors.lightOceanBlue;

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

  void saveCategory(CategoriesCubit cubit) {
    String response = cubit.addCategory(categoryName, categoryColor);

    // Notify the user
    SnackBar snackbar = SnackBar(content: Text(response));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
            const FieldTitle(text: 'Name'),
            TextField(
              controller: _nameIptController,
              cursorColor: categoryColor,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'i.e. Shoes, Electronics, Food',
                hintStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const FieldTitle(text: 'Color'),
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
            ButtonMainFullWidth(
                onPressed: () => saveCategory(cubit), text: 'Save')
          ],
        ),
      );
    });
  }
}
