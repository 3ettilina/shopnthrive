import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/router/router.dart';
import 'package:shopnthrive/ui/ui.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? k}) : super(key: k);
  @override
  State<StatefulWidget> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterCubit, RouterState>(builder: (context, state) {
      RouterCubit router = BlocProvider.of<RouterCubit>(context);

      return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Switch(
              value: state is CreateProductScreen,
              onChanged: (value) => value
                  ? router.goToCreateProductScreen()
                  : router.goToCreateCategoryScreen()),
          Container(
              child: state is CreateProductScreen
                  ? const CreateProductView()
                  : const CreateCategoryView()),
        ],
      ));
    });
  }
}
