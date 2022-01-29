import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopnthrive/create/create_screen.dart';
import 'package:shopnthrive/create/state/state.dart';

class Home extends StatelessWidget {
  const Home({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          BlocProvider(create: (_) => CreateCubit()),
          BlocProvider(create: (_) => CategoriesCubit()),
          BlocProvider(create: (_) => ProductsCubit())
        ],
        child: const CreateScreen(),
      ),
    );
  }
}
