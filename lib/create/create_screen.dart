import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/create/create_category_view.dart';
import 'package:shopnthrive/create/create_cubit.dart';
import 'package:shopnthrive/create/create_state.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? k}) : super(key: k);
  @override
  State<StatefulWidget> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCubit, CreateState>(builder: (context, state) {
      CreateCubit cubit = BlocProvider.of<CreateCubit>(context);
      String title =
          state is CreateProduct ? 'Create Product' : 'Create Category';

      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Switch(
                value: state is CreateProduct,
                onChanged: (value) => cubit.changeCreateType(value)),
            Container(
                child: state is CreateProduct
                    ? Container(
                        color: Colors.amber,
                        child:
                            const Center(child: Text('Create product section')),
                      )
                    : const CreateCategoryView()),
          ],
        ),
      );
    });
  }
}
