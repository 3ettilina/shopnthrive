import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopnthrive/create/components/components.dart';
import 'package:shopnthrive/create/state/state.dart';
import 'package:shopnthrive/router/router.dart';
import 'package:shopnthrive/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterCubit, RouterState>(builder: (context, state) {
      RouterCubit router = BlocProvider.of<RouterCubit>(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            router.screenTitle,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration:
                    BoxDecoration(color: ShopNThriveColors.lightOceanBlue),
                child: FieldTitle(text: 'Menu'),
              ),
              ListTile(
                title: const FieldTitle(
                  text: 'All products',
                ),
                onTap: () {
                  router.goToListOfProductsScreen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const FieldTitle(text: 'Create Product'),
                onTap: () {
                  router.goToCreateProductScreen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const FieldTitle(text: 'Create Category'),
                onTap: () {
                  router.goToCreateCategoryScreen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const FieldTitle(
                  text: 'Favorites',
                ),
                onTap: () {
                  router.goToListOfFavoritesScreen();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: MultiProvider(
            providers: [
              BlocProvider(create: (_) => CategoriesCubit()),
              BlocProvider(create: (_) => ProductsCubit())
            ],
            child: SingleChildScrollView(
              child: RouterManager(currentScreen: router.state),
            )),
      );
    });
  }
}
