import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopnthrive/router/router.dart';
import 'package:shopnthrive/strings.dart';
import 'package:shopnthrive/theme.dart';
import 'ui/ui.dart';

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
                title: FieldTitle(
                  text: ShopNThriveStrings.productsListScreenTitle(),
                ),
                onTap: () {
                  router.goToListOfProductsScreen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: FieldTitle(
                    text: ShopNThriveStrings.createProductScreenTitle()),
                onTap: () {
                  router.goToCreateProductScreen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: FieldTitle(
                    text: ShopNThriveStrings.createCategoryScreenTitle()),
                onTap: () {
                  router.goToCreateCategoryScreen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: FieldTitle(
                  text: ShopNThriveStrings.favoritesListScreenTitle(),
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
            providers: [BlocProvider(create: (_) => ProductImageCubit())],
            child: SingleChildScrollView(
              child: RouterManager(currentScreen: router.state),
            )),
      );
    });
  }
}
