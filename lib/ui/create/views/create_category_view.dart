import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shopnthrive/domain/features/features.dart';
import 'package:shopnthrive/theme.dart';
import 'package:shopnthrive/ui/create/components/components.dart';

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

  void saveCategory() async {
    Future<String> response =
        CreateCategory().execute(categoryName, categoryColor);
    String message = '';
    await response.then((value) => message = value);

    // Notify the user
    SnackBar snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
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
                                  style: Theme.of(context).textTheme.bodyText2),
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
          ButtonMainFullWidth(onPressed: () => saveCategory(), text: 'Save')
        ],
      ),
    );
  }
}
