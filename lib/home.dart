import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopnthrive/router/router.dart';
import 'package:shopnthrive/strings.dart';
import 'package:shopnthrive/theme.dart';
import 'package:shopnthrive/ui/menu/menu_item.dart';
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
              DrawerHeader(
                  decoration: const BoxDecoration(
                      color: ShopNThriveColors.lightOceanBlue),
                  child: Center(
                      child: ListTile(
                    title: Text(
                      ShopNThriveStrings.menuHeaderTitle(),
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Colors.white),
                    ),
                    subtitle: Text(
                      ShopNThriveStrings.menuHeaderSubTitle(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Colors.white),
                    ),
                  ))),
              MenuItem(
                  title: ShopNThriveStrings.productsListScreenTitle(),
                  icon: Icons.list,
                  onTap: () {
                    router.goToListOfProductsScreen();
                    Navigator.pop(context);
                  }),
              MenuItem(
                  title: ShopNThriveStrings.favoritesListScreenTitle(),
                  icon: Icons.favorite_border_rounded,
                  onTap: () {
                    router.goToListOfFavoritesScreen();
                    Navigator.pop(context);
                  }),
              MenuItem(
                  title: ShopNThriveStrings.createProductScreenTitle(),
                  icon: Icons.add_shopping_cart_outlined,
                  onTap: () {
                    router.goToCreateProductScreen();
                    Navigator.pop(context);
                  }),
              MenuItem(
                  title: ShopNThriveStrings.createCategoryScreenTitle(),
                  icon: Icons.add_box_outlined,
                  onTap: () {
                    router.goToCreateCategoryScreen();
                    Navigator.pop(context);
                  }),
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
